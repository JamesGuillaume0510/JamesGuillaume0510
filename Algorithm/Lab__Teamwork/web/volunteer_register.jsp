<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="assignment.dao.UserDao" %>
<%@ page import="assignment.bean.UserBean" %>

<%
    UserBean h = (UserBean) session.getAttribute("h");
    UserBean yong=(UserBean) session.getAttribute("yong");
    //System.out.println("这是volunteer_register处的yong:");
    //System.out.println(yong.toString());
    if (h == null) {
        h = new UserBean();
        session.setAttribute("h", h);
        h.setUno("0");
    }
    if(h.getUno()!="4"){
        System.out.println("还没登录，跳转到登录界面");
        h.setUno("3");
        response.sendRedirect("dengru.jsp");
    }
    if(h.getUno()=="4"){
        int Uclass = yong.getUclass();
        String UserId = yong.getUno();
        UserDao ud = new UserDao();
        UserBean ub = ud.getUserInfoById(UserId);
%>

<!DOCTYPE html>
<html>
<head>
    <%if(yong.getUclass() != 2){%>
        <script type="text/javascript">
            alert("注册志愿者前请先完善用户信息！");
            window.location.href="personal_center.jsp"
        </script>
    <%}%>
    <%if(!yong.getGno().equals("")){%>
        <script type="text/javascript">
            alert("您已经申请成功为志愿者！\n如果需要修改志愿请移步‘修改志愿’");
            window.location.href="personal_center.jsp"
        </script>
    <%}%>
    <title>志愿申请界面</title>
    <meta charset="utf-8">
    <script type="text/javascript">
        function click0() {
            alert("注册申请已经提交");
            window.location.href="do_volunteer_register.jsp?Gno=G01&UserId=<%=UserId%>";
        }
        function click1() {
            alert("注册申请已经提交");
            window.location.href="do_volunteer_register.jsp?Gno=G02&UserId=<%=UserId%>";
        }
        function click2() {
            alert("注册申请已经提交");
            window.location.href="do_volunteer_register.jsp?Gno=G03&UserId=<%=UserId%>";
        }
        function click3() {
            alert("注册申请已经提交");
            window.location.href="do_volunteer_register.jsp?Gno=G04&UserId=<%=UserId%>";
        }
    </script>
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
        #pu1{
            height:160px;
            width:312px;
            float: left;
            margin-top: 100px;
            margin-left: 70px;

        }
        #pu1 img{
            height:160px;
            width:312px;
            float: left;
            filter: opacity(40%);
        }
        #pu2{
            margin-top: 100px;
            height:160px;
            width:312px;
            float: left;
            margin-left: 70px;
        }
        #pu2 img{
            height:160px;
            width:312px;
            float: left;
            filter: opacity(40%);
        }
        #pu3{
            margin-left: 70px;
            margin-top: 100px;
            height:160px;
            width:312px;
            float: left;
        }
        #pu3 img{
            height:160px;
            width:312px;
            float: left;
            filter: opacity(40%);
        }
        .tu{
            position: absolute;
            z-index: 1;
        }
        .txt{
            margin-left:75px;
            margin-top: 60px;
            position: absolute;
            z-index: 2;
            font-size: 20px;
            font-weight: bolder;
            color: black;
        }
        .tu:hover{
            -webkit-box-shadow:0 15px 30px rgba(0,0,0,.1);
            box-shadow:0 15px 30px rgba(0,0,0,.3);
        }
    </style>
</head>
<body>
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
                    <li><a href="personal_center.jsp" style="background-color: #33ff88;">个人中心</a></li>
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
        <div id="gerenxingxi">
            <div id="pu1">
                <div  class="tu" ><a href="#" ><img src="img/jishu.jpeg " onclick="click0()"></a></div>
                <font class="txt">注册成为技术志愿者</font>
            </div>
            <div id="pu2">
                <div  class="tu"><a href="#"><img src="img/houqing.jpeg"  onclick="click1()"></a></div>
                <font class="txt">注册成为后勤志愿者</font>
            </div>
            <div id="pu3">
                <div  class="tu"><a href="#"><img src="img/liyi.jpeg" onclick="click2()"></a></div>
                <font class="txt">注册成为礼仪志愿者</font>
            </div>
            <div id="pu4">
                <div  class="tu"><a href="#"><img src="img/liyi.jpeg" onclick="click3()"></a></div>
                <font class="txt">注册成为机动愿者</font>
            </div>
        </div>
    </div>
</div>
</body>
<%
    }
%>