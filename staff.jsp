<%-- 
    Document   : staff
    Created on : 31 May 2024, 9:04:03 PM
    Author     : User
--%>

<%@ page import="user.UserDao" %>
<%@ page import="user.User" %>
<%@ page import="staff.viewServlet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
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
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border: 2px solid #007bff;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
   
        <h1 style="text-align: center;">Staff List</h1>
    <table>
        <tr>
            <th>Username</th>
            <th>Name</th>
            <th>Address</th>
            <th>Email</th>
            <th>Password</th>
            <th>Phone No</th>
            <th>Role</th>
        </tr>
        <% new staff.viewServlet().processRequest(request, response); %>
        
    </table>
</body>
</html>
