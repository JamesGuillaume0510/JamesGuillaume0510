<%@ page import="assignment.bean.UserBean" %>
<%@ page import="assignment.dao.UserDao" %>
<%
    String Uno = request.getParameter("UserId");
    String Uname = request.getParameter("Uname");
    String Uid = request.getParameter("Uid");
    String Usex = request.getParameter("sex");
    int Uheight = Integer.parseInt(request.getParameter("height"));
    int Uweight = Integer.parseInt(request.getParameter("weight"));
    String tel = request.getParameter("tel");

    UserBean ub = new UserBean();
    ub.setUno(Uno);
    ub.setUname(Uname);
    ub.setUid(Uid);
    ub.setUsex(Usex);
    ub.setUheight(Uheight);
    ub.setUweight(Uweight);
    ub.setUtel(tel);

    UserDao ud = new UserDao();
    ud.change_user_info(ub);
%>
