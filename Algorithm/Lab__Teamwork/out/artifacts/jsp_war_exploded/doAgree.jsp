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
        alert("����δ��д����ظ�");                                            // ����������Ϣ
        window.location='guanlizhongxin.jsp' ;                            // ��ת���������
    </script>
    <%  }
    else{

        manageGet manageList=new manageGet();
        int x=manageList.AgreedOne(Mnum,opinion);
        if(x==1){
    %>
    <script type="text/javascript" language="javascript">
        alert("�����������鳤");                                            // ����������Ϣ
        window.location='change_captain.jsp?Mnum=<%=Mnum%>&opinion=<%=opinion%>&Gno=<%=Gno%>' ;                            // ��ת����������
    </script>
    <%
        }
        else if(x==2){
    %>
    <script type="text/javascript" language="javascript">
        alert("��־Ը��Ϊ����������Ψһ��Ա��ϵͳ�Զ��϶���Ϊ�鳤���޷�ͬ��������");                                            // ����������Ϣ
        window.location='guanlizhongxin.jsp' ;                            // ��ת���������
    </script>
    <%
        }
        else{
    %>

    <script type="text/javascript" language="javascript">
        alert("�������");                                            // ����������Ϣ
        window.location='guanlizhongxin.jsp' ;                            // ��ת���������
    </script>
    <%
        }
        }
    %>
</body>
</html>
