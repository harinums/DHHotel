<%-- 
    Document   : Room
    Created on : 18 Jun 2024, 10:51:01 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Room</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
        .room-container {
            width: 60%;
            margin: 20px auto;
            background-color: #f3f3f3;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .room-options {
            margin-top: 20px;
        }
        .room-options form {
            margin-bottom: 20px;
        }
        .room-options label {
            display: block;
            margin: 5px 0;
        }
        .room-options input[type="text"], 
        .room-options input[type="number"], 
        .room-options select, 
        .room-options textarea {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .room-options button {
            background-color: #3399ff;
            color: black;
            padding: 10px;
            border: 1px solid black;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            border-radius: 4px;
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

<div class="room-container">
    <h2>Manage Room</h2>
    <div class="room-options">
        <form class="create-room-form" action="SaveRoomServlet" method="post" enctype="multipart/form-data">
            <label for="roomno">Room Number:</label>
            <input type="text" id="roomno" name="roomNumber" required>
            
            <label for="roomtype">Room Type:</label>
            <select id="roomtype" name="roomType">
                <option value="Standard">Standard</option>
                <option value="Double">Double</option>
                <option value="Suite">Suite</option>
            </select>
            <label for="rate">Rate:</label>
            <input type="text" id="rate" name="rate" required>
            
            <label for="maxOccupancy">Max Occupancy:</label>
            <input type="number" id="maxOccupancy" name="maxOccupancy" required>
            
            <label for="status">Status:</label>
            <input type="text" id="status" name="availability" required>

            <label for="features">Features:</label>
            <input type="text" id="features" name="features" required>

            <label for="image">Image:</label>
            <input type="file" id="image" name="image" accept="image/*" required>

            <button type="submit">Save Room</button>
            <button type="button" onclick="window.location.href='Room.jsp'">Cancel</button>
        </form>
        <a href="ViewRoomServlet">View Room</a>
    </div>
</div>

<div class="footer">
    <p>Contact Us</p>
    <p><i class="fas fa-phone-alt"></i> Phone: +0012-334-007</p>
    <p><i class="fas fa-envelope"></i> Email Address: 577hotel@gmail.com</p>
</div>

<script>
    function changeColor(element) {
        document.querySelectorAll('.navbar a').forEach(item => item.style.color = 'black');
        element.style.color = 'red';
    }
</script>
</body>
</html>
