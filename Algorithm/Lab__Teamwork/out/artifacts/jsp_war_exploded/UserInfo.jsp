<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="sql.UserDao" %>
<%@ page import="sql.UserBean" %>

<%
    String UserId = request.getParameter("id");
    // ############################################################################# wlk
    // 数据库链接读取相关用户信息，并且将他们存入一个用户信息数组中                      ##
    // 1.创建一个用户类                            已经集成在UserBean.java中      ##
    // 2.创建一个存放完用户类的数组并连接数据库        已经集成在UserDao.java中        ##

    UserDao ud = new UserDao();
    UserBean recent_user = ud.getUserInfoById(UserId);

    // ############################################################################# wlk
%>

<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <meta charset="utf-8">
    <style type="text/css">
        *{
            margin:0;
            padding:0;
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
            margin: 0 auto;
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
        #gerenxingxi{
            height: 250px;
            width: 100%;
        }
        #gongneng{
            background-color: #e0e0e0;
            height: 302px;
            width: 100%;
        }
        #function1{
            float: left;
            height: 250px;
            width: 150px;
            margin-top: 30px;
            margin-left: 120px;
        }
        #function1 img{
            position: absolute;
            height: 250px;
            width: 150px;
            filter: opacity(30%);
            float: left;
        }
        #function1 font{
            color: black;
            font-size: 20px;
            position: absolute;
            margin-left: 15px;
            margin-top: 110px;
            float: left;
        }
        #function1:hover{
            -webkit-box-shadow:0 15px 30px rgba(0,0,0,.1);
            box-shadow:0 15px 30px rgba(0,0,0,.3);
        }
        #function2{
            float: left;
            height: 250px;
            width: 150px;
            margin-top: 30px;
            margin-left: 120px;
        }
        #function2 img{
            position: absolute;
            height: 250px;
            width: 150px;
            filter: opacity(30%);
            float: left;
        }
        #function2 font{
            color: black;
            font-size: 20px;
            position: absolute;
            margin-left: 24px;
            margin-top: 110px;
            float: left;
        }
        #function2:hover{
            -webkit-box-shadow:0 15px 30px rgba(0,0,0,.1);
            box-shadow:0 15px 30px rgba(0,0,0,.3);
        }
        #function3{
            background-color: white;
            float: left;
            height: 250px;
            width: 150px;
            margin-top: 30px;
            margin-left: 120px;
        }
        #function3 img{
            position: absolute;
            margin-top: 20px;
            height: 230px;
            width: 150px;
            filter: opacity(30%);
            float: left;
        }
        #function3 font{
            color: black;
            font-size: 20px;
            position: absolute;
            margin-left: 35px;
            margin-top: 110px;
            float: left;
        }
        #function3:hover{
            -webkit-box-shadow:0 15px 30px rgba(0,0,0,.1);
            box-shadow:0 15px 30px rgba(0,0,0,.3);
        }
        #function4{
            float: left;
            height: 250px;
            width: 150px;
            margin-top: 30px;
            margin-left: 120px;
        }
        #function4 img{
            position: absolute;
            height: 250px;
            width: 150px;
            filter: opacity(30%);
            float: left;
        }
        #function4 font{
            color: black;
            font-size: 20px;
            position: absolute;
            margin-left: 35px;
            margin-top: 110px;
            float: left;
        }
        #function4:hover{
            -webkit-box-shadow:0 15px 30px rgba(0,0,0,.1);
            box-shadow:0 15px 30px rgba(0,0,0,.3);
        }
        #detail1{
            font-size: 23px;

        }

    </style>
</head>
<body>
<div id="back">
    <div id="center">
        <div id="top">
            <div id="topleft">
                <ul>
                    <li><a href="index.jsp">首页</a><span>|</span></li>
                    <li><a href="#">报名流程</a><span>|</span></li>
                </ul>
            </div>
            <div id="topright">
                <ul>
                    <li><a href="personal_center.jsp" style="background-color: #33ff88;">个人中心</a></li>
                    <li><span>|</span></li>
                    <li><a href="dengru.jsp">登入</a><span>|</span></li>
                    <li><a href="zhuce.jsp">注册</a><span>|</span></li>
                    <li><a href="#">消息(0)</a><span>|</span></li>
                </ul>
            </div>
        </div>
        <div id="img_and_name">
            <a href="index.jsp"><img src="img/zhiyuanzhe.png"></a>
            <span>杭州亚运会和亚残会赛会志愿者管理系统</span>
        </div>
        <div id="gerenxingxi" align="center">
            <font>个人信息</font>
            <%-- ################################################################ wlk --%>
            <table id="detail1">
                <tr><td>用户编号：</td><td><%=recent_user.getUno()%></td></tr>
                <tr><td>姓名：</td><td><%=recent_user.getUname()%></td></tr>
                <tr><td>组别：</td><td><%=recent_user.getGno()%></td></tr>
                <tr><td>项目名称：</td><td><%=recent_user.getGname()%></td></tr>
                <tr><td>组长编号：</td><td><%=recent_user.getLno()%></td></tr>
                <tr><td>年龄：</td><td><%=recent_user.getUage()%></td></tr>
                <tr><td>邮箱：</td><td><%=recent_user.getUemail()%></td></tr>
                <tr><td>身份证号：</td><td><%=recent_user.getUid()%></td></tr>
                <tr><td>生日：</td><td><%=recent_user.getUbirth()%></td></tr>
                <tr><td>性别：</td><td><%=recent_user.getUsex()%></td></tr>
                <tr><td>身高：</td><td><%=recent_user.getUheight()%></td></tr>
                <tr><td>体重：</td><td><%=recent_user.getUweight()%></td></tr>
                <tr><td>电话：</td><td><%=recent_user.getUtel()%></td></tr>
                <tr><td>个人简介：</td><td colspan="3"><%=recent_user.getUintro()%></td></tr>

            </table>
            <%-- ################################################################ wlk --%>
        </div>

    </div>
    <button onclick="gerenzhongxin.jsp" >返回</button>
</div>
</body>
