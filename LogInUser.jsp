<%-- 
    Document   : LogInUser
    Created on : 23 May 2024, 10:22:45 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
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
        .login-form input[type="email"], .login-form input[type="password"] {
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
            margin: 15px 10px;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            z-index: 1;
            margin-top: 10px;
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
        <a href="LogInUser.jsp">Login</a>
        <div class="dropdown">
            <span class="dropbtn">Register <i class="fas fa-caret-down"></i></span>
            <div class="dropdown-content">
                <a href="register.jsp">Customer</a>
                <a href="staffRegister.jsp">Staff</a>
            </div>
        </div>
    </div>

    <div class="content">
        <form class="login-form" action="loginServlet" method="post">
            <h2>Login</h2>
            <label for="email"><b>Email</b></label>
            <input type="email" placeholder="Enter Email" name="email" required>
            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required>
            <button type="submit">Login</button>
            <br><br>
            <button type="button" onclick="window.location.href='AdminLogin.jsp'">ADMIN/STAFF</button>
        </form>
    </div>

    <div class="footer">
        <p>Contact Us</p>
        <p><i class="fas fa-phone-alt"></i> Phone: +0012-334-007</p>
        <p><i class="fas fa-envelope"></i> Email: 577hotel@gmail.com</p>
    </div>

    <script>
        window.onclick = function(event) {
            if (!event.target.matches('.dropbtn')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                for (var i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        };
    </script>
</body>
</html>

