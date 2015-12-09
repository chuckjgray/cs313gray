/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kapangyarihan
 */
public class PaypalManager {
	// production creds
//	protected static String API_USERNAME = "xxxxxxxxxxxxxxxxxxxxxxxx";
//	protected static String API_PASSWORD = "XXXXXXXXXXXXX";
//	protected static String API_SIGNATURE = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
//	protected static String API_URL = "https://api-3t.paypal.com/nvp";
//	protected static String REDIRECT_URL = "https://www.paypal.com/cgibin/webscr?cmd=_express-checkout";
	
	// sandbox creds
	protected static String API_USERNAME = "jomish2323-facilitator_api1.gmail.com";
	protected static String API_PASSWORD = "69977U8N3WW5NVMP";
	protected static String API_SIGNATURE = "AFcWxV21C7fd0v3bYYYRCpSSRl31A4Qp.kjcuJ1.Tzd0KsHVAI81sBBR";
	protected static String API_URL = "https://api-3t.sandbox.paypal.com/nvp";
	protected static String REDIRECT_URL = "https://www.sandbox.paypal.com/webscr?cmd=_express-checkout";
	
	/** User will return to this page after the sale is successful */
	protected static String RETURN_URL = "http://localhost:8080/teamshop/confirmation.jsp?";
	
	/** User will return here if they hit the cancel button during purchase */
	protected static String CANCEL_URL = "http://localhost:8080/teamshop/buyshirt.jsp?";

	//protected final static Logger log = Logger.getLogger(PayPalManager.class.getName());
        private static Object ArrayUtils;
	
	/**
	 * Step 1: SetExpressCheckout
	 * 
	 * The first step of Express Checkout for Digital Goods: send a SetExpressCheckout
	 * request to PayPal and receive a token in response. Redirect the user to Paypal,
	 * then wait for their return through either the returnUrl or cancelUrl.
	 * 
	 * As of version 69.0, digital payments must set L_PAYMENTREQUEST_0_ITEMCATEGORY0=Digital, 
	 * must specify NOSHIPPING=1 and REQCONFIRMSHIPPING=0, 
	 * must use both AMT and ITEMAMT, and must have exactly one 
	 * payment (PAYMENTREQUEST_0_[...]) and one item (L_PAYMENTREQUEST_0_[...]0).
	 * https://cms.paypal.com/us/cgi-bin/?cmd=_render-content&content_ID=developer/e_howto_api_nvp_r_SetExpressCheckout
	 *
	 * @param userId The user's unique id in our system
	 * @param itemId The unique id in our system for the thing being bought
	 * @param itemName Shown in paypal as the name of the thing being bought eg "Dapper hat"
	 * @param itemDescription Shown in paypal beneath the item name eg "A virtual item in the game Incredipede"
	 * @param itemPriceDollars String price in USD must include decimal and two digits after eg "10.00"
	 */
	public static String startPurchase (int userId, int itemId, String itemName, String itemDescription, 
		String itemPriceDollars, HttpServletResponse resp)
	{
		// include the userId and itemId in the return urls so we can access them later
		String returnUrl = encodeValue(RETURN_URL + "&userId=" + userId + "&itemId=" + itemId + "&price=" + itemPriceDollars);
		String cancelUrl = encodeValue(CANCEL_URL + "&userId=" + userId + "&itemId=" + itemId);
		
		String data = 
			"METHOD=SetExpressCheckout" +
			getAuthenticationData() +
			"&REQCONFIRMSHIPPING = 0" +
			"&NOSHIPPING = 1" +
			"&ALLOWNOTE = 0" +
			"&PAYMENTREQUEST_0_PAYMENTACTION=Sale" +
			"&PAYMENTREQUEST_0_CURRENCYCODE=USD" + 
			getPurchaseData(userId, itemId, itemName, itemDescription, itemPriceDollars) + 
			"&RETURNURL=" + returnUrl + 
			"&CANCELURL=" + cancelUrl +
			"";

		// tell paypal we want to start a purchase
		HashMap<String, String> results = doServerCall(data);
		
		// forward the user on to payapal's site with the token identifying this transaction
		try {
			String token = results.get("TOKEN");
			String redirectUrl = resp.encodeRedirectURL(REDIRECT_URL + "&token=" + token);
			//log.info("Sending user to paypal: " + redirectUrl);
			resp.sendRedirect(redirectUrl);
                        return token;
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("Failed to open PayPal link: " + e.getMessage());
		}
	}
	
	/**
	 * Step 2: GetExpressCheckoutDetails
	 * 
	 * Second step, performed when the user returns from paypal to validate the transaction
	 * details. If we cared about shipping info, the user's name etc it would be fetched here.
	 * Throws an exception if userId or purchase details don't match paypal's values, or if
	 * there's a problem with the purchase itself.
	 * https://cms.paypal.com/us/cgi-bin/?cmd=_render-content&content_ID=developer/e_howto_api_nvp_r_GetExpressCheckoutDetails
	 * 
	 * @param token The token created and returned by Paypal in step 1 (from the return url)
	 * @param userId The user's unique id in our system (from the return url)
	 * @param itemId The unique id in our system for the thing being bought (from the return url)
	 * @return Returns the user's paypal PayerId for use in the last step
	 */
	public static String validateDetails(String token, int userId, int itemId)
	{
		String data = 
			"METHOD=GetExpressCheckoutDetails" +
			getAuthenticationData() +
			"&TOKEN=" + encodeValue(token) +
			"";
	
		HashMap<String, String> results = doServerCall(data);

		int resultsUserId = Integer.parseInt(results.get("PAYMENTREQUEST_0_CUSTOM"));
		if (resultsUserId != userId) {
			throw new RuntimeException("UserId does not match.");
		}
		
		int resultsItemId = Integer.parseInt(results.get("PAYMENTREQUEST_0_INVNUM"));
		if (resultsItemId != itemId) {
			throw new RuntimeException("ItemId does not match.");
		}
		
		String payerId = results.get("PAYERID");
		if (payerId == null || payerId.trim().length() == 0) {
			throw new RuntimeException("Payment has not been initiated by the user.");
		}
		
		return payerId;
	}
	
	/**
	 * Step 3: DoExpressCheckoutPayment
	 * 
	 * Completes the payment that has already been started and authorized by the user
	 * via the paypal website. Requires passing in purchase information again.
	 * https://cms.paypal.com/us/cgi-bin/?cmd=_render-content&content_ID=developer/e_howto_api_nvp_r_DoExpressCheckoutPayment
	 * 
	 * @param userId The user's unique id in our system
	 * @param itemId The unique id in our system for the thing being bought
	 * @param itemName Shown in paypal as the name of the thing being bought eg "Dapper hat"
	 * @param itemDescription Shown in paypal beneath the item name eg "A virtual item in the game Incredipede"
	 * @param itemPriceDollars String price in USD must include decimal and two digits after eg "10.00"
	 */
	public static void finishPurchase(String token, String payerId, int userId, int itemId, String itemName, 
		String itemDescription, String itemPriceDollars)
	{
		try {
			String data = 
				"METHOD=DoExpressCheckoutPayment" +
				getAuthenticationData() +
				"&TOKEN=" + encodeValue(token) +
				"&PAYERID=" + encodeValue(payerId) +
				getPurchaseData(userId, itemId, itemName, itemDescription, itemPriceDollars) + 
				"";
		
			HashMap<String, String> results = doServerCall(data);
			
			// warn if transaction type isn't completed or on the way to completed
			String status = results.get("PAYMENTINFO_0_PAYMENTSTATUS");
			if (status == null || !(status.equalsIgnoreCase("Completed") 
				|| status.equalsIgnoreCase("In-Progress")
				|| status.equalsIgnoreCase("Processed") 
				|| status.equalsIgnoreCase("Completed-Funds-Held"))) {
				//ActionHandler.log.warning("Unexpected paypal purchase status: " + status 
				//	+ " for userId=" + userId + ", paypal payerId=" + payerId 
				//	+ ", transaction=" + results.get("PAYMENTINFO_0_TRANSACTIONID"));
			}
			
		// must rollback purchase if anything happens here, so make sure we catch them all
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}
	
	/**
	 * Return the name-value-pair parameters required for SetExpressCheckout and 
	 * DoExpressCheckoutPayment steps.
	 *
	 * @param userId The user's unique id in our system
	 * @param itemId The unique id in our system for the thing being bought
	 * @param itemName Shown in paypal as the name of the thing being bought eg "Dapper hat"
	 * @param itemDescription Shown in paypal beneath the item name eg "A virtual item in the game Incredipede"
	 * @param itemPriceDollars String price in USD must include decimal and two digits after eg "10.00"
	 */
	protected static String getPurchaseData(int userId, int itemId, String itemName, 
		String itemDescription, String itemPriceDollars)
	{
		return 
			"&PAYMENTREQUEST_0_AMT=" + itemPriceDollars + 
			"&PAYMENTREQUEST_0_ITEMAMT=" + itemPriceDollars + 
			"&PAYMENTREQUEST_0_DESC=" + itemDescription + 
			"&PAYMENTREQUEST_0_CUSTOM=" + userId + 
			"&PAYMENTREQUEST_0_INVNUM=" + itemId + 
			"&L_PAYMENTREQUEST_0_NAME0=" + itemName + 
			"&L_PAYMENTREQUEST_0_DESC0=" + itemDescription + 
			"&L_PAYMENTREQUEST_0_AMT0=" + itemPriceDollars + 
			"&L_PAYMENTREQUEST_0_QTY0=" + 1 + 
			"&L_PAYMENTREQUEST_0_ITEMCATEGORY0=Digital" +
			"";
	}

	/**
	 * Return the name-value-pair parameters required for all paypal api calls 
	 * to authenticate the seller account.
	 */
	protected static String getAuthenticationData()
	{
		return 
			"&VERSION=69.0" +
			"&USER=" + API_USERNAME +
			"&PWD=" + API_PASSWORD +
			"&SIGNATURE=" + API_SIGNATURE +
			"";
	}
	
	/**
	 * Send off the given data to PayPal's API and return the result in key-value pairs.
	 * Validate the ACK return value from paypal and throw an exception if it isn't "Success".
	 */
	protected static HashMap<String, String> doServerCall (String data)
	{
		//log.info("Sending data to paypal: " + data);
	
		String response = "";
		try {
			URL postURL = new URL(API_URL);
			HttpURLConnection conn = (HttpURLConnection)postURL.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setConnectTimeout(3000);
			conn.setReadTimeout(7000);
			conn.setRequestMethod("POST");
			
			DataOutputStream output = new DataOutputStream(conn.getOutputStream());
			output.writeBytes(data);
			output.flush();
			output.close();

			// Read input from the input stream.
			int responseCode = conn.getResponseCode();
			if (responseCode != HttpURLConnection.HTTP_OK) {
				throw new RuntimeException("Error " + responseCode + ": " + conn.getResponseMessage());
			}
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = null;
			while(((line = reader.readLine()) !=null)) {
				response = response + line;
			}
			reader.close();
		} catch(IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}

		//log.info("Got response from paypal: " + response);
		if(response.length() <= 0) {
			throw new RuntimeException("Received empty response");
		}
		HashMap<String, String> results = parsePaypalResponse(response);
		
		// first check for the new version (PAYMENTINFO_0_ACK)
		String ackString = results.get("PAYMENTINFO_0_ACK");
		if (ackString == null || !(ackString.equalsIgnoreCase("Success") || ackString.equalsIgnoreCase("SuccessWithWarning"))) {
			String errorCode = results.get("PAYMENTINFO_0_ERRORCODE");
			String errorLongMsg = results.get("PAYMENTINFO_0_LONGMESSAGE");
			if (errorCode != null && errorCode.trim().length() > 0) {
				throw new RuntimeException("Purchase Failed (code " + errorCode + "): " + errorLongMsg);
			}
			
			// sometimes API returns old version ACK instead of PAYMENTINFO_0_ACK
			ackString = results.get("ACK");
			if (ackString == null || !(ackString.equalsIgnoreCase("Success") || ackString.equalsIgnoreCase("SuccessWithWarning"))) {
				errorCode = results.get("L_ERRORCODE0");
				errorLongMsg = results.get("L_LONGMESSAGE0");
				throw new RuntimeException("Purchase Failed (code " + errorCode + "): " + errorLongMsg);
			}
		}
		
		return results;
	}
	
	/**
	 * Parse results from PayPal to a map of name/value pairs. Their format looks like: 
	 * "TOKEN=EC%2d80X519901R8632201&TIMESTAMP=2012%2d07%2d13T09%3a57%3a44Z&ACK=Success"
	 */
	protected static HashMap<String, String> parsePaypalResponse (String data)
	{
		HashMap<String, String> results = new HashMap<String, String>();
		StringTokenizer tokenizer = new StringTokenizer(data, "&");
		while (tokenizer.hasMoreTokens()) {
			StringTokenizer tokenizer2 = new StringTokenizer(tokenizer.nextToken(), "=");
			if (tokenizer2.countTokens() != 2) {
				continue;
			}
			String key = decodeValue(tokenizer2.nextToken());
			String value = decodeValue(tokenizer2.nextToken());
			results.put(key.toUpperCase(), value);
		}
		return results;
	}
	
	/**
	 * Prepare a given string for transmission via HTTP. Spaces become %20, etc.
	 */
	protected static String encodeValue(String value)
	{
		try {
			return URLEncoder.encode(value, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	/**
	 * Undo encoding of string that was sent via HTTP. %20 becomes a space, etc.
	 */
	protected static String decodeValue(String value)
	{
		try {
			return URLDecoder.decode(value, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
        
        public static Map<String, String> splitQuery(URL url) throws UnsupportedEncodingException {
    Map<String, String> query_pairs = new LinkedHashMap<String, String>();
    String query = url.getQuery();
    String[] pairs = query.split("&");
    for (String pair : pairs) {
        int idx = pair.indexOf("=");
        query_pairs.put(URLDecoder.decode(pair.substring(0, idx), "UTF-8"), URLDecoder.decode(pair.substring(idx + 1), "UTF-8"));
    }
    return query_pairs;
}
}
