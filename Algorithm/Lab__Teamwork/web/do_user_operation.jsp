<%@ page import="assignment.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int opcode = Integer.parseInt(request.getParameter("opCode"));
    String UserId = request.getParameter("UserId");
    String password = request.getParameter("password");
    UserDao ud = new UserDao();
    if (opcode == 1){
        // 注销账号
        ud.delete_user_by_Uno(UserId);

    }else if (opcode == 2){
        // 修改密码
        ud.change_password_by_Uno(UserId,password);
    }else if (opcode == 3){
        // 退出账号
        session.setAttribute("Uno",null);
    }
    response.sendRedirect("dengru.jsp");
%>
