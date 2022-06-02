<%@ page pageEncoding="GBK" %>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="assignment.dao.UserDao"%>
<%@ page import="assignment.bean.UserBean"%>

<%
    String pass = request.getParameter("password");
    String email = request.getParameter("email");
    String queding=request.getParameter("queding");
    UserBean h = (UserBean) session.getAttribute("h");
    UserBean y=new UserBean();
    y.setUemail(email);
    y.setUpassword(pass);
    UserDao dao = new UserDao();
    dao.create_user(email,pass);
    response.sendRedirect("dengru.jsp");
%>
