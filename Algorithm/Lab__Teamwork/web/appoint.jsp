<%--
  Created by IntelliJ IDEA.
  User: 16033
  Date: 8/5/2022
  Time: 下午6:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="sql.Vol" %>
<%@ page import="sql.VolDAO" %>
<%@ page import="java.util.*" %>
<%
    String Uno = request.getParameter("Uno");
    String Gno = request.getParameter("Gno");
    VolDAO vol = new VolDAO();
    vol.appointGroupMaster(Uno,Gno);
%>
