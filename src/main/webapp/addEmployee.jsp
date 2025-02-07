<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add Employee</h2>
    <form action="AddEmployeeServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="department">Department:</label>
        <input type="text" id="department" name="department" required><br>
        <label for="salary">Salary:</label>
        <input type="number" id="salary" name="salary" step="0.01" required><br>
        <input type="submit" value="Add Employee">
    </form>
</body>
</html>
