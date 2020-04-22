
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
                    <div class="head1" align="center"><strong>Driver List Form</strong></div>
                    <div class="center-content" style="height: 530px; width:850px; overflow: auto;">
                        <form  action="sign_Up" method="post" enctype="multipart/form-data">
                            <table width="100%">
                                <%
                                            String msg = (String) session.getAttribute("Message");

                                %>



                                <tr class="heading_lable">
                                    <td width="8%">
                                        &nbsp;&nbsp;Driver&nbsp;ID&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Driver&nbsp;Name&nbsp;&nbsp;
                                    </td>
                                    <td width="8%">
                                        &nbsp;&nbsp;Cab&nbsp;Allocation&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Cab&nbsp;Type&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Client&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Source&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Destination&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td width="10%">
                                        &nbsp;&nbsp;Date&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <%
                                            Connection con = null;
                                            PreparedStatement pst = null;
                                            ResultSet rst = null;
                                            try {
                                                con = connection.Connect.makeCon();
                                                String query = "select * from bookcabreply where a12 ='" + msg + "'";

                                                pst = con.prepareStatement(query);
                                                rst = pst.executeQuery();
                                                while (rst.next()) {

                                %>
                                <tr bgcolor="wheat">
                                    <td><%= rst.getString(7)%></td>
                                    <td><%= rst.getString(8)%></td>
                                    <td><%= rst.getString(9)%></td>
                                    <td><%= rst.getString(12)%></td>
                                    <td><%= rst.getString(2)%></td>
                                    <td><%= rst.getString(3)%></td>
                                    <td><%= rst.getString(4)%></td>
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