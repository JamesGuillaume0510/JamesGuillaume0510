<%@ page import="assignment.bean.UserBean" %>
<%@ page import="assignment.dao.UserDao" %>
<%
    String opcode = request.getParameter("opcode");
    System.out.println("opcode:" + opcode);
    String Uno = request.getParameter("UserId");
    String Uname = request.getParameter("Uname");
    String Uid = request.getParameter("Uid");
    double Uheight = Double.parseDouble(request.getParameter("height"));
    double Uweight = Double.parseDouble(request.getParameter("weight"));
    String tel = request.getParameter("tel");

    UserBean ub = new UserBean();
    ub.setUno(Uno);
    ub.setUname(Uname);
    ub.setUid(Uid);
    ub.setUheight(Uheight);
    ub.setUweight(Uweight);
    ub.setUtel(tel);
    System.out.println(ub.toString());
    if (opcode.equals("2")){
        if (Uname.equals("") || Uid.equals("") || Uheight == 0 || Uweight == 0 || tel.equals("")){
            //信息填写不完整的
            request.setAttribute("mass","信息填写不完整，请重新填写");
        }else{
            ub.setUclass(2);
            request.setAttribute("correct","信息提交成功");
        }
    }else if(opcode.equals("1")){
        request.setAttribute("correct","信息提交成功");
    }
    UserDao ud = new UserDao();
    ud.change_user_info(ub);
    session.setAttribute("yong",ub);
    request.getRequestDispatcher("personal_info.jsp").forward(request,response);//转发，跳转的分发器
    response.sendRedirect("personal_info.jsp");
%>
