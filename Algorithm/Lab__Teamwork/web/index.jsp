<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>杭州亚运会和亚残会赛会志愿者管理系统</title>
    <meta charset="utf-8">
    <style type="text/css">
        *{
            margin:0px;
            padding:0px;
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
        #zixun{
            margin-top: 30px;
            height: 500px;
            width: 100%;
        }
        #zixunleft{
            background-color: #5f5750;
            float: left;
            height: 500px;
            width: 40%;
        }
        #zixunleft ul li{
            margin-left: 5px;
            height: 50px;
            border-bottom:1px solid black;
            margin-top: 5px;
        }
        #zixunleft .zixunneirong{
            margin-left: 5px;
            margin-top: 12px;
            height: 34px;
            border-bottom:1px solid black;
        }
        #zixunleft a{
            color:#b0b0b0;
        }
        #zixunleft a:hover{
            color: #fff;
        }
        #zixunright{
            float: right;
            height: 500px;
            width: 59%;
        }
        #genduo{
            float: right;
            margin-right: 10px;
        }
        #zixunright #next{
            position: absolute;
            float:right;
            z-index: 2;
            margin-top: 220px;
            margin-left: 685px;
        }
        #zixunright #next img{
            position: absolute;
            float:right;
            z-index: 2;
            height:50px;
            width: 20px;
        }
        #zixunright #prev{
            position: absolute;
            float:left;
            z-index: 2;
            margin-top: 220px;
            margin-left:8px;
        }
        #zixunright #prev img{
            position: absolute;
            float:left;
            z-index: 2;
            height:50px;
            width: 20px;
        }
        #zixunright img{
            position: absolute;
            z-index: 1;
            height: 500px;
            width: 725px;
        }
        .text{
            font-size: 45px;
        }
        @keyframes masked-animation {
            0% {
                background-position: 0  0;
            }
            100% {
                background-position: -100%  0;
            }
        }
        #baoming{
            list-style-type: none;
            border: 1px solid #e0e0e0;
            background-color: #808080;
            margin-left: 1418px;
            margin-top: 160px;
            width: 100px;
            height: 300px; /* 全高 */
            position: fixed; /* 使它产生粘性，即使在滚动时 */
            overflow: auto; /* 如果侧栏的内容太多，则启用滚动条 */
        }
        #baoming li {
            line-height: 50px;
            height: 50px;
            text-align: center;
        }
        #baoming:hover{
            -webkit-box-shadow:0 15px 30px rgba(0,0,0,.1);
            box-shadow:0 15px 30px rgba(0,0,0,.3);
        }
        #baoming a{
            color: palegreen;
        }
        #baoming h3{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<ul id="baoming">
    <li><a href="#" class="text"><h3>志<br/>愿<br/>者<br/>报<br/>名</h3></a></li>
</ul>
<div id="back">
    <div id="center">
        <div id="top">
            <div id="topleft">
                <ul>
                    <li style="background-color: #33ff88;"><a href="index.jsp">首页</a></li>
                    <li><span>|</span></li>
                    <li><a href="#">报名流程</a><span>|</span></li>
                </ul>
            </div>
            <div id="topright">
                <ul>
                    <li><a href="personal_center.jsp">个人中心</a><span>|</span></li>
                    <li><a href="dengru.jsp">登入</a><span>|</span></li>
                    <li><a href="zuhce.jsp">注册</a><span>|</span></li>
                    <li><a href="#">消息(0)</a><span>|</span></li>
                </ul>
            </div>
        </div>
        <div id="img_and_name">
            <a href="index.jsp"><img src="img/zhiyuanzhe.png"></a>
            <span>杭州亚运会和亚残会赛会志愿者管理系统</span>
        </div>
        <div id="zixun">
            <div id="zixunleft">
                <ul>
                    <li ><a href="#">1.志愿者部召开杭州亚运会、亚残运会赛会志愿服务工作第5次例会暨场馆志愿者管理人员培训会</a></li>
                    <li class="zixunneirong"><a href="#">2.杭州亚运会、亚残运会赛会志愿者面试选拔3月底前结束</a></li>
                    <li class="zixunneirong"><a href="#">3.浙大城市学院杭州亚运会赛会志愿者面试选拔正在进行中</a></li>
                    <li class="zixunneirong"><a href="#">4.杭州亚运会赛会预录用志愿者通用培训在浙江大学启动</a></li>
                    <li class="zixunneirong"><a href="#">5.赛会志愿者选拔现场直击：浙江外国语学院看重两种能力</a></li>
                    <li class="zixunneirong"><a href="#">6.杭州亚运会赛会志愿者面试选拔在浙江各大高校陆续开展</a></li>
                    <li class="zixunneirong"><a href="#">7.杭州亚运会赛会志愿者面试选拔将于3月底前完成</a></li>
                    <li class="zixunneirong"><a href="#">8.杭州亚运会赛会志愿者纪念物资“小青盒”发布</a></li>
                    <li class="zixunneirong"><a href="#">9.直击赛会志愿者面试现场 “白衣天使”们来了</a></li>
                    <li class="zixunneirong"><a href="#">10.亚运会志愿者选拔：服务过北京奥运会的他也来面试了</a></li>
                </ul>
                <a href="#" id="genduo"><font>更多</font></a>
            </div>
            <div id="zixunright">
                <img src="img/zixun1.png" id="image">
                <button id="next"><img src="img/right.png"></button>
                <button id="prev"><img src="img/left.png"></button>
                <script type="text/javascript">
                    var image=document.getElementById('image');
                    var next=document.getElementById('next');
                    var prev=document.getElementById('prev');
                    var nowIndex=1;
                    var count=5;
                    next.onclick=function(){
                        nowIndex=nowIndex+1>count?1:nowIndex+1;
                        image.src="img/zixun"+nowIndex+".png";
                    }
                    prev.onclick=function(){
                        nowIndex=nowIndex-1>0?nowIndex-1:count;
                        image.src="img/zixun"+nowIndex+".png";
                    }
                    function next_pic(){
                        nowIndex=nowIndex+1>count?1:nowIndex+1;
                        image.src="img/zixun"+nowIndex+".png";
                    }
                    var timer=null;
                    function autoPlay(){
                        timer=setInterval(function(){
                            next_pic();
                        },5000)
                    }
                    autoPlay();
                </script>
            </div>
        </div>
    </div>
</div>
</body>
