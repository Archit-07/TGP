
<html>

    <%@page import="java.sql.*" %>
    <head>
        <meta charset="UTF-8">
        <title>Safer Transport</title>
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
                       <form method="post" action="">
                        <table cellpadding="3" cellspacing="3" align="center" width="80%" class="formTable">
                            <tr>
                                <td colspan="4">
                                    <table width="100%">
                                        <tr class="heading_lable">
                                            <td align="center" class="heading" width="25%">Name</td>
                                            <td align="center" class="heading" width="20%">Mobile No</td>
                                            <td align="center" class="heading" width="55%">Feed back/Suggestion</td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div style="height: 350px;width: 100%;overflow: auto;border-style: none" class="grid">
                                        <table width="100%">

                                            <%
                                                        PreparedStatement pst = null;
                                                        Connection con = null;
                                                        ResultSet rst = null;
                                                        String name = null;
                                                        String mobileNo = null;
                                                        String feedback = null;


                                                        try {
                                                            con = connection.Connect.makeCon();
                                                            String query = "select Name,ContNo,Remarks from feed_back";
                                                            pst = con.prepareStatement(query);
                                                            rst = pst.executeQuery();
                                                            while (rst.next()) {
                                                                name = rst.getString(1);
                                                                mobileNo = rst.getString(2);
                                                                feedback = rst.getString(3);

                                            %>
                                            <tr bgcolor="wheat">

                                                <td align="center" width="25%"><%=name%></td>
                                                <td align="center" width="20%"><%=mobileNo%></td>
                                                <td align="center" width="55%"><%=feedback%></td>

                                            </tr>
                                            <%                                                  }
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                            %>
                                        </table>
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </form>
                    </div>
                </div>
            </div>
            <div id="footer">

                <p>
				Flash Cab &copy; 2014 | All Rights Reserved
                </p>
            </div>
        </div>
    </body>
</html>