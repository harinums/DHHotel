<%-- 
    Document   : bookRoom
    Created on : 6 Jun 2024, 10:31:14 pm
    Author     : nurs2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book Room</title>
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
            height: 40px;
            border-radius: 50%;
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
        .room-container {
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
    </style>
</head>
<body>
    <div class="navbar">
        <img class="nav-logo" src="image/logo.png" alt="Hotel Logo">
        <a href="index.jsp">Home</a>
        <a href="booking.jsp">Booking</a>
        <a href="Room.jsp">Room</a>
        <a href="LoginPage.jsp">Login</a>
    </div>
    <div class="room-container">
        <h3>Book Room</h3>
        <div class="content">
            <%
                String guestName = request.getParameter("guestName");
                String contactDetails = request.getParameter("contactDetails");
                String checkInDate = request.getParameter("checkInDate");
                String checkOutDate = request.getParameter("checkOutDate");
                String roomType = request.getParameter("roomType");
                String roomNumber = request.getParameter("roomNumber");
                String maxOccupancy = request.getParameter("maxOccupancy");
                String specialRequests = request.getParameter("specialRequests");

                // Database connection details
                String url = "jdbc:mysql://localhost:3306/hotel";
                String user = "root";
                String password = "admin";

                Connection conn = null;
                PreparedStatement insertStmt = null;
                PreparedStatement updateStmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);

                    // Insert booking details into booking table
                    String insertQuery = "INSERT INTO booking (guestName, contactDetails, checkInDate, checkOutDate, roomType, roomNumber, maxOccupancy, specialRequests) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    insertStmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                    insertStmt.setString(1, guestName);
                    insertStmt.setString(2, contactDetails);
                    insertStmt.setDate(3, java.sql.Date.valueOf(checkInDate));
                    insertStmt.setDate(4, java.sql.Date.valueOf(checkOutDate));
                    insertStmt.setString(5, roomType);
                    insertStmt.setInt(6, Integer.parseInt(roomNumber));
                    insertStmt.setInt(7, Integer.parseInt(maxOccupancy));
                    insertStmt.setString(8, specialRequests);

                    int result = insertStmt.executeUpdate();

                    if (result > 0) {
                        // Get the auto-generated booking ID
                        rs = insertStmt.getGeneratedKeys();
                        if (rs.next()) {
                            int bookingId = rs.getInt(1);
                            out.println("<div class='success'><h3>Booking successful!</h3></div>");
                            out.println("<div class='booking-info'>");
                            out.println("<p>Booking ID: " + bookingId + "</p>");
                            out.println("<p>Guest Name: " + guestName + "</p>");
                            out.println("<p>Contact Details: " + contactDetails + "</p>");
                            out.println("<p>Check-In Date: " + checkInDate + "</p>");
                            out.println("<p>Check-Out Date: " + checkOutDate + "</p>");
                            out.println("<p>Room Type: " + roomType + "</p>");
                            out.println("<p>Room Number: " + roomNumber + "</p>");
                            out.println("<p>Max Occupancy: " + maxOccupancy + "</p>");
                            out.println("<p>Special Requests: " + specialRequests + "</p>");
                            out.println("</div>");
                        }
                    } else {
                        out.println("<div class='error'><h3>Booking failed. Please try again.</h3></div>");
                    }

                } catch (Exception e) {
                    out.println("<div class='error'><h3>Error: " + e.getMessage() + "</h3></div>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (insertStmt != null) insertStmt.close();
                        if (updateStmt != null) updateStmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
            <a href="index.jsp" class="button">Go back to home</a>
        </div>
    </div>
    <div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: +6012-334-567</p>
        <p><i class="fas fa-envelope"></i> Email Address: SVTHotel@gmail.com</p>
    </div> 
</body>
</html>
