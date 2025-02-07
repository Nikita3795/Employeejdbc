<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show Employees</title>
</head>
<body>
    <h2>Employee List</h2>
    <%
        String url = "jdbc:mysql://localhost:3306/EmployeeDB";
        String user = "root";  // Replace with your MySQL username
        String password = "root";  // Replace with your MySQL password
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM Employees");
    %>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Salary</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("department") %></td>
            <td><%= rs.getBigDecimal("salary") %></td>
         
        </tr>
        <%
            }
        %>
    </table>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
 <br>

<form action="DeleteEmployeeServlet" method="post">
<input type="number" id="id" name="id" placeholder="please enter id to delete">
<button type="submit">Delete</button>
</form>
<br>
<br>

<form action="UpdateEmployeeServlet" method="post">
id : <input type="number" id="id" name="id" placeholder="please enter id"> <br>
name : <input type="text" id="name" name="name" placeholder="please enter name"> <br>
dept : <input type="text" id="department" name="department" placeholder="please enter id"> <br>
salary : <input type="number" id="id" name="id" placeholder="please enter id"> <br>
<br> <button type="submit">Update employee</button>
</form>

</body>
</html>
