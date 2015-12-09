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

    public String[] getItems() {
	String[] s = new String[v.size()];
	v.copyInto(s);
	return s;
    }
    
    public void processRequest(HttpServletRequest request) {
	// null value for submit - user hit enter instead of clicking on 
	// "add" or "remove"
	if (submit == null) 
	    addItem(item);

	if (submit.equals("add"))
	    addItem(item);
	else if (submit.equals("remove")) 
	    removeItem(item);
	
	// reset at the end of the request
	reset();
    }

    // reset
    private void reset() {
	submit = null;
	item = null;
    }
}
