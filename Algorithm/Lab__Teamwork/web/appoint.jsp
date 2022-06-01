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
