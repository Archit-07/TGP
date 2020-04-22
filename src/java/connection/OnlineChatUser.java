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

public class OnlineChatUser extends HttpServlet {

    static Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String id = null;
    String sid = null;
    String mess = null;
  int i;
     static String tempDeviceName;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        id = request.getParameter("txtid");

        System.out.println("pppppppppppppppppppppppppppp");
        sid = request.getParameter("cmbempid");
        mess = request.getParameter("txtmessage");


        if (id != null) {
            try {
                conn = connection.Connect.makeCon();
                String query = "Insert into chatting(id,sid,mess,date)values(?,?,?,now())";
                System.out.println("cccccccc" + query);
                pst = conn.prepareStatement(query);
                pst.setString(1, id);
                pst.setString(2, sid);
                pst.setString(3, mess);




                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {





                    session.setAttribute("MSG", "New Message is Send !!");
                    response.sendRedirect("OnlineChatUser.jsp");
                } else {
                    session.setAttribute("MSG", "New Message is Not Send !!");
                    response.sendRedirect("OnlineChatUser.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }


}
