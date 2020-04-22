<%--
    Document   : index
    Created on : Feb 26, 2011, 11:37:52 AM
    Author     : softavate
--%>
<%
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
            String username = null;
            username = (String) session.getAttribute("LOGIN");
            if (username != null) {

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="alexaVerifyID" content="YfJ4jOeiCLNj9D49jz21k-n2M8w" />
        <link href="css/stylesheet.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="js/javascript.js"></script>
        <title>Add Contact</title>
    </head>

    <script type="text/javascript">
        function contact(i)
        {
            if(i.value.length>0)
            {
                i.value = i.value.replace(/[^\d]+/g, '');

            }
        }
        function CheckForAlphabets(elem)
        {
            var alphaExp = /^[a-z A-Z]+$/;
            if(elem.value.match(alphaExp)){
                return true;
            }else{
                alert("give alphabatic name ");
                return false;
            }
        }
        function mob()
        {
            var rl=document.getElementById("cn1").value;
            if(rl.toString().length<10)
            {
                alert("Contact No. should be of ten digits");
                return false;
            }

        }
    </script>
    <script type="text/javascript">
        function valid() {
            //alert('calling');
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            // var address = document.forms[form_id].elements[txtemail_id].value;
            var address = document.getElementById('nm2').value;
            if(reg.test(address) == false) {
                alert('Invalid Email Address');
                return false;
            }
        }
    </script>
    <body>
        <!--start main container-->
        <div id="main_container">
            <!--container-->
            <div id="container">
                <!--start header wrap-->
                <%@include file="header_member.html" %>
                <div class="body_wrap">
                    <!--start body-cont-col-->
                    <div class="body-cont-col">
                        <div style="height: 20px;"></div>
                        <div class="head1"><strong>Safer Transport</strong></div>
                        <div class="left_body">
                            <div class="text">
                                <span style="padding-left: 20px;text-align: justify;" class="text" >
                                    <form action="contact" method="post" style="width: 100%" >
                                        <table style="background-color:#bcbfc1;margin-top: 5%;margin-left:5%; width: 100%" >
                                            <%
                                                         String msg1 = null;
                                                         msg1 = (String) session.getAttribute("MSG1");
                                                         if (msg1 != null) {
                                            %>
                                            <tr>
                                                <td style="font-family: verdana;color: #9999ff;font-size: 14px" align="center" colspan="2"><%=msg1%></td>
                                            </tr>
                                            <%
                                                             session.removeAttribute("MSG1");
                                                         } else {
                                                             session.setAttribute("MSG1", "");
                                                         }
                                            %>
                                            <tr>
                                                <td>
                                                    <fieldset width="100%" >
                                                        <legend>Add Contacts</legend>
                                                        <table cellpadding="10" cellspacing="10"  >
                                                            <tr>
                                                                <td>
                                                                    Name
                                                                </td>
                                                                <td> <input type="text" size="25"  id="txtname" name="txtname"></td>
                                                                <td>
                                                                    Contact Number
                                                                </td>
                                                                <td> <input type="text" size="25"  id="cn1" name="cn1" onkeyup="contact(this)" onblur="mob()"></td>
                                                            </tr>
                                                            <tr> <input type="hidden" name="txtUsername" id="txtUsername" value="<%=username%>"/>
                                                            <td>
                                                                Email&nbsp;ID
                                                            </td>
                                                            <td> <input type="text" size="25"  id="nm2" name="nm2" onblur="valid()"></td>

                                                            </tr>


                                                            <tr>
                                                                <td colspan="4">
                                                                    <input type="submit"  name="btnsubmit" value="Submit" >
                                                                    <input type= "reset" value="Reset">
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </fieldset>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </span>
                            </div>
                        </div>
                        <div class="right_body">
                            <%@include file="rithtmenu.jsp" %>
                        </div>



                    </div><!--end body wrap-->
                </div>
                <!--start body wrap-->

                <%@include file="footer.html" %>

            </div><!--end container-->

        </div><!--end main container-->
    </body>
</html>
<%
            } else {


                response.sendRedirect("logout.jsp");
            }
%>