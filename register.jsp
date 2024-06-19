<%-- 
    Document   : register
    Created on : 29 May 2024, 9:24:40 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset="UTF-8">
    <title>Create Account</title>
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
        .container {
            text-align: center;
            margin-top: 50px;
            width: 400px; /* Set a width for the form container */
            align-items: center;
            background-color: whitesmoke;
            border-radius: 30px;
            margin-bottom: 30px;
            margin-left: 400px;
        }
        h2 {
            color: #333; /* Dark gray heading */
        }
        .form-group {
            margin-bottom: 20px;
            padding-left: 10px;
            padding-right: 10px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333; /* Dark gray label text */
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .button-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button-link:hover {
            background-color: #0069d9;
        }
        .footer {
            width: 100%;
            padding: 10px;
            text-align: center;
            background-color: #009999;
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
       
    </div>
    <div class="container">
        <h2>Create new Account</h2>
        <p>Already Registered? <a href="LogInUser.jsp">Login</a></p>
        <form action="SaveServlet" method="post">
            <div class="form-group">
                <label for="name">NAME</label>
                <input type="text" id="name" name="name" placeholder="Jara Martins" required>
            </div>
            <div class="form-group">
                <label for="email">EMAIL</label>
                <input type="email" id="email" name="email" placeholder="mey/8@gmail.com" required>
            </div>
            <div class="form-group">
                <label for="password">PASSWORD</label>
                <input type="password" id="password" name="password" placeholder="********" required>
            </div>
            <div class="form-group">
    <label for="date-of-birth">DATE OF BIRTH</label>
    <input type="text" id="dateofBirth" name="dateofBirth" placeholder="MM/DD/YYYY" required style="width: 100%; padding: 5px;">
</div>

            <div class="form-group">
                <button type="submit" class="button-link">Sign Up</button>
            </div>
        </form>
    </div>
    <div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: <a href="tel:+6012-334-567">+6012-334-567</a></p>
        <p><i class="fas fa-envelope"></i> Email Address: <a href="mailto:SVTHotel@gmail.com">SVTHotel@gmail.com</a></p>
    </div>
    <script>
        function changeColor(element) {
            document.querySelectorAll('.navbar a').forEach(item => item.style.color = 'black');
            element.style.color = 'red';
        }
    </script>
</body>
</html>
