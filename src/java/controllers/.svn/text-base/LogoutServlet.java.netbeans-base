/*
 * Logout Servlet
 * 
 * @author Hunter Harbin
 */
package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet{
    
    protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {

         HttpSession session = request.getSession();
         session.setAttribute("userid", null);
         
	response.setHeader("Cache-Control", "no-cache, no-store");
	response.setHeader("Pragma", "no-cache");

	request.getSession().invalidate();
	response.sendRedirect(request.getContextPath() + "/logoutsuccess.jsp");
}
}
