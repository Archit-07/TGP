
<html> <script src="scw.js" type="text/javascript"></script>
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
              function pass1()
        {
            var rl=document.getElementById("pwd").value;
            if(rl.toString().length<6)
            {
                alert("Password   should be of six digits");
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
         <script type="text/javascript">
            function validate12(){
                if(document.getElementById('uname').value == "")
                {
                    alert(' Name Field Cannot be Blank Left !!');
                    return false;
                }
                if(document.getElementById('pwd').value == "")
                {
                    alert('Password Field Name Field Cannot be Blank Left !!');
                    return false;
                }
                if(document.getElementById('txtImage').value == "")
                {
                    alert('Image Field Name Field Cannot be Blank Left !!');
                    return false;
                }
                if(document.getElementById('txtname').value == "")
                {
                    alert('First Name Field Cannot be Blank Left !!');
                    return false;
                }
                if(document.getElementById('txtlname').value == "")
                {
                    alert('Student  Last Name Field Cannot be Blank Left !!');
                    return false;
                }
                if(document.getElementById('cmbgender').value == "")
                {
                    alert('Select Gender... !!');
                    return false;
                }
                if(document.getElementById('txtdb').value == "")
                {
                    alert('Select Date of Birth.... !!');
                    return false;
                }
                if(document.getElementById('number').value == "")
                {
                    alert('Contact Number Field Cannot be Blank Left !!');
                    return false;
                }
                if(document.getElementById('txtemail').value == "")
                {
                    alert('Email Field Name Field Cannot be Blank Left !!');
                    return false;
                }
                if(document.getElementById('txtaddress').value == "")
                {
                    alert('Address Name Field Cannot be Blank Left !!');
                    return false;
                }
            
                if(document.getElementById('txtpin').value == "")
                {
                    alert('Pin Field Name Field Cannot be Blank Left !!');
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
                 <form  action="sign_Up" method="post" enctype="multipart/form-data">
                            <table  border="0" cellspacing="20" cellpadding="8" style align="center">
                                <tr>
                                    <td>
                                        <fieldset>
                                            <legend>Login Information</legend>
                                            <table cellpadding="5" cellspacing="5">
                                                <tr>
                                                    <td class="text"><span style="color: red;"></span>User Id:</td>
                                                    <td> <input type= "text" size="25"  id="txthidden" name="txthidden" value="<%=id%>"></td>
                                                    <td class="text"><span style="color: gray;">*</span> User Name:</td>
                                                    <td class="text-1"><input type="text" size="25"  id="uname" name="uname"></td>

                                                </tr>
                                                <tr>
                                                        <td class="text"><span style="color: red;">*</span>Password :</td>
                                                    <td> <input type= "password" size="25"  id="pwd" name="pwd" onblur="pass1()"></td>
                                                    <td class="text"><span style="color: red;">*</span>Confirm Password :</td>
                                                    <td> <input type= "password" size="25"  id="cpwd" name="cpwd"></td>

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
                                                    <td class="text">
                                                        Add Image
                                                    </td>
                                                    <td>
                                                        <input type="file" name="txtImage" id="txtImage"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text"><span style="color: red;">*</span>First Name:</td>
                                                    <td><input type="text" size="25"  id="txtname" name="txtname" onblur=" CheckForAlphabets(this)" ></td>
                                                    <td class="text"><span style="color: red;">*</span>Last Name :</td>
                                                    <td> <input type= text size="25"  id="txtlname" name="txtlname" onblur=" CheckForAlphabets(this)" ></td>
                                                </tr>
                                                <tr>
                                                    <td class="text"><span style="color: red;">*</span>
                                                        Gender
                                                    </td>
                                                    <td class="text">
                                                        <select  id="cmbgender" name="cmbgender" style="width: 180px">
                                                            <option value="Select"> - - - - - - - - - Select- - - - - - - - - </option>
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                        </select>
                                                    </td>
                                                    <td class="text"><span style="color: red;">*</span>Date of Birth</td>
                                                    <td> <input type= text size="25" name="txtdb"  id="txtdb" readonly onclick="scwShow(this,event)" ></td>
                                                </tr>
                                                <tr>
                                                    <td class="text"><span style="color: red;">*</span>Contact Number:</td>
                                                    <td> <input type= text size="25"  id="number" name="number" onkeyup="contact(this)" onblur="mob()"></td>
                                                    <td class="text"><span style="color: red;">*</span>Email Id:</td>
                                                    <td><input type="text" size="25" id="txtemail" name="txtemail"  onblur="valid()"></td>
                                                </tr>
                                                <tr>
                                                    <td class="text">Address:<span style="color: red;">*</span></td>
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
                                                <tr>
                                                    <td class="text">Pin Code:<span style="color: red;">*</span></td>
                                                    <td> <input type= text size="25"  id="txtpin" name="txtpin" onkeyup="contact(this)" onblur="pin()"></td>
                                                    <td class="text">State:<span style="color: red;">*</span></td>
                                                    <td><input type= text size="25"  id="txtstate" name="txtstate"></td>
                                                </tr>
                                                <tr>
                                                    <td class="text">Country:</td>
                                                    <td>
                                                        <select  id="cmbcountry"name="cmbcountry" style="width:180px">
                                                            <option value="Select">- - - - Select - - - - </option>
                                                            <option value="America">America</option>
                                                            <option value="Australia">Australia</option>
                                                            <option value="Africa">Africa</option>
                                                            <option value="Bangalore">Bangalore</option>
                                                            <option value="Bangkok">Bangkok</option>
                                                            <option value="India">India</option>
                                                            <option value="Afghanistan">Afghanistan</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="color: red"><%=msg%></td>
                                </tr>
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