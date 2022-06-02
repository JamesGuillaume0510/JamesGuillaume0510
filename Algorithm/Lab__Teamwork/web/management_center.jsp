<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>管理中心</title>
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

            height:200px;;
        }
        .leixing{
            margin-left: 42%;
            color: black;
        }
        .anniu{
            margin-top: 110px;
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
                    <li><a href="management_center.jsp" style="background-color: #33ff88;">管理中心</a></li>
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
        <form class="shenqinbiao">
            <div class="leixing">
                <h2>申请成为志愿者</h2>
            </div>
            <div class="xinxi">

            </div>
            <div class="anniu">
                <button  class="btn two">驳回</button>
                <button  class="btn three">通过</button>
            </div>

        </form>
        <form class="shenqinbiao1">
            <div class="leixing">
                <h2>修改志愿</h2>
            </div>
            <div class="xinxi">

            </div>
            <div class="anniu">
                <button  class="btn two">驳回</button>
                <button  class="btn three">通过</button>
            </div>

        </form>
    </div>
</div>
</body>
