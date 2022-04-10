/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SIVASANKAR
 */
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class AttributeListener implements HttpSessionAttributeListener {

	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		String attributeName = event.getName();
		Object attributeValue = event.getValue();
                System.out.println("Attribute added : " + attributeName + " : " + attributeValue);
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		String attributeName = event.getName();
		Object attributeValue = event.getValue();
                System.out.println("Attribute removed : " + attributeName + " : " + attributeValue);
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		String attributeName = event.getName();
		Object attributeValue = event.getValue();
		System.out.println("Attribute replaced : " + attributeName + " : " + attributeValue);	
	}
}

