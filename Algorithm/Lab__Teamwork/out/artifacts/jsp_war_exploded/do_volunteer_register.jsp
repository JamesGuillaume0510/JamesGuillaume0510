<%@ page import="assignment.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String Gno = request.getParameter("Gno");
    String UserId = request.getParameter("UserId");
    UserDao ud = new UserDao();
    ud.volunteer_register(UserId, 0, 0,Gno);
    response.sendRedirect("personal_center.jsp");
%>
