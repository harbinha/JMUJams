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
public class SettingsServlet extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        Integer userid = (Integer)session.getAttribute("userid");
        String password = request.getParameter("pass1");
        String shuffle = request.getParameter("shuffle");
        String genre = request.getParameter("genre");
        
        ProfileHandler ph = new ProfileHandler(userid.intValue());
        
        if(!password.equals("")) {
            ph.updatePassword(password);
        }
        
        if(shuffle != null) {
            ph.updateShuffle("on");
        } else {
            ph.updateShuffle("off");
        }
        
        ph.updatePrefGenre(genre);        
        
        response.sendRedirect("settings.jsp");
        
    }
}
