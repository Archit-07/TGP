
<html>
    <head>
        <meta charset="UTF-8">
        <title>Safer Transport</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div id="page">
           <%@include file="header.html" %>
            <div id="body">
                <div id="content">
                    <h1>Enquiry Form...</h1>
                      <form action="Enquiry" method="post">
                        <table align="center" cellpadding="3" cellspacing="3">
                            <tr>
                                <td></td>
                            </tr>
                         
                            <%
                                        String msg = null;
                                        msg = (String) session.getAttribute("MSG");
                                        if (msg != null) {
                            %>
                            <tr>
                                <td style="font-family: verdana;color: red;font-size: 10px" align="center" colspan="2"><%=msg%></td>
                            </tr>
                            <%
                                            session.removeAttribute("MSG");
                                        } else {
                                            session.setAttribute("MSG", "");
                                        }
                            %>

                            <tr>
                                <td class="form-field1" align="left">Name</td>
                                <td class="form-field1" align="left"><input type="text" name="txtname"  id="txtname"size="35"></td>
                            </tr>
                            <tr>
                                <td class="form-field1" align="left">Email</td>
                                <td class="form-field1" align="left"><input type="text" name="txtemail" id="txtemail" size="35" onblur="valid()"></td>
                            </tr>
                            <tr>
                                <td class="form-field1" align="left">Contact No.</td>
                                <td class="form-field1" align="left"><input type="text" name="txtcontactno" id="txtcontactno" size="35" onkeyup="contact(this)" onblur="mob()"></td>
                            </tr>

                            <tr>
                                <td class="form-field1" align="left" >
                                    Feedback / Suggestion*&nbsp;&nbsp;

                                </td>
                                <td>
                                    <select name="cmbfeedback" id="cmbfeedback" style="width:240px;">
                                        <option value="Feedback">Feedback</option>
                                        <option value="Suggestion">Suggestion</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="form-field1" align="left">Remarks*</td>
                                <td class="form-field1" align="left">
                                    <textarea style="width:240px;height: 50px;" name="txtarearemarks" id="txtarearemarks">

                                    </textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="form-field1" align="center" width="40%">&nbsp;</td>
                                <td class="form-field1" align="left">
                                    <input type="submit" name="btnsubmit" class="button" value="Submit">
                                    <input type="reset" name="btnreset" class="button" value="Reset">
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