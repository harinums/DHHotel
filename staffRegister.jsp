<%-- 
    Document   : staffRegister
    Created on : 29 May 2024, 11:37:58 PM
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
            overflow: hidden;
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
            background-color:#009999;;
        }
    </style>
</head>
<body>
    <div class="navbar">
         <img src="hotelogo.jpeg" alt="Logo">
    </div>
    <div class="container">
        <h2>Create new Account</h2>
        <p>Already Registered? <a href="AdminLogin.jsp">Login</a></p>
        <form action="saveServlet" method="post">
    <div class="form-group">
        <label for="username">USERNAME</label>
        <input type="text" id="username" name="username" placeholder="username" required>
    </div>
    <div class="form-group">
        <label for="name">NAME</label>
        <input type="text" id="name" name="name" placeholder="Jara Martins" required>
    </div>
    
    <div class="form-group">
        <label for="address">ADDRESS</label>
        <input type="text" id="address" name="address" placeholder="address" required>
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
        <label for="phoneNo">PHONE NUMBER</label>
        <input type="text" id="phoneNo" name="phoneNo" placeholder="012-3456789" required>
    </div>
    <div class="form-group">
        <label for="role">ROLE</label><br>
        <select id="role" name="role">
            <option value="1">staff</option>
            <option value="2">Admin</option>
        </select><br><br>
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
    // Function to change the color to red when clicked
    function changeColor(element) {
        // Reset all nav items to default color
        document.querySelectorAll('.navbar a').forEach(item => item.style.color = 'black');
        // Change the color of the clicked item to red
        element.style.color = 'red';
    }
</script>
</body>
</html>
