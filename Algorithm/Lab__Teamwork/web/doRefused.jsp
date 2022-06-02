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
    <%String opinion=request.getParameter("opinion");
        int Mnum = Integer.parseInt(request.getParameter("Mnum"));
        //String user=request.getParameter("user");
        if(opinion.equals("")){
    %>
    <script type="text/javascript" language="javascript">
        alert("您还未填写申请回复");                                            // 弹出错误信息
        window.location='guanlizhongxin.jsp' ;                            // 跳转到登录界面
    </script>
     <%  }
        else{
         manageGet manageList=new manageGet();
         manageList.RefusedOne(Mnum,opinion);
         %>
    <script type="text/javascript" language="javascript">
        alert("处理完成");                                            // 弹出处理信息
        window.location='guanlizhongxin.jsp' ;                            // 跳转到登录界面
    </script>
    <%
     }
    %>
</body>
</html>
