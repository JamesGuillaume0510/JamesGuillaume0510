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
        alert("��ѡ��Ҫ���������");                                            // ����������Ϣ
        window.location='zhiyuanshenqing.jsp' ;                            // ��ת���������
    </script>
    <%
        }
        else if(Gno.equals("")){
    %>
    <script type="text/javascript" language="javascript">
        alert("��ѡ�������С��");                                            // ����������Ϣ
        window.location='zhiyuanshenqing.jsp' ;                            // ��ת���������
    </script>
<%}
    else{
    manageGet m1 = new manageGet();
    m1.insertIntoManage(Uno,Gno,Mclass);
    System.out.println("����ɹ�");
%>
    <script type="text/javascript" language="javascript">
        alert("����ɹ�");                                            // ����������Ϣ
        window.location='zhiyuanshenqing.jsp' ;                            // ��ת���������
    </script>
<%}%>
</body>
</html>
