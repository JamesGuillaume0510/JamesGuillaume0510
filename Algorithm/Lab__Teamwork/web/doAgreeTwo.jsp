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
    String opinion=request.getParameter("opinion");
    //String user=request.getParameter("user");
    int  Mnum = Integer.parseInt(request.getParameter("Mnum"));

       if(Mnum!=0){
        manageGet manageList=new manageGet();
        manageList.AgreeTwo(Mnum,opinion);
%>
<script type="text/javascript" language="javascript">
    alert("�������");                                            // ����������Ϣ
    window.location='guanlizhongxin.jsp' ;                            // ��ת���������
</script>
<%
    }
    %>
</body>
</html>
