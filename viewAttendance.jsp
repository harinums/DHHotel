<%-- 
    Document   : viewAttendance
    Created on : 18 Jun 2024, 10:02:35 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Attendance</title>
        <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #c3e4ec;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            width: 100%;
            background-color: #009999;
            display: flex;
            justify-content: space-around;
            padding: 10px;
        }
        .navbar img {
            height: 50px;
            margin-right: 20px;
        }
        .navbar a {
            padding: 14px 20px;
            text-decoration: none;
            color: black;
        }
        .navbar a:hover {
            color: red;
        }
        .container {
            flex: 1;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #009999;
            color: white;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 60px;
            margin: 2px 0;
        }
        button:hover {
            background-color: #0069d9;
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
        }
        .footer {
            width: 100%;
            padding: 10px;
            text-align: center;
            background-color: #009999;
        }
        .off-text {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>View Attendance</h2>
        <table>
            <tr>
                <th>Username</th>
                <th>Name</th>
                <th>Clock In</th>
                <th>Clock Out</th>
                <th>Absence Reason</th>
                <th>Action</th>
            </tr>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "admin");
                    String query = "SELECT * FROM attendance";
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        String username = rs.getString("username");
                        String name = rs.getString("name");
                        String clockIn = rs.getString("clockIn");
                        String clockOut = rs.getString("clockOut");
                        String absenceReason = rs.getString("absenceReason");
            %>
            <tr>
                <td><%= username %></td>
                <td><%= name %></td>
                <td><%= clockIn %></td>
                <td><%= clockOut %></td>
                <td><%= absenceReason != null ? absenceReason : "N/A" %></td>
                <td>
                    <form action="EditAttendanceServlet" method="GET">
                        <input type="hidden" name="username" value="<%= username %>">
                        <button type="submit">Edit</button>
                    </form>
                    <form action="DeleteAttendanceServlet" method="POST">
                        <input type="hidden" name="username" value="<%= username %>">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
            %>
        </table>
        <button type="button" onclick="location.href='AttendanceStaff.jsp';">Back</button>
    </div>
        
        <div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: +6012-334-567</p>
        <p><i class="fas fa-envelope"></i> Email Address: SVTHotel@gmail.com</p>
    </div>
</body>
</html>

