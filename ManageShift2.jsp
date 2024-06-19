<%-- 
    Document   : ManageShift2
    Created on : 3 Jun 2024, 4:26:38 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Shifts and Schedules</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
<h2>Shifts and Schedules</h2>
<form action="ManageShiftsServlet" method="post">
    <table style="width:100%">
        
        <tr>
            <th>Staff Name</th>
            <th>Sunday</th>
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
            <th>Saturday</th>
        </tr>
        <tr>
            <td>Staff 1</td>
            <td>7.00AM-3.30PM</td>
            <td>7.00AM-3.30PM</td>
            <td>7.00AM-3.30PM</td>
            <td>7.00AM-3.30PM</td>
            <td>7.00AM-3.30PM</td>
            <td><strong>OFF</strong></td>
            <td>7.00AM-3.30PM</td>
        </tr>
        <tr>
            <td>Staff 2</td>
            <td>3.30PM-11.30PM</td>
            <td>3.30PM-11.30PM</td>
            <td>3.30PM-11.30PM</td>
            <td>3.30PM-11.30PM</td>
            <td><strong>OFF</strong></td>
            <td>3.30PM-11.30PM</td>
            <td>3.30PM-11.30PM</td>
        </tr>
        <tr>
            <td>Staff 3</td>
            <td>11.00AM-7.00AM</td>
            <td>11.00AM-7.00AM</td>
            <td>11.00AM-7.00AM</td>
            <td><strong>OFF</strong></td>
            <td>11.00AM-7.00AM</td>
            <td>11.00AM-7.00AM</td>
            <td>11.00AM-7.00AM</td>
        </tr>
    </table>
</form>
</body>
</html>