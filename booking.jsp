<%-- 
    Document   : booking
    Created on : 23 May 2024, 12:38:52 am
    Author     : nurs2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, java.util.*" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Booking</title>
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
            background-color: #c3e4ec;
        }

         .navbar {
            width: 100%;
            background-color: #009999;
            overflow: visible;
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
            display: block;
            color: black;
        }
        .navbar a:hover {
            color: red;
        }
        .footer {
            width: 100%;
            padding: 10px;
            text-align: center;
            background-color: #009999;
        }
        .booking-container {
            width: 60%;
            margin: 20px auto;
            background-color: #f3f3f3;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .booking-options {
            margin-top: 20px;
        }
        .booking-options form {
            margin-bottom: 20px;
        }
        .booking-options label {
            display: block;
            margin: 5px 0;
        }
        .booking-options input[type="text"], .booking-options input[type="email"], .booking-options input[type="date"], .booking-options input[type="number"], .booking-options select, .booking-options textarea {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .booking-options button {
            background-color: #3399ff;
            color: black;
            padding: 10px;
            border: 1px solid black;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            border-radius: 4px;
        }
        .back-button {
            margin-top: 20px;
            padding: 10px;
            background-color: #3399ff;
            color: black;
            border: 1px solid black;
            border-radius: 4px;
            text-decoration: none;
            display: inline-block;
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

<div class="booking-container">
    <div class="booking-options">
        <h3>Create Booking</h3>
        <form class="create-booking-form" action="chooseroom.jsp" method="get">
            <label for="guestName">Guest Name:</label>
            <input type="text" id="guestName" name="guestName" required>

            <label for="contactDetails">Contact Details:</label>
            <input type="text" name="contactDetails" placeholder="Email Address" required>

            <label for="checkInDate">Check-In Date:</label>
            <input type="date" id="checkInDate" name="checkInDate" required>

            <label for="checkOutDate">Check-Out Date:</label>
            <input type="date" id="checkOutDate" name="checkOutDate" required>

            <label for="roomType">Room Type:</label>
            <select id="roomType" name="roomType">
                <option value="Standard">Standard</option>
                <option value="Double">Double</option>
                <option value="Suite">Suite</option>
            </select>

            <label for="maxOccupancy">Max Occupancy:</label>
            <input type="number" id="maxOccupancy" name="maxOccupancy" required>

            <label for="specialRequests">Special Requests:</label>
            <textarea id="specialRequests" name="specialRequests"></textarea>

            <button type="submit">Choose Room</button>
        </form>
    </div>
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
