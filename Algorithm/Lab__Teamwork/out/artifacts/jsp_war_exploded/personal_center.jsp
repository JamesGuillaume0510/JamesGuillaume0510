<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="assignment.*" %>
<%@ page import="assignment.dao.UserDao" %>
<%@ page import="assignment.bean.UserBean" %>
<%@ page import="static java.awt.SystemColor.window" %>

<!DOCTYPE html>
<html>
<head>
    <%
        String UserId = null;
        UserBean h = (UserBean) session.getAttribute("h");
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
    UserBean yong=(UserBean) session.getAttribute("yong");
    session.setAttribute("yong",yong);
    if(h.getUno()=="4"){
        int Uclass = yong.getUclass();
%>
    <script type="text/javascript">
        function delete_user() {
            if (confirm("确定要注销吗")){
                window.location.href="do_user_operation.jsp?UserId=<%=yong.getUno()%>&opCode=1";
            }
        }
        function change_password() {
            // alert("修改密码");
            window.location.href="change_password.jsp?UserId=<%=yong.getUno()%>";
        }
    </script>
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
        #pu1{
            height:160px;
            width:312px;
            float: left;
            margin-top: 40px;
            margin-left: 170px;

        }
        #pu1 img{
            height:160px;
            width:312px;
            float: left;
            filter: opacity(40%);
        }
        #pu2{
            margin-top: 40px;
            height:160px;
            width:312px;
            float: left;
            margin-left: 170px;
        }
        #pu2 img{
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
            margin-left:120px;
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
                <div  class="tu" ><a href="#" ><img src="img/xiugai.jpeg " onclick="change_password()"></a></div>
                <font class="txt">修改密码</font>
            </div>
            <div id="pu2">
                <div  class="tu"><a href="#"><img src="img/zhuxiao.jpeg"  onclick="delete_user()"></a></div>
                <font class="txt">注销账号</font>
            </div>
        </div>
        <div id="gongneng">
            <div id="function1">
                    <a href="personal_info.jsp">
                        <img src="img/xiugaigeren.png">
                        <font>查看个人信息</font>
                    </a>
            </div>
            <div id="function2">
                <a href="volunteer_register.jsp">
                    <img src="img/zhiyuanzhebaoming.png">
                    <font>志愿者报名</font>
                </a>
            </div>
            <div id="function3">
                <a href="zhiyuanshenqing.jsp">
                    <img src="img/xiugaizhiyuan.png">
                    <font>修改志愿</font>
                </a>
            </div>
            <div id="function4">
                <a href="#">
                    <img src="img/shengpijingdu.png">
                    <font>招募进展</font>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
<%
    }
%>
