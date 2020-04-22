<%-- 
    Document   : bookcab_code
    Created on : 12 Apr, 2019, 7:49:32 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@page import="java.sql.*" %>
 <%@ page import ="java.util.Random"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    
     String a1 = null;
    String a2 = null;
    String a3 = null;
    String a4 = null;
    String a5 = null;
    String a6 = null;
    String a7 = null;
    String a8 = null;
    String a9 = null;
    String a10 = null;
    String a11 = null;
    String a12 = null;
    String a13 = null;
    String a14 = null;
    
    
     a1 = request.getParameter("txthidden");
        a2 = request.getParameter("uname");
        a3 = request.getParameter("pick");
        a4 = request.getParameter("drop");
        a5 = request.getParameter("picktime");
        a6 = request.getParameter("nomem");
        a7 = request.getParameter("number");
        a8 = request.getParameter("txtemail");
        a9 = request.getParameter("txtaddress");
        a10 = request.getParameter("cmbcity");
        a11 = request.getParameter("cabtype");
        a12 = request.getParameter("txtbranch");
    //String randno="44";
       
                 Random rand=new Random(); 
                                int randno=rand.nextInt((1000-500)+1)+500;
                session.setAttribute("pr", "Your Booking Price: "+randno);
                
                          try {
                conn = connection.Connect.makeCon();
                String query = "Insert into bookcab(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,date,a11,a12,price)values(?,?,?,?,?,?,?,?,?,?,now(),?,?,?)";
                System.out.println("cccccccc" + query);
                pst = conn.prepareStatement(query);
                pst.setString(1, a1);
                pst.setString(2, a2);
                pst.setString(3, a3);
                pst.setString(4, a4);
                pst.setString(5, a5);
                pst.setString(6, a6);
                pst.setString(7, a7);
                pst.setString(8, a8);
                pst.setString(9, a9);
                pst.setString(10, a10);
                pst.setString(11, a11);
                pst.setString(12, a12);
               pst.setInt(13,randno);
                int j = 0;
                j = pst.executeUpdate();
                
                  
                
                response.sendRedirect("BookCab.jsp");
                 } 
                          catch (Exception e) 
                          {
                           e.printStackTrace();
                         }
              
                          
            %>
    </body>
</html>
