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

public class Route extends HttpServlet {

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
    String a14 = null;
    String a15 = null;
    String a16 = null;
    String a17 = null;

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
        a10 = request.getParameter("totalkm");

        if (a1 != null) {
            try {
                conn = connection.Connect.makeCon();
                String query = "Insert into route(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,date)values(?,?,?,?,?,?,?,?,?,?,now())";
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

                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {
                    response.sendRedirect("Updateroute.jsp");
                } else {

                    response.sendRedirect("Updateroute.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }
}
