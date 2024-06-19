<%-- 
    Document   : manageBooking
    Created on : 10 Jun 2024, 9:57:12 pm
    Author     : nurs2
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings</title>
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
            color: red;
        }
        .container {
            width: 80%;
            margin-top: 20px;
        }
        .content {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 20px;
        }
        .booking-info {
            margin: 20px 0;
        }
        .booking-info p {
            margin: 5px 0;
        }
        a.button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 0;
            color: #ffffff;
            background-color: #007bff;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
        a.button:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            font-weight: bold;
        }
        .success {
            color: green;
            font-weight: bold;
        }
        .footer {
            width: 100%;
            padding: 10px;
            text-align: center;
            background-color: #009999;
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
            background-color: #f4f4f4;
        }
        .button-update {
            background-color: #FFA500;
        }
        .button-update:hover {
            background-color: #FF8C00;
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
    <!-- Header -->
     <div class="navbar">
       <img src="hotelogo.jpeg" alt="Logo">
        <a href="manageBooking.jsp">Booking</a>
        <a href="Room.jsp">Room</a>
        <a href="Schedule.jsp">Shift</a>
        <a href="AttendanceStaff.jsp">Staff Attendance</a>
        <a href="AdminLogin.jsp">Logout</a>
    </div>

    <div class="container">
        <h1>Manage Bookings</h1>
        <div class="content">
            <table>
                <tr>
                    <th>Booking ID</th>
                    <th>Guest Name</th>
                    <th>Contact Details</th>
                    <th>Check-In Date</th>
                    <th>Check-Out Date</th>
                    <th>Room Type</th>
                    <th>Room Number</th>
                    <th>Max Occupancy</th>
                    <th>Special Requests</th>
                    <th>Actions</th>
                </tr>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "admin");
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM booking";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int bookingId = rs.getInt("bookingId");
                            String guestName = rs.getString("guestName");
                            String contactDetails = rs.getString("contactDetails");
                            Date checkInDate = rs.getDate("checkInDate");
                            Date checkOutDate = rs.getDate("checkOutDate");
                            String roomType = rs.getString("roomType");
                            int roomNumber = rs.getInt("roomNumber");
                            int maxOccupancy = rs.getInt("maxOccupancy");
                            String specialRequests = rs.getString("specialRequests");
                %>
                <tr>
                    <td><%= bookingId %></td>
                    <td><%= guestName %></td>
                    <td><%= contactDetails %></td>
                    <td><%= checkInDate %></td>
                    <td><%= checkOutDate %></td>
                    <td><%= roomType %></td>
                    <td><%= roomNumber %></td>
                    <td><%= maxOccupancy %></td>
                    <td><%= specialRequests %></td>
                    <td>
                        <a href="editBooking.jsp?id=<%= bookingId %>" class="button button-update">Update</a>
                        <a href="deleteBooking.jsp?id=<%= bookingId %>" class="button button-delete" onclick="return confirm('Are you sure you want to delete this booking?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </table>
        </div>
    </div>

    <div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: +6012-334-567</p>
        <p><i class="fas fa-envelope"></i> Email Address: SVTHotel@gmail.com</p>
    </div>
</body>
</html>
