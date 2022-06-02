<%@ page pageEncoding="GBK" %>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page import="java.util.*,java.sql.*,java.net.*" %>
<%@ page import="sin.manage"%>
<%@ page import="sin.manageGet"%>
<%@ page import="sin.volunteerGroupMassage"%>
<%@ page import="sin.GroupMassageGet"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String Uno = request.getParameter("Uno");
        String Gno= request.getParameter("Gno");
        int Mclass=Integer.parseInt(request.getParameter("Mclass"));
        System.out.println(Uno);
        System.out.println(Gno);
        System.out.println(Mclass);
        if(Mclass==5){
    %>
    <script type="text/javascript" language="javascript">
        alert("请选择要申请的事项");                                            // 弹出处理信息
        window.location='zhiyuanshenqing.jsp' ;                            // 跳转到管理界面
    </script>
    <%
        }
        else if(Gno.equals("")){
    %>
    <script type="text/javascript" language="javascript">
        alert("请选择申请的小组");                                            // 弹出处理信息
        window.location='zhiyuanshenqing.jsp' ;                            // 跳转到管理界面
    </script>
<%}
    else{
    manageGet m1 = new manageGet();
    m1.insertIntoManage(Uno,Gno,Mclass);
    System.out.println("申请成功");
%>
    <script type="text/javascript" language="javascript">
        alert("申请成功");                                            // 弹出处理信息
        window.location='zhiyuanshenqing.jsp' ;                            // 跳转到管理界面
    </script>
<%}%>
</body>
</html>
