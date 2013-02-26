package controllers;

import handlers.ProfileHandler;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ryan Pitts
 */
public class UpdateProfileServlet extends HttpServlet {

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        Integer userid = (Integer)session.getAttribute("userid");
        String prefName = request.getParameter("prefName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
                
        ProfileHandler ph = new ProfileHandler(userid.intValue());
        
        ph.updatePrefName(prefName);
        ph.updateUsername(username);
        ph.updateEmail(email);
        
        response.sendRedirect("userprofile.jsp");
    }  

}
