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
       String Gno=request.getParameter("Gno");
        //String user=request.getParameter("user");
        int Mnum = Integer.parseInt(request.getParameter("Mnum"));
        if(opinion.equals("")){
    %>
    <script type="text/javascript" language="javascript">
        alert("您还未填写申请回复");                                            // 弹出错误信息
        window.location='guanlizhongxin.jsp' ;                            // 跳转到管理界面
    </script>
    <%  }
    else{

        manageGet manageList=new manageGet();
        int x=manageList.AgreedOne(Mnum,opinion);
        if(x==1){
    %>
    <script type="text/javascript" language="javascript">
        alert("请重新任命组长");                                            // 弹出处理信息
        window.location='change_captain.jsp?Mnum=<%=Mnum%>&opinion=<%=opinion%>&Gno=<%=Gno%>' ;                            // 跳转到任命界面
    </script>
    <%
        }
        else if(x==2){
    %>
    <script type="text/javascript" language="javascript">
        alert("该志愿者为其所属分组唯一成员，系统自动认定其为组长，无法同意其申请");                                            // 弹出处理信息
        window.location='guanlizhongxin.jsp' ;                            // 跳转到管理界面
    </script>
    <%
        }
        else{
    %>

    <script type="text/javascript" language="javascript">
        alert("处理完成");                                            // 弹出处理信息
        window.location='guanlizhongxin.jsp' ;                            // 跳转到管理界面
    </script>
    <%
        }
        }
    %>
</body>
</html>
