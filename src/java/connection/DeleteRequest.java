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
import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author softavate
 */
public class DeleteRequest extends HttpServlet {

    HttpSession session = null;
    String id = null;
    Connection con1 = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        session = request.getSession(true);

        response.setContentType("text/xml");
      id = request.getParameter("id");

        PrintWriter out = response.getWriter();
        try {
            con1 = connection.Connect.makeCon();

            PreparedStatement pst22 = con1.prepareStatement("delete from  bookcab where a1=?");
            pst22.setString(1, id);

            int i = pst22.executeUpdate();
            RequestDispatcher rd = request.getRequestDispatcher("/BookingList.jsp");
            rd.forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();
        }

    }
}
