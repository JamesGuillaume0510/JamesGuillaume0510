<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="assignment.dao.UserDao"%>
<%@ page import="assignment.bean.UserBean"%>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>登入界面</title>
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
            width: 80%;
            margin: 0px auto;
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
        label,input{
            display:block;
            width:300px;
        }

        input#submit {
            border: none;
            background-color: #2F79BA;
            width: 100%;
            float:right;
            color: #fff;
            border-radius: 5px;
            padding: 10px 20px;
            margin-top:10px;
            margin-left:2%;
            cursor: pointer;
        }
        form{
            margin-top: 10%;
            margin-left: 620px;
        }
        form div{
            margin:5px auto;
            width: 300px;
        }
        input{
            border:1px solid #888;
            padding: 7px;
        }

        p {
            font-size: .8rem;
            color: #BBBBBB;
            margin:0;
        }
        video{
            position: absolute;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<%
    UserBean yong = (UserBean) session.getAttribute("yong");
    if (yong == null) {
        yong = new UserBean();
        session.setAttribute("yong", yong);
    }
    UserBean h = (UserBean) session.getAttribute("h");
    if (h == null) {
        h = new UserBean();
        session.setAttribute("h", h);
    }
    if(Objects.equals(h.getUno(), "1")){%>
<script>
    alert("登入失败");
</script>
<%
        h.setUno("0");
    }
    if(Objects.equals(h.getUno(), "3")){%>
<script>
    alert("您还未登录，请先登录！");
</script>
<%
        h.setUno("0");
    }
%>
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
                    <li><a href="personal_center.jsp">个人中心</a><span>|</span></li>
                    <li><a href="dengru.jsp" style="background-color: #33ff88;">登入</a></li>
                    <li><span>|</span></li>
                    <li><a href="zhuce.jsp">注册</a><span>|</span></li>
                    <li><a href="#">消息(0)</a><span>|</span></li>
                </ul>
            </div>
        </div>
        <div id="img_and_name">
            <a href="shouye.jsp"><img src="img/zhiyuanzhe.png"></a>
            <span>杭州亚运会和亚残会赛会志愿者管理系统</span>
        </div>
        <video src="img/shiping.mp4" autoplay="autoplay" muted="muted" controls="controls" loop="loop" height="400">
        </video>
        <form action="dodengru.jsp" method="post" id="form">
            <br>
            <div>
                <label for="name">电子邮件</label>
                <input type="text" id="name" name="name"/>
                <p id="name_p">必填，长度为4~16个字符</p>
            </div>
            <div>
                <label for="password">密码</label>
                <input type="password" id="password" name="password"/>
                <p id='password_p'>请输入密码</p>
                <input type="radio" value="0" name="shenfen" style="float: left; margin-left: 70px;margin-top: 6px; padding: 0px; width: 10px; display:inline;" checked="true">
                <font id="yiyue1" style="float: left;">用户</font>
                <input type="radio" value="3" name="shenfen" style="float: left; margin-left: 80px; margin-top: 6px; padding: 0px; width: 10px; display:inline;" >
                <font id="yiyue2" style="float: left;">管理员</font>
                <input  type="submit" id="submit" value="提交" />
            </div>

        </form>
        <script type="text/javascript">
            var name_info = document.getElementById('name');
            var password_info = document.getElementById('password');
            var name_p = document.getElementById('name_p');
            var password_p = document.getElementById('password_p');
            let shenfen = document.getElementsByName("shenfen");

            //获取焦点和失去焦点

            for(var i=0,j=document.getElementsByTagName("input");i<j.length;i++){
                j[i].onblur=function(){//表单失去焦点时，显示验证结果
                    validateName();
                    validatePassword();

                }

            }


            //验证账号
            var validateName = function() {
                if (name_info.value == "") { //验证是否为空
                    name_p.innerHTML = "必填，长度为4~16个字符";
                    name_p.style.color = "#BBB";
                    name_info.style.border = "1px solid #888";
                    return false;
                } else if (name_info.value.length < 4 || name_info.value.length > 16) { //验证长度是否符合标准
                    name_p.innerHTML = "长度只能为为4~16个字符";
                    name_p.style.color = "#f00";
                    name_info.style.border = "2px solid #f00";
                    return false;
                } else {
                    name_p.innerHTML = "名称格式正确";
                    name_p.style.color = "#0f0";
                    name_info.style.border = "2px solid #0f0";
                    return true;
                }
            }
            //验证密码
            var validatePassword = function(){
                if(password_info.value!=""){
                    password_p.innerHTML = "密码可用";
                    password_p.style.color = "#0f0";
                    password_info.style.border = "2px solid #0f0"
                    return true;
                }else{
                    password_p.innerHTML = "请输入密码";
                    password_p.style.color = "#BBBBBB";
                    password_info.style.border = "1px solid #888";
                    return false;
                }
            }
            var validateAll = function (e){
                if(validateName()&&validatePassword()){

                }else{
                    alert("提交失败，请正确填写。");
                    e.preventDefault();
                    return false;
                }
            }
            subObj=document.getElementById("submit");
            if(subObj.addEventListener){
                subObj.addEventListener("click",validateAll,false)
            }else{
                subObj.attachEvent("onclick",validateAll)
            }

        </script>
    </div>
</div>
</body>
