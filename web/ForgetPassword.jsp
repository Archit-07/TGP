 <%@page import="java.sql.*" %>
<html>
    <script type="text/javascript">
        function contact(i)
        {
            if(i.value.length>0)
            {
                i.value = i.value.replace(/[^\d]+/g, '');

            }
        }
        function mob()
        {
            var rl=document.getElementById("number").value;
            if(rl.toString().length<10)
            {
                alert("Contact No. should be of ten digits");
                return false;
            }

        }
        function valid() {
            //alert('calling');
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            // var address = document.forms[form_id].elements[txtemail_id].value;
            var address = document.getElementById('txtemail').value;
            if(reg.test(address) == false) {
                alert('Invalid Email Address');
                return false;
            }
        }

    </script>
    <%
                String msg = (String) session.getAttribute("MSG");
                String id = connection.Auto_Gen_ID.globalGenId("User-", "user");
    %>
    <head>
        <meta charset="UTF-8">
        <title>Flash Cab</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div id="page">
            <%@include file="header.html" %>
            <div id="body">
                <div id="content">
                    <h1>Safer Transport</h1>
                    <table  border="0" cellspacing="20" cellpadding="8" style align="center">
                        <tr>
                            <td>
                                <fieldset>
                                    <legend>Change Password</legend>
                                    <form method="post" action="">
                                        <table width="500px" align="center" cellpadding="4" cellspacing="4">


                                            <tr>
                                                <td class="text">User ID</td>
                                                <td><input type="text" name="txtopwd" id="txtopwd" class="input_text" size="30"></td>
                                            </tr>
                                            


                                            <tr><td>&nbsp;</td></tr>
                                            <tr valign="top">

                                                <td>
                                                    <input type="submit" value="Submit" name="btnsubmit" class="button">
                                                    
                                                   
                                                </td>
                                                  <%
                                                        PreparedStatement pst = null;
                                                        Connection con = null;
                                                        ResultSet rst = null;
                                                        String name = null;
                                                        String mobileNo = null;
                                                        String passw = null;


                                                        String a=request.getParameter("txtopwd");
                                                        
                                                        try {
                                                            con = connection.Connect.makeCon();
                                                            String query = "select * from signup where UserID='"+a+"'";
                                                            pst = con.prepareStatement(query);
                                                            rst = pst.executeQuery();
                                                            while (rst.next()) 
                                                            {
                                                              
                                                                passw = rst.getString(3);
                                                            }

                                            %>
                                            <tr bgcolor="wheat">

                                               
                                                <td align="center" width="55%"><%=passw%></td>

                                            </tr>
                                            <%                                                  
                                                            
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                            %>
                                            </tr>
                                        </table>
                                    </form>
                                </fieldset>
                            </td>
                        </tr>

                        <tr>
                            <td align="center" style="color: red"><%=msg%></td>
                        </tr>

                    </table>
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