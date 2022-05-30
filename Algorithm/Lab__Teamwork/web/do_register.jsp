<%@ page import="assignment.bean.UserBean" %>
<%@ page import="assignment.dao.UserDao" %>
contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try{
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDao ud = new UserDao();
        int f = ud.create_user(email,password);
        if (f>0){
            session.setAttribute("flag","1");
        }

    }catch (Exception e){
        e.printStackTrace();
    }
    response.sendRedirect("login.jsp");
%>
</body>
</html>
