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
        alert("����δ��д����ظ�");                                            // ����������Ϣ
        window.location='guanlizhongxin.jsp' ;                            // ��ת����¼����
    </script>
     <%  }
        else{
         manageGet manageList=new manageGet();
         manageList.RefusedOne(Mnum,opinion);
         %>
    <script type="text/javascript" language="javascript">
        alert("�������");                                            // ����������Ϣ
        window.location='guanlizhongxin.jsp' ;                            // ��ת����¼����
    </script>
    <%
     }
    %>
</body>
</html>
