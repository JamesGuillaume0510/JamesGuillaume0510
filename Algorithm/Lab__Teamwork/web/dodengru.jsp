<%@ page pageEncoding="GBK" %>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="assignment.dao.UserDao"%>
<%@ page import="assignment.bean.UserBean"%>
<%
    String name=request.getParameter("name");
    String pass=request.getParameter("password");
    String shenfen=request.getParameter("shenfen");
    UserDao y=new UserDao();
    if(y.dengru(name,pass)){
        UserBean h = (UserBean) session.getAttribute("h");
        UserBean yong = (UserBean) session.getAttribute("yong");
        yong = y.getUserInfoByEmail(name);
        String uno = yong.getUno();
        // yong = y.getUserInfoById(uno);
        // System.out.println(yong.toString());
        session.setAttribute("yong", yong);
        if(shenfen.equals("0")&&(yong.getUclass()==0||yong.getUclass()==1||yong.getUclass()==2))
        {
            h.setUno("2");
            response.sendRedirect("shouye.jsp");
        }
        else if(shenfen.equals("3")&&yong.getUclass()==3)
        {
            h.setUno("5");
            response.sendRedirect("shouye.jsp");
        }
        else{
            session.setAttribute("yong", null);
            h.setUno("1");
            response.sendRedirect("dengru.jsp");
        }
    }
    else{
        session.setAttribute("yong", null);
        UserBean h = (UserBean) session.getAttribute("h");
        h.setUno("1");
        response.sendRedirect("dengru.jsp");
    }
%>
