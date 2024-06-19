<%-- 
    Document   : ManageShift
    Created on : 22 May 2024, 3:43:25 pm
    Author     : USER
--%>

<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Shift</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #c3e4ec;
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
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #009999;
            color: white;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="time"], select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0069d9;
        }
        .footer {
            width: 100%;
            padding: 10px;
            text-align: center;
            background-color: #009999;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <img src="hotelogo.jpeg" alt="Logo">
        <a href="user.jsp">User</a>
        <a href="staff.jsp">Staff</a>
        <a href="ManageShift.jsp">Manage Shift</a>
        <a href="TrackAttendance.jsp">Track Attendance</a>
        <a href="AdminLogin.jsp">Logout</a>
    </div>

    <div class="container">
        <h2>Manage Shifts</h2>
        <form action="saveShiftServlet" method="post">
            <table>
                <tr>
                    <th>Username</th>
                    <th>Name</th>
                    <th>Role</th>
                    <th>Time In</th>
                    <th>Time Out</th>
                    <th>Days</th>
                </tr>
                <%
                    // Database connection
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "admin");
                        String query = "SELECT username, name, role FROM staff WHERE role = 1";
                        ps = con.prepareStatement(query);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            String username = rs.getString("username");
                            String name = rs.getString("name");
                            String role = rs.getString("role");
                %>
                <tr>
                    <td><input type="text" name="username" value="<%= username %>" readonly></td>
                    <td><input type="text" name="<%= username %>_name" value="<%= name %>" readonly></td>
                    <td>
                        <select name="<%= username %>_role">
                            <option value="housekeeping" <%= "housekeeping".equals(role) ? "selected" : "" %>>Housekeeping</option>
                            <option value="receptionist" <%= "receptionist".equals(role) ? "selected" : "" %>>Receptionist</option>
                            <option value="lobby" <%= "lobby".equals(role) ? "selected" : "" %>>Lobby & Reservation</option>
                        </select>
                    </td>
                    <td><input type="time" name="<%= username %>_timeIn" step="900"></td>
                    <td><input type="time" name="<%= username %>_timeOut" step="900"></td>
                    <td>
                        <label><input type="checkbox" name="<%= username %>_day[]" value="Sunday"> Sunday</label>
                        <label><input type="checkbox" name="<%= username %>_day[]" value="Monday"> Monday</label>
                        <label><input type="checkbox" name="<%= username %>_day[]" value="Tuesday"> Tuesday</label>
                        <label><input type="checkbox" name="<%= username %>_day[]" value="Wednesday"> Wednesday</label>
                        <label><input type="checkbox" name="<%= username %>_day[]" value="Thursday"> Thursday</label>
                        <label><input type="checkbox" name="<%= username %>_day[]" value="Friday"> Friday</label>
                        <label><input type="checkbox" name="<%= username %>_day[]" value="Saturday"> Saturday</label>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    }
                %>
            </table>
            <button type="submit">Save Shifts</button>
        </form>
    </div>

    <div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: +6012-334-567</p>
        <p><i class="fas fa-envelope"></i> Email Address: SVTHotel@gmail.com</p>
    </div>
</body>
</html>
