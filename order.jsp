<%-- 
    Document   : order.jsp
    Created on : Nov 1, 2022, 9:19:49 AM
    Author     : muzamil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
 <%
          
        //Use a try/catch block to catch any database exceptions
        try { 
            //Create a connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/classicmodels", "root", "admin");

            //Create a new SQL statement using the connection
            Statement stmt = con.createStatement();


            //Execute the SQL statement to retrieve a result set of records from the database.
            //This SQL query will retrieve all of the records in the products table
            ResultSet rs = stmt.executeQuery("SELECT * from orders where ordernumber = '" + request.getParameter("orderNumber") +"'");  

            //Use a while loop to iterate through the resultset of records
            while (rs.next()){
                //print out the data in ProduceName column in the current record
                //The first column contains product name so we are calling the getString() method to retrieve it.
                %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>classicmodles - <%=rs.getString(1)%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    </head>
    <body>


<table border="0">                   
    <thead>
        <tr>
            <th colspan="2"><%=rs.getString(1)%></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>product code: </strong></td>
            <td><span style="font-size:smaller; font-style:italic;">$<%=rs.getString(2)%></span></td>
        </tr>
        <tr>
            <td><strong>quantity ordered: </strong></td>
            <td><span style="font-size:smaller; font-style:italic;"><%=rs.getString(3)%></span></td>
        </tr>
        <tr>
            <td><strong>price : </strong></td>
            <td><span style="font-size:smaller; font-style:italic;"><%=rs.getString(4)%></span>
            </td>
        </tr>
    </tbody>
</table>
                    <%
            }//end while loop
               //Close the connection to the database
            con.close();

        }catch(Exception e){
            out.println(e);
        } //end try catch
            %>
    </body>
</html>
