/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

public class BookCabReply extends HttpServlet {

    static Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String a1 = null;
    String a2 = null;
    String a3 = null;
    String a4 = null;
    String a5 = null;
    String a6 = null;
    String a7 = null;
    String a8 = null;
    String a9 = null;
    String a10 = null;
    String a11 = null;
    String a12 = null;
    String a13 = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        a1 = request.getParameter("txthidden");
        a2 = request.getParameter("uname");
        a3 = request.getParameter("pick");
        a4 = request.getParameter("drop");
        a5 = request.getParameter("picktime");
        a6 = request.getParameter("nomem");
        a7 = request.getParameter("cmbempid");
        a8 = request.getParameter("txtdname");
        a9 = request.getParameter("txtcabn");
        a10 = request.getParameter("txtcontactd");
        a11 = request.getParameter("txtcabtype");
        a12 = request.getParameter("txtbranch");
          a13 = request.getParameter("emailid");
        if (a1 != null) {
            try {
                conn = connection.Connect.makeCon();
                String query = "Insert into bookcabreply(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,date,a11,a12,a13)values(?,?,?,?,?,?,?,?,?,?,now(),?,?,?)";
                System.out.println("cccccccc" + query);
                pst = conn.prepareStatement(query);
                pst.setString(1, a1);
                pst.setString(2, a2);
                pst.setString(3, a3);
                pst.setString(4, a4);
                pst.setString(5, a5);
                pst.setString(6, a6);
                pst.setString(7, a7);
                pst.setString(8, a8);
                pst.setString(9, a9);
                pst.setString(10, a10);
                pst.setString(11, a11);
                pst.setString(12, a12);
                   pst.setString(13, a13);
                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {
                    String message = "Welcome To Safe Cab Booking So. Dear Mr./Mrs.  " + a2 + " Your Cab Allocation Number Is: " + a9 + " Thanking and Regard's On Safe Cab Booking";

                    SendMail1 sd = new SendMail1();
                    String rech = sd.mailNotification(a13, "Email Notification", message);
                    response.sendRedirect("BookingList.jsp");
                } else {

                    response.sendRedirect("BookingList.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }
}
