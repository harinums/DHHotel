<%-- 
    Document   : roomStaff
    Created on : 3 Jun 2024, 12:43:05 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> Manage Booking </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #c3e4ec;
        }

        .navbar {
            width: 100%;
            background-color: #f3f3f3;
            overflow: visible;
            display: flex;
            justify-content: space-around;
            padding: 10px;
            background-color: #009999;
        }
        .navbar img {
            height: 50px; /* Adjust the height as needed */
            margin-right: 20px; /* Add some space between the logo and the links */
        }
        .navbar a {
            padding: 14px 20px;
            text-decoration: none;
            display: block;
            color: black;
        }
        .navbar a:hover {
            background-color: none;
            color: red;
        }
        
        .footer {
            width: 100%;
            background-color: #009999;
            color: white;
            padding: 10px;
            text-align: center;
            margin-top: auto;
        }

        .content {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            box-sizing: border-box;
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-form input[type="text"],
        .login-form input[type="password"],
        .login-form select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .login-form button {
            background-color: #3399ff;
            color: black;
            padding: 10px;
            border: 1px solid black;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
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
        <a href="bookingStaff.jsp">Booking</a>
        <a href="roomStaff.jsp">Room</a>
        <a href="shift.jsp">Shift</a>
        <a href="attendance.jsp">Attendance</a>
        <a href="AdminLogin.jsp">Staff/Admin</a>
    </div>
    </body>
</html>
