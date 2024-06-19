<%-- 
    Document   : deleteBooking
    Created on : 11 Jun 2024, 8:54:10 am
    Author     : nurs2
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Booking</title>
    <link rel="stylesheet" type="text/css" href="stylecar.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            justify-content: space-between;
            align-items: center;
            background-color: #f3f3f3;
        }
        .nav-logo {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            cursor: pointer;
        }
        .navbar {
            width: 100%;
            background-color: #009999;
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            box-sizing: border-box;
        }
        .navbar img {
            height: 50px;
            margin-right: 20px;
        }
        .navbar a {
            padding: 14px 20px;
            text-decoration: none;
            color: black;
            flex: 1;
            text-align: center;
            box-sizing: border-box;
        }
        .navbar a:hover {
            background-color: #ddd;
        }
        .footer {
            width: 100%;
            padding: 10px;
            text-align: center;
            background-color: #009999;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 300px;
            box-sizing: border-box;
            text-align: center;
        }
        h3 {
            color: #333;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 5px;
            color: #ffffff;
            background-color: #007bff;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .button-delete {
            background-color: #FF0000;
        }
        .button-delete:hover {
            background-color: #CC0000;
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
        <h3>Delete Booking</h3>
        <% 
            String bookingId = request.getParameter("id");
            String url = "jdbc:mysql://localhost:3306/hotel";
            String user = "root";
            String password = "admin";

            Connection conn = null;
            PreparedStatement pstmt = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                String query = "DELETE FROM booking WHERE bookingId=?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, bookingId);
                
                int rowsAffected = pstmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    out.println("<p>Booking deleted successfully.</p>");
                } else {
                    out.println("<p>Failed to delete booking. Please try again.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        <a href="manageBooking.jsp" class="button">Back to Manage Bookings</a>
    </div>
        <div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: +6012-334-567</p>
        <p><i class="fas fa-envelope"></i> Email Address: SVTHotel@gmail.com</p>
    </div>
</body>
</html>

