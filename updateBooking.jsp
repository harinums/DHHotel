<%-- 
    Document   : updateBooking
    Created on : 17 Jun 2024, 7:27:10 am
    Author     : nurs2
--%>

<%@page import="java.sql.*" %>
<%
    String bookingId = request.getParameter("id");
    String guestName = request.getParameter("guestName");
    String contactDetails = request.getParameter("contactDetails");
    String checkInDate = request.getParameter("checkInDate");
    String checkOutDate = request.getParameter("checkOutDate");
    String roomType = request.getParameter("roomType");
    String roomNumber = request.getParameter("roomNumber");
    String maxOccupancy = request.getParameter("maxOccupancy");
    String specialRequests = request.getParameter("specialRequests");

    String url = "jdbc:mysql://localhost:3306/hotel";
    String user = "root";
    String password = "admin";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String query = "UPDATE booking SET guestName=?, contactDetails=?, checkInDate=?, checkOutDate=?, roomType=?, roomNumber=?, maxOccupancy=?, specialRequests=? WHERE bookingId=?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, guestName);
        pstmt.setString(2, contactDetails);
        pstmt.setDate(3, Date.valueOf(checkInDate));
        pstmt.setDate(4, Date.valueOf(checkOutDate));
        pstmt.setString(5, roomType);
        pstmt.setInt(6, Integer.parseInt(roomNumber));
        pstmt.setInt(7, Integer.parseInt(maxOccupancy));
        pstmt.setString(8, specialRequests);
        pstmt.setString(9, bookingId);

        int updated = pstmt.executeUpdate();
        if (updated > 0) {
            response.sendRedirect("manageBooking.jsp?status=success");
        } else {
            response.sendRedirect("editBooking.jsp?id=" + bookingId + "&status=error");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("editBooking.jsp?id=" + bookingId + "&status=error");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

