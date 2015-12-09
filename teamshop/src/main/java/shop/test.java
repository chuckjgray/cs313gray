/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop;

import com.paypal.base.ConfigManager;
import com.paypal.base.Constants;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;

import java.io.PrintWriter;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
//import com.paypal.api.payments.util.GenerateAccessToken;
//import com.paypal.api.payments.util.ResultPrinter;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.paypal.base.rest.PayPalResource;
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author Kapangyarihan
 */
@WebServlet(name = "test", urlPatterns = {"/test"})
public class test extends HttpServlet {

    private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger
			.getLogger(test.class);
	Map<String, String> map = new HashMap<String, String>();

	public void init(ServletConfig servletConfig) throws ServletException {
            
            	InputStream is = test.class
				.getResourceAsStream("/sdk_config.properties");
		try {
			PayPalResource.initConfig(is);
		} catch (PayPalRESTException e) {
			LOGGER.fatal(e.getMessage());
		}

	}
        
       public static String getAccessToken() throws PayPalRESTException {

		// ###AccessToken
		// Retrieve the access token from
		// OAuthTokenCredential by passing in
		// ClientID and ClientSecret
		String clientID = ConfigManager.getInstance().getValue(Constants.CLIENT_ID);
		String clientSecret = ConfigManager.getInstance().getValue(
				Constants.CLIENT_SECRET);

		return new OAuthTokenCredential(clientID, clientSecret)
				.getAccessToken();
	}
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet test</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet test at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        createPayment(request, response);
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
        //processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    public Payment createPayment(HttpServletRequest req, HttpServletResponse resp) {
		Payment createdPayment = null;
                APIContext apiContext = null;
		String accessToken = null;
                try
                {
                    accessToken = getAccessToken();
                }
                catch(PayPalRESTException e)
                {
                    
                }
                apiContext = new APIContext(accessToken);
		if (req.getParameter("PayerID") != null) {
			Payment payment = new Payment();
			if (req.getParameter("guid") != null) {
				payment.setId(map.get(req.getParameter("guid")));
			}

			PaymentExecution paymentExecution = new PaymentExecution();
			paymentExecution.setPayerId(req.getParameter("PayerID"));
			try {
				createdPayment = payment.execute(apiContext, paymentExecution);
				//ResultPrinter.addResult(req, resp, "Executed The Payment", Payment.getLastRequest(), Payment.getLastResponse(), null);
			} catch (PayPalRESTException e) {
				//ResultPrinter.addResult(req, resp, "Executed The Payment", Payment.getLastRequest(), null, e.getMessage());
			}
		} else {
                    Details details = new Details();
                    details.setShipping("1");
                    details.setSubtotal("5");
                    details.setTax("1");
                    
                    Amount amount = new Amount();
                    amount.setCurrency("USD");
                    
                    amount.setTotal("7");
                    amount.setDetails(details);
                    
                    Transaction transaction = new Transaction();
                    transaction.setAmount(amount);
                    transaction
			.setDescription("This is the payment transaction description.");
                    
                    Item item = new Item();
			item.setName("Ground Coffee 40 oz").setQuantity("1").setCurrency("USD").setPrice("5");
			ItemList itemList = new ItemList();
			List<Item> items = new ArrayList<Item>();
			items.add(item);
			itemList.setItems(items);
			
			transaction.setItemList(itemList);
                        
                        List<Transaction> transactions = new ArrayList<Transaction>();
			transactions.add(transaction);
                        
                        Payer payer = new Payer();
			payer.setPaymentMethod("paypal");
                        
                        Payment payment = new Payment();
			payment.setIntent("sale");
			payment.setPayer(payer);
			payment.setTransactions(transactions);
                        
                        RedirectUrls redirectUrls = new RedirectUrls();
			String guid = UUID.randomUUID().toString().replaceAll("-", "");
			redirectUrls.setCancelUrl(req.getScheme() + "://"
					+ req.getServerName() + ":" + req.getServerPort()
					+ req.getContextPath() + "/paymentwithpaypal?guid=" + guid);
			redirectUrls.setReturnUrl(req.getScheme() + "://"
					+ req.getServerName() + ":" + req.getServerPort()
					+ req.getContextPath() + "/paymentwithpaypal?guid=" + guid);
			payment.setRedirectUrls(redirectUrls);
                        
                        try {
				createdPayment = payment.create(apiContext);
				LOGGER.info("Created payment with id = "
						+ createdPayment.getId() + " and status = "
						+ createdPayment.getState());
                        Iterator<Links> links = createdPayment.getLinks().iterator();
				while (links.hasNext()) {
					Links link = links.next();
					if (link.getRel().equalsIgnoreCase("approval_url")) {
						req.setAttribute("redirectURL", link.getHref());
					}
				}
				//ResultPrinter.addResult(req, resp, "Payment with PayPal", Payment.getLastRequest(), Payment.getLastResponse(), null);
				map.put(guid, createdPayment.getId());
			} catch (PayPalRESTException e) {
				//ResultPrinter.addResult(req, resp, "Payment with PayPal", Payment.getLastRequest(), null, e.getMessage());
			}
		}
		return createdPayment;
	}
}
