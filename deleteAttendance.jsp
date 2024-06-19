<%-- 
    Document   : deleteAttendance
    Created on : 18 Jun 2024, 10:03:36 PM
    Author     : User
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Attendance</title>
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
        <a href="manageBooking.jsp">Booking</a>
        <a href="Room.jsp">Room</a>
        <a href="Schedule.jsp">Shift</a>
        <a href="AttendanceStaff.jsp">Staff Attendance</a>
        <a href="AdminLogin.jsp">Logout</a>
    </div>

    <div class="container">
        <h2>Delete Attendance</h2>
        <%
            String jdbcUrl = "jdbc:mysql://localhost:3306/hotel";
            String jdbcUser = "root";
            String jdbcPassword = "admin";
            int id = Integer.parseInt(request.getParameter("id"));

            try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword)) {
                String deleteSql = "DELETE FROM attendance WHERE id=?";
                PreparedStatement deleteStatement = conn.prepareStatement(deleteSql);
                deleteStatement.setInt(1, id);

                int rowsDeleted = deleteStatement.executeUpdate();

                if (rowsDeleted > 0) {
                    out.println("<p>Attendance record deleted successfully!</p>");
                    response.sendRedirect("viewAttendance.jsp");
                } else {
                    out.println("<p>Error deleting attendance record.</p>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </div>

    <div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: +6012-334-567</p>
        <p><i class="fas fa-envelope"></i> Email Address: SVTHotel@gmail.com</p>
    </div>
</body>
</html>
