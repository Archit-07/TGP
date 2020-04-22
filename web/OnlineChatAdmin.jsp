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
    <% String userid = (String) session.getAttribute("ADMIN");
                String msg = (String) session.getAttribute("MSG");
                String id = connection.Auto_Gen_ID.globalGenId("D-", "d");
    %><script src="scw.js" type="text/javascript"></script>
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
                       <form action="onlineChatAdmin" method="post">
                                    <table  align="center">


                                        <tr>
                                            <td class="text-1">
                                                User&nbsp;Name
                                            </td><td>


                                                <select name="cmbempid" id="cmbempid" style="width:37Px;">
                                                    <option value="na" selected> - - - - - Select - - - - </option>
                                                    <%
                                                                PreparedStatement pst2 = null;
                                                                Connection con2 = null;
                                                                ResultSet rst2 = null;
                                                                try {
                                                                    con2 = connection.Connect.makeCon();
                                                                    String query = "select uname from signup";
                                                                    pst2 = con2.prepareStatement(query);
                                                                    rst2 = pst2.executeQuery();
                                                                    while (rst2.next()) {

                                                    %>
                                                    <option value="<%=rst2.getString(1)%>"><%=rst2.getString(1)%></option>

                                                    <%
                                                                    }
                                                                } catch (Exception e) {
                                                                    e.printStackTrace();
                                                                }
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td height="15%" size="20"colspan="2">
                                                <div id="ReloadThis" style="border-style: outset;border: 1px solid gray;height: 130px;width: 180px;overflow: auto;">

                                                    <%     Statement st = null;
                                                                Connection conn = null;
                                                                ResultSet result = null;
                                                                conn =connection.Connect.makeCon();

                                                                try {
                                                                   String query = "select id,mess from chatting where sid='" + userid + "'";
                                                                    System.out.println("query is " + query);
                                                                    st = conn.createStatement();
                                                                    result = st.executeQuery(query);

                                                    %>

                                                    <%
                                                                                                                            while (result.next()) {

                                                                                                                                String name = result.getString(1);
                                                                                                                                String message = result.getString(2);


                                                    %>
                                                    <span style="font-size: 12px;color: green;font-weight: bold;"><%=name%></span>
                                                    &nbsp;:&nbsp;<span style="font-size: 12px;color: black;font-weight: bold;"><%=message%></span><br/>

                                                    <%
                                                                                                                            }
                                                    %>

                                                    <%
                                                                    st.close();
                                                                    conn.close();
                                                                } catch (Exception e) {
                                                                }

                                                    %>

                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><input type="text" name="txtmessage" id="txtmessage" size="20"></td>
                                            <td>
                                                <input type="hidden" name="txtid" id="txtid" value="<%=userid%>">

                                            </td>
                                            <td>
                                                <input type="submit" name="btnsubmit" id="btnsubmit" value="Send"/>
                                            </td>
                                        </tr>


                                    </table>
                                </form>
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
<%
            } else {


                response.sendRedirect("logout.jsp");
            }
%>