<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Choose Room</title>
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
        .room {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .room-image {
            flex: 1;
            margin-right: 20px;
        }
        .room-details {
            flex: 2;
        }
        .room img {
            width: 100%;
            border-radius: 8px;
        }
        .room-info {
            margin-top: 10px;
            line-height: 1.5;
        }
        .room-select-button {
            background-color: #3399ff;
            color: black;
            padding: 10px;
            border: 1px solid black;
            cursor: pointer;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
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
    <h3>Choose a Room</h3>

    <%
        String guestName = request.getParameter("guestName");
        String contactDetails = request.getParameter("contactDetails");
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String roomType = request.getParameter("roomType");
        String maxOccupancy = request.getParameter("maxOccupancy");
        String specialRequests = request.getParameter("specialRequests");

        // Output booking details for debugging
        out.println("<p>Guest Name: " + guestName + "</p>");
        out.println("<p>Contact Details: " + contactDetails + "</p>");
        out.println("<p>Check-In Date: " + checkInDate + "</p>");
        out.println("<p>Check-Out Date: " + checkOutDate + "</p>");
        out.println("<p>Room Type: " + roomType + "</p>");
        out.println("<p>Max Occupancy: " + maxOccupancy + "</p>");
        out.println("<p>Special Requests: " + specialRequests + "</p>");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "admin");
            String sql = "SELECT roomNumber,features FROM rooms WHERE roomType = ? AND availability = 'Available' ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, roomType);
            rs = pstmt.executeQuery();

            boolean hasResults = false;
            while (rs.next()) {
                hasResults = true;
                int roomNumber = rs.getInt("roomNumber");
                String features = rs.getString("features");
                String image = "";

                if (roomNumber >= 1 && roomNumber <= 3 && "Standard".equalsIgnoreCase(roomType)) {
                    image = "image/room" + roomNumber + ".jpg";
                } else if (roomNumber >= 4 && roomNumber <= 6 && "Double".equalsIgnoreCase(roomType)) {
                    image = "image/room" + roomNumber + ".jpg";
                } else if (roomNumber >= 7 && roomNumber <= 10 && "Suite".equalsIgnoreCase(roomType)) {
                    image = "image/room" + roomNumber + ".jpg";
                }

                if (!image.isEmpty()) {
    %>
                    <div class="room">
                        <div class="room-image">
                            <img src="<%= image %>" alt="Room Image">
                        </div>
                        <div class="room-details">
                            <h4>Room <%= roomNumber %></h4>
                            <p class="room-info">Features: <%= features %></p>
                            <a class="room-select-button" href="bookRoom.jsp?guestName=<%= guestName %>&contactDetails=<%= contactDetails %>&checkInDate=<%= checkInDate %>&checkOutDate=<%= checkOutDate %>&roomType=<%= roomType %>&roomNumber=<%= roomNumber %>&maxOccupancy=<%= maxOccupancy %>&specialRequests=<%= specialRequests %>">Select Room</a>
                        </div>
                    </div>
    <%
                }
            }
            if (!hasResults) {
                out.println("<p>No available rooms found for the selected type.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>
</div>

<div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: +6012-334-567</p>
        <p><i class="fas fa-envelope"></i> Email Address: SVTHotel@gmail.com</p>
    </div>

<script>
    function changeColor(element) {
        document.querySelectorAll('.navbar a').forEach(item => item.style.color = 'black');
        element.style.color = 'red';
    }
</script>
</body>
</html>

