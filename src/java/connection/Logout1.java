/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class Logout1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String logtype = null;
        logtype = request.getParameter("utype");

        if (logtype.equalsIgnoreCase("signup")) {
            HttpSession session = request.getSession();
            session.setAttribute("USER", null);
            session.invalidate();
            HttpSession sess = request.getSession(true);
            sess.setAttribute("SESSION", "Logout Successfuly !!");
            RequestDispatcher rd = request.getRequestDispatcher("logout.jsp");
            rd.forward(request, response);
        }
        if (logtype.equalsIgnoreCase("login")) {
            HttpSession session = request.getSession();
            session.setAttribute("ADMIN", null);
            session.invalidate();
            HttpSession sess = request.getSession(true);
            sess.setAttribute("SESSION", "Logout Successfuly !!");
            RequestDispatcher rd = request.getRequestDispatcher("logout.jsp");
            rd.forward(request, response);
        }
        if (logtype.equalsIgnoreCase("driverdetails")) {
            HttpSession session = request.getSession();
            session.setAttribute("DR", null);
            session.invalidate();
            HttpSession sess = request.getSession(true);
            sess.setAttribute("SESSION", "Logout Successfuly !!");
            RequestDispatcher rd = request.getRequestDispatcher("logout.jsp");
            rd.forward(request, response);
        }


    }
}
