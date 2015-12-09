package cart;

import java.beans.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.text.DateFormat;
import java.util.*;

public class addRemove {
 Vector v = new Vector();
    String submit = null;
    String item = null;
    
    private void addItem(String name) {
	v.addElement(name);
    }

    private void removeItem(String name) {
	v.removeElement(name);
    }

    public void setItem(String name) {
	item = name;
    }
    
    public void setSubmit(String s) {
	submit = s;
    }

    public String[] getProducts() {
	String[] s = new String[v.size()];
	v.copyInto(s);
	return s;
    }
    
    public void processRequest(HttpServletRequest request) {
	if (submit == null) 
	    addItem(item);
	if (submit.equals("add to cart"))
	    addItem(item);
	else if (submit.equals("remove from cart")) 
	    removeItem(item);
	reset();
    }

    private void reset() {
	submit = null;
	item = null;
    }
}
