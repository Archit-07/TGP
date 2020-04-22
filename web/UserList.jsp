<%
         response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
         response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
         response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
         response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
         String username = null;
         username = (String) session.getAttribute("ADMIN");
         if (username != null) {

%>
<html>

    <%@page import="java.sql.*" %>
    <head>
        <meta charset="UTF-8">
        <title>Flash Cab</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div id="page">
            <%@include file="admin.html" %>
            <div id="body">
                <div id="content">
                    <h1>Safer Transport</h1>
                    <div class="head1" align="center"><strong>User List Form</strong></div>
                    <div class="center-content" style="height: 530px; width: 900px; overflow: auto;">
                    <form  action="sign_Up" method="post" enctype="multipart/form-data">
                        <table width="100%">
                                 <tr>
                                <td>
                                    <h2>
                                        <a href="FeedbackList.jsp">Feedback Details</a>
                                    </h2>
                                </td>
                            </tr>
                            <tr class="heading_lable">
                                <td width="8%">
                                    &nbsp;&nbsp;User&nbsp;ID&nbsp;&nbsp;
                                </td>
                                <td width="10%">
                                    &nbsp;&nbsp;User&nbsp;Name&nbsp;&nbsp;
                                </td>
                                <td width="12%">
                                    &nbsp;&nbsp;First&nbsp;Name&nbsp;&nbsp;
                                </td>
                                <td width="12%">
                                    &nbsp;&nbsp;Last&nbsp;Name&nbsp;&nbsp;
                                </td>

                                <td width="10%">
                                    &nbsp;&nbsp;Gender&nbsp;&nbsp;
                                </td>
                                <td width="10%">
                                    &nbsp;&nbsp;DOB&nbsp;&nbsp;
                                </td>
                                <td width="10%">
                                    &nbsp;&nbsp;Contact&nbsp;No&nbsp;&nbsp;
                                </td>
                                <td width="10%">
                                    &nbsp;&nbsp;Email&nbsp;ID&nbsp;&nbsp;
                                </td>
                                <td width="10%">
                                    &nbsp;&nbsp;City&nbsp;&nbsp;
                                </td>
                                <td width="10%">
                                    &nbsp;&nbsp;Pin Code&nbsp;&nbsp;
                                </td>
                                <td width="10%">
                                    &nbsp;&nbsp;Country&nbsp;&nbsp;
                                </td>
                            </tr>
                            <%
                                        Connection con = null;
                                        PreparedStatement pst = null;
                                        ResultSet rst = null;
                                        try {
                                            con = connection.Connect.makeCon();
                                            String query = "select userid,uname,firstname,lastname,gender,dob,contactno,emailid,city,pincode,country from signup";

                                            pst = con.prepareStatement(query);
                                            rst = pst.executeQuery();
                                            while (rst.next()) {

                            %>
                            <tr bgcolor="wheat">
                                <td><%= rst.getString(1)%></td>
                                <td><%= rst.getString(2)%></td>
                                <td><%= rst.getString(3)%></td>
                                <td><%= rst.getString(4)%></td>
                                <td><%= rst.getString(5)%></td>
                                <td><%= rst.getString(6)%></td>
                                <td><%= rst.getString(7)%></td>
                                <td><%= rst.getString(8)%></td>
                                <td><%= rst.getString(9)%></td>
                                <td><%= rst.getString(10)%></td>
                                <td><%= rst.getString(11)%></td>
                            </tr>
                            <%

                                            }
                                        } catch (Exception e) {
                                        }


                            %>
                        </table>
                    </form>
                    </div>
                </div>
            </div>
            <div id="footer">

                <p>
				
                </p>
            </div>
        </div>
    </body>
</html>

<%
            } else {


                response.sendRedirect("logout.jsp");
            }
%>