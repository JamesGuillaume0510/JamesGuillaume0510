<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="assignment.dao.UserDao"%>
<%@ page import="assignment.bean.UserBean"%>
<%
        UserBean h = (UserBean) session.getAttribute("h");
        UserBean yong=(UserBean) session.getAttribute("yong");
        session.setAttribute("h", null);
        session.setAttribute("yong", null);
        response.sendRedirect("shouye.jsp");
        %>

