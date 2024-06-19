<%-- 
    Document   : TrackAttendance
    Created on : 22 May 2024, 3:51:25 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Attendance</title>
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
        .off-text {
            color: red;
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
        <h2>Staff Attendance</h2>
        <form action="TrackAttendanceServlet" method="post">
            <label>Username: <input type="text" name="username" required></label>
            <br><br>
            <label>Name: <input type="text" name="name" required></label>
            <br><br>
            <label>Clock In: <input type="datetime-local" name="clockIn"></label>
            <br><br>
            <label>Clock Out: <input type="datetime-local" name="clockOut"></label>
            <br><br>
            <label>Absence Reason: <input type="text" name="absenceReason"></label>
            <br><br>
            <button type="submit">Submit Attendance</button>
            <button type="button" onclick="location.href='viewAttendance.jsp';">View Attendance</button> 
        </form>
    </div>

    <div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: +6012-334-567</p>
        <p><i class="fas fa-envelope"></i> Email Address: SVTHotel@gmail.com</p>
    </div>
</body>
</html>