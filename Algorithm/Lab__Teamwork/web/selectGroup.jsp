<%--
  Created by IntelliJ IDEA.
  User: 16033
  Date: 4/5/2022
  Time: 上午12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%
    String Gno = request.getParameter("Gno");
    out.print(Gno);
%>
