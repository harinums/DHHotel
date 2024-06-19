<%-- 
    Document   : confirmBooking
    Created on : 22 May 2024, 12:45:11 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Confirmation</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                height: 100vh;
                justify-content: center;
                align-items: center;
                background-color: #c3e4ec;
            }
            .navbar {
                width: 100%;
                background-color: #f3f3f3;
                overflow: hidden;
                display: flex;
                justify-content: space-around;
                padding: 10px;
                background-color: #009999;
                align-items: center
            }
            .navbar a {
                padding: 14px 20px;
                text-decoration: none;
                display: block;
                color: black;
            }
            .navbar a:hover {
                background-color: #ddd;
            }
            .booking-details {
                text-align: center;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                width: 100%;
                box-sizing: border-box;
            }
            .booking-details p {
                font-size: 18px;
                margin: 10px 0;
            }
            .booking-details button {
                background-color: #3399ff;
                color: black;
                padding: 10px;
                border: 1px solid black;
                cursor: pointer;
                width: 100%;
                margin-top: 20px;
            }
            .footer {
                width: 100%;
                padding: 10px;
                text-align: center;
                background-color: #009999;
                align-items: center
            }
             .dropdown {
            position: relative;
            display: inline-block;
            margin: 15px 10px; /* Adjust the margin as needed to align the dropdown with other navbar items */
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            z-index: 1;
            margin-top: 10px; /* Adjust the margin-top as needed for vertical alignment */
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #3e8e41;
        }
        
    </style>
</head>
<body>

 <div class="navbar">
         <img src="hotelogo.jpeg" alt="Logo">
        <a href="home.jsp">Home</a>
        <a href="booking.jsp">Booking</a>
        <a href="LogInUser.jsp">Login</a>
        <div class="dropdown">
    <span class="dropbtn" onclick="toggleDropdown()">Register <i class="fas fa-caret-down"></i></span>
    <div class="dropdown-content" id="registerDropdown">
        <a href="register.jsp">Customer</a>
        <a href="staffRegister.jsp">Staff</a>
    </div>
</div>
    </div>

        <div class="booking-details">
            <%
                // Retrieve form parameters
                String checkInDate = request.getParameter("check-in");
                String checkOutDate = request.getParameter("check-out");
                String guestNum = request.getParameter("guestNum");
                String roomType = request.getParameter("type_room");

                // Calculate number of days
                java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
                java.util.Date checkIn = format.parse(checkInDate);
                java.util.Date checkOut = format.parse(checkOutDate);
                long diff = checkOut.getTime() - checkIn.getTime();
                long days = java.util.concurrent.TimeUnit.DAYS.convert(diff, java.util.concurrent.TimeUnit.MILLISECONDS);

                // Room prices per night
                int pricePerNight = 0;
                if ("suite".equals(roomType)) {
                    pricePerNight = 400;
                } else if ("deluxe".equals(roomType)) {
                    pricePerNight = 500;
                } else if ("single".equals(roomType)) {
                    pricePerNight = 200;
                }

                // Total price calculation
                int totalPrice = (int) (pricePerNight * days);

                // Display booking details
                out.println("<p>You have booked a " + roomType + " room from " + checkInDate + " to " + checkOutDate + " for " + guestNum + " guests.</p>");
                out.println("<p>The total price is RM" + totalPrice + ".</p>");
            %>
            <form action="confirmBooking.jsp" method="post">
                <input type="hidden" name="check-in" value="<%= checkInDate %>">
                <input type="hidden" name="check-out" value="<%= checkOutDate %>">
                <input type="hidden" name="guestNum" value="<%= guestNum %>">
                <input type="hidden" name="type_room" value="<%= roomType %>">
                <input type="hidden" name="total_price" value="<%= totalPrice %>">
                <button type="submit">Proceed Booking</button>
            </form>
        </div>

        <div class="footer">
            <p>Contact Us</p>
            <p><i class="fas fa-phone-alt"></i> Phone: +0012-334-007</p>
            <p><i class="fas fa-envelope"></i> Email Address: 577hotel@gmail.com</p>
        </div>
    </body>
</html>
