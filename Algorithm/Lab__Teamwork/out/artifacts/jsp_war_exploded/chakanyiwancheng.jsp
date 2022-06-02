<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*,java.net.*" %>
<%@ page import="sin.manage"%>
<%@ page import="sin.manageGet"%>
<%@ page import="sin.volunteerGroupMassage"%>
<%@ page import="sin.GroupMassageGet"%>
<%@ page import="assignment.bean.UserBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>查看未审核申请界面</title>
    <meta charset="utf-8">
    <style type="text/css">
        *{
            margin:0px;
            padding:0px;
        }
        div{

        }
        #back{
            height: 720px;
            background-color: #F0F8FF;
        }
        ol,ul{
            list-style-type:none;
        }
        a{
            color:#666;
            text-decoration:none;
        }
        #center{
            height: 700px;
            width: 80%;
            margin: 0px auto;
            background-color: #fff;
        }
        #top{
            height:30px;
            background-color: #333;
        }
        #topright{
            background-color: #333;
            float: right;
        }
        #topleft{
            background-color: #333;
            float: left;
        }
        #top ul li{
            float: left;
            font-size:20px;
        }
        #top a{
            color:#b0b0b0;
            line-height: 30px;
            margin: 5px;
        }
        #top span{
            line-height: 30px;
        }
        #top a:hover{
            color: #fff;
        }
        #img_and_name{
            margin-top: 30px;
            height: 90px;
        }
        #img_and_name img{
            float: left;
            height: 90px;
        }
        #img_and_name span{
            float: left;
            line-height: 90px;
            margin-left: 15%;
            font-size: 40px;
            display:inline-block;font-weight:bold;color:#def;text-shadow:0 0 1px currentColor,-1px -1px 1px #000,0 -1px 1px #000,1px -1px 1px #000,1px 0 1px #000,1px 1px 1px #000,0 1px 1px #000,-1px 1px 1px #000,-1px 0 1px #000;-webkit-filter:url(#diff1);filter:url(#diff1);/*background:#def;padding:0 .2em*/
        }
        .shenqinbiao{
            margin-top: 10px;
            border:3px solid #9BDF70;
            border-radius:30px;
            background-color:#F0FBEB;
            width:80%;
            margin-left: 10%;
            margin-right: 10%;

            height:1000px;;
        }
        .shenqinbiao3{
            margin-top: 10px;
            border:3px solid #45cde0;
            border-radius:30px;

            width:80%;
            margin-left: 10%;
            margin-right: 10%;
            height:800px;;
        }
        .leixing{
            margin-left: 42%;
            color: black;
        }
        .anniu{
            margin-top: 0px;
            margin-left: 800px;
        }
        .btn {
            border: 2px solid grey;
            background-color: transparent;
            text-transform: uppercase;
            font-size: 14px;
            padding: 10px 20px;
            font-weight: 300;
        }


        .two {
            font-weight: bold;
            color: #f038ff;
        }

        .three {
            font-weight: bold;
            color: #006400;
        }

        .btn:hover {
            color: white;
            border: 0;
        }


        .two:hover {
            background-color: #f038ff;
            -webkit-box-shadow: 10px 10px 99px 6px rgba(240, 56, 255, 1);
            -moz-box-shadow: 10px 10px 99px 6px rgba(240, 56, 255, 1);
            box-shadow: 10px 10px 99px 6px rgba(240, 56, 255, 1);
        }

        .three:hover {
            background-color: #b9e769;
            -webkit-box-shadow: 10px 10px 99px 6px rgba(185, 231, 105, 1);
            -moz-box-shadow: 10px 10px 99px 6px rgba(185, 231, 105, 1);
            box-shadow: 10px 10px 99px 6px rgba(185, 231, 105, 1);
        }
        .shenqinbiao1{
            margin-top: 10px;
            border:3px solid #FF66CC;
            border-radius:30px;
            background-color:#FFCCEE;

            width:80%;
            margin-left: 10%;
            margin-right: 10%;

            height:200px;;
        }
        .shenqinbiao2{
            margin-top: 10px;
            border:3px solid #f57b02;
            border-radius:30px;
            background-color: #f1c534;

            width:80%;
            margin-left: 10%;
            margin-right: 10%;

            height:200px;;
        }
    </style>
</head>
<body>

<script language="JavaScript">
    function refusedToOne(n){
        document.process.action="doRefused.jsp?Mnum="+n;
        document.process.submit();
    }
    function refusedToTwo(n){
        document.process1.action="doRefused.jsp?Mnum="+n;
        document.process1.submit();
    }
    function refusedToThree(n){
        document.process2.action="doRefused.jsp?Mnum="+n;
        document.process2.submit();
    }
    function agreeToOne(n){
        document.process.action="doAgree.jsp?Mnum="+n;
        document.process.submit();
    }
    function agreeToTwo(n){
        document.process1.action="doAgree.jsp?Mnum="+n;
        document.process1.submit();
    }
    function agreeToThree(n){
        document.process2.action="doAgree.jsp?Mnum="+n;
        document.process2.submit();
    }
    <%
    UserBean yong=(UserBean) session.getAttribute("yong");
    %>


</script>
<div id="back">
    <div id="center">
        <div id="top">
            <div id="topleft">
                <ul>
                    <li><a href="shouye.jsp">首页</a><span>|</span></li>
                    <li><a href="#">报名流程</a><span>|</span></li>
                </ul>
            </div>
            <div id="topright">
                <ul>
                    <li><a href="admin_center.jsp" style="background-color: #33ff88;">管理中心</a></li>
                    <li><span>|</span></li>
                    <li><a href="#">你好，<%=yong.getUname()%></a><span>|</span></li>
                    <li><a href="dozhuxiao.jsp">退出登入</a><span>|</span></li>
                    <li><a href="#">消息(0)</a><span>|</span></li>
                </ul>
            </div>
        </div>
        <div id="img_and_name">
            <a href="shouye.jsp"><img src="img/zhiyuanzhe.png"></a>
            <span>杭州亚运会和亚残会赛会志愿者管理系统</span>
        </div>

        <form class="shenqinbiao">
            <div class="leixing">
                <h2>已处理申请</h2>
            </div>
            <div class="xinxi">
                <table style="margin-left: 250px;text-align: center">
                    <tr>
                        <th>申请编号</th>
                        <th>用户编号</th>
                        <th>申请分组</th>
                        <th>申请项目</th>
                        <th>申请状态</th>
                        <th>意见回复</th>
                    </tr>
                    <% manageGet manageList2=new manageGet();
                        List<manage> m3= manageList2.getManageProcessed();
                        for(int i=0 ; i<m3.size(); i++){
                            manage m4 = m3.get(i);
                    %>
                    <tr>
                        <td><%=m4.getMnum()%></td>
                        <td><%=m4.getUno()%></td>
                        <td><%=m4.getGno()%></td>
                        <td><%=m4.getMclassOfchange()%></td>
                        <td><%=m4.getMstateOfchange()%></td>
                        <td><input type="text" value="<%=m4.getMadvise()%>" disabled="disabled" style="width: 100px"></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </form>

    </div>
</div>
</body>
