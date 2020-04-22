
<%@ page import ="java.util.Random"%>
<%
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
            String username = null;
            username = (String) session.getAttribute("USER");
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
    <%   String userid = (String) session.getAttribute("USER");
                 String msg = (String) session.getAttribute("MSG");
                 String id = connection.Auto_Gen_ID.globalGenId("B-", "b");
    %>
    <script type="text/javascript">
        function validate12(){
            if(document.getElementById('pick').value == "")
            {
                alert(' Picking Address Field Cannot be Blank Left !!');
                return false;
            }
            if(document.getElementById('drop').value == "")
            {
                alert(' Drop Address Field Name Field Cannot be Blank Left !!');
                return false;
            }
            if(document.getElementById('picktime').value == "")
            {
                alert('Timing Field Cannot be Blank Left !!');
                return false;
            }
            if(document.getElementById('nomem').value == "")
            {
                alert('Member Field Cannot be Blank Left !!');
                return false;
            }
            if(document.getElementById('number').value == "")
            {
                alert('Phone  Field Cannot be Blank Left !!');
                return false;
            }
            if(document.getElementById('txtemail').value == "")
            {
                alert('Email  Field Cannot be Blank Left !!');
                return false;
            }

        }
    </script> <head>
        <meta charset="UTF-8">
        <title>Safer Transport</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div id="page">
            <%@include file="user.html" %>
            <div id="body">
                <div id="content">
                    <h1>Safer Transport</h1>
                    <form  action="bookCab" method="post">
                        <table  border="0" cellspacing="20" cellpadding="8" style align="center">
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>Booking Information</legend>
                                        <table cellpadding="5" cellspacing="5">
                                            <tr>
                                                <td class="text"><span style="color: red;"></span>Booking Id:</td>
                                                <td> <input type= "text" size="25"  id="txthidden" name="txthidden" value="<%=id%>"></td>
                                                <td class="text"><span style="color: gray;">*</span> User Name:</td>
                                                <td class="text-1"><input type="text" size="25"  id="uname" name="uname" value="<%=userid%>" readonly></td>

                                            </tr>
                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Pick UP Place :</td>
                                                <td> <input type= "text" size="25"  id="pick" name="pick"></td>
                                                <td class="text"><span style="color: red;">*</span>Drop Place:</td>
                                                <td> <input type= "text" size="25"  id="drop" name="drop"></td>

                                            </tr>
                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Pick Up Timing:</td>
                                                <td> <input type= "text" size="25"  id="picktime" name="picktime"></td>
                                                <td class="text"><span style="color: red;">*</span>Weight Of Goods</td>
                                                <td> <input type= "text" size="25"  id="nomem" name="nomem"></td>

                                            </tr>
                                            <tr>

                                                <td class="text">Vehicle Type:</td>
                                                <td>
                                                    <select id="cabtype"   name="cabtype" style="width: 180px;">
                                                        <option value="Select"> Select </option>
                                                        <option value="2-Seater">  Heavy </option>
                                                        <option value="4-Seater"> Medium </option>
                                                        <option value="8-Seater"> Mini </option>
                                                        
                                                    </select>
                                                </td>
                                                <td class="text">Location&nbsp;:</td>
                                                <td class="text">
                                                    <select  id="txtbranch"name="txtbranch" style="width: 180px">
                                                        <option value="na" > - - - - - Select - - - - -</option>
                                                        <option value="East Delhi">East Delhi</option>
                                                        <option value="South Delhi">South Delhi</option>
                                                        <option value="North Delhi">North Delhi</option>
                                                        <option value="West Delhi">West Delhi</option>
                                                        <option value="Airline Route">Airline Route</option>
                                                        <option value="Railway Route">Railway Route</option>

                                                    </select>
                                                </td>
                                            </tr>

                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>Personal Information</legend>
                                        <table cellpadding="5" cellspacing="5">

                                            <tr>
                                                <td class="text"><span style="color: red;">*</span>Contact Number:</td>
                                                <td> <input type= text size="25"  id="number" name="number" onkeyup="contact(this)" onblur="mob()"></td>
                                                <td class="text"><span style="color: red;">*</span>Email Id:</td>
                                                <td><input type="text" size="25" id="txtemail" name="txtemail"  onblur="valid()"></td>
                                            </tr>
                                            <tr>
                                                <td class="text">Address:</td>
                                                <td><input type= text size="25"  id="txtaddress" name="txtaddress"></td>

                                                <td class="text">City:</td>
                                                <td>
                                                    <select id="cmbcity"   name="cmbcity" style="width: 180px;">
                                                        <option value="Select"> Select </option>
                                                        <option value="Delhi">  Delhi </option>
                                                        <option value="Gurgoan"> Gurgoan </option>
                                                        <option value="Noida"> Noida </option>
                                                    </select>
                                                </td>
                                            </tr>

                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                                <%
                            Random rand=new Random();
                                int randno=rand.nextInt((1000-500)+1)+500;
                               // out.print(randno);
                                %>
                                
                            
                            <tr>
                                <td align="center" style="color: red"><%=randno%></td>
                           
                            <tr>
                                <td align="center" colspan="2" >
                                    <input type="submit" value="Submit" onclick="return validate12();">
                                    <input type= "reset" value="Reset">
                                </td>
                            </tr>
                        </table>
                    </form>
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