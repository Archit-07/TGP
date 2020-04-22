/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

public class Enquiry extends HttpServlet {

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    String name = null;
    String email = null;
    String cont_no = null;
    String feedback = null;
    String remarks = null;
    int i;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        name = request.getParameter("txtname");
        email = request.getParameter("txtemail");
        cont_no = request.getParameter("txtcontactno");
        feedback = request.getParameter("cmbfeedback");
        remarks = request.getParameter("txtarearemarks");


        if (name != null) {
            try {
                con = connection.Connect.makeCon();
                String SqlQuery = "insert into feed_back(Name,Email,ContNo,Feedback,Remarks,Date) values(?,?,?,?,?,now())";
                ps = con.prepareStatement(SqlQuery);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, cont_no);
                ps.setString(4, feedback);
                ps.setString(5, remarks);
                i = ps.executeUpdate();
                ps.close();
                con.close();

            } catch (Exception e) {
                e.printStackTrace();
            }

            if (i > 0) {

                session.setAttribute("MSG", "Your Feedback/Suggesstion is Submited");
                response.sendRedirect("contact.jsp");
            } else {

                session.setAttribute("MSG", "Your Feedback/Suggesstion Not Submited");
                response.sendRedirect("contact.jsp");
            }


        }
    }
}
