/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SIVASANKAR
 */
import java.text.DateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
 
public class SessionCounterListener implements HttpSessionListener {
 
  private static int totalActiveSessions;
 
  public static int getTotalActiveSession(){
    return totalActiveSessions;
  }
 
  @Override
  public void sessionCreated(HttpSessionEvent httpSessionEvent) {
    totalActiveSessions++;
//    System.out.println("ADDED");
//    HttpSession httpSession = httpSessionEvent.getSession();
//    Date creationTime=new Date(httpSession.getCreationTime());
//    Date lastAccesssedTime=new Date(httpSession.getLastAccessedTime());
//    Date now=new Date();
//    DateFormat formatter=DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM);
//    System.out.println(httpSession.getId());
//    System.out.println(formatter.format(now));
//    System.out.println(formatter.format(creationTime));
//    System.out.println(formatter.format(lastAccesssedTime));
    // database call to log the log in event of the user with current time
  }
 
  @Override
  public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
    totalActiveSessions--;
//    System.out.println("REMOVED");
//    HttpSession httpSession = httpSessionEvent.getSession();
//    Date creationTime=new Date(httpSession.getCreationTime());
//    Date lastAccesssedTime=new Date(httpSession.getLastAccessedTime());
//    Date now=new Date();
//    DateFormat formatter=DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.MEDIUM);
//    System.out.println(httpSession.getId());
//    System.out.println(formatter.format(now));
//    System.out.println(formatter.format(creationTime));
//    System.out.println(formatter.format(lastAccesssedTime));
    // database call to log the log out event of the user with current time
  } 
}