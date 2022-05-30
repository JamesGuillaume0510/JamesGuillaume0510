<%@ page import="assignment.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册界面</title>
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
        label{
            margin-bottom: 5px;
        }
        label,input{
            display:block;
            width:400px;
        }

        input#submit {
            border: none;
            background-color: #2F79BA;
            color: #fff;
            border-radius: 5px;
            padding: 10px 20px;
            margin-top:10px;
            cursor: pointer;
        }
        form{
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        form .zuo{
            float: left;
            margin:5px ;
            margin-left: 100px;
            display: flex;
            flex-flow: inherit;
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
        #neirong{
            position: absolute;
            margin-left: 38%;
            margin-top: 10%;
            margin-right: 10%;
            width: 30%;
            float: right;
        }
        #yiyue{
            font-size: 10px;
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
                    <li><a href="personal_center.jsp">个人中心</a><span>|</span></li>
                    <li><a href="login.jsp">登入</a><span>|</span></li>
                    <li><a href="register.jsp" style="background-color: #33ff88;">注册</a></li>
                    <li><span>|</span></li>
                    <li><a href="#">消息(0)</a><span>|</span></li>
                </ul>
            </div>
        </div>
        <div id="img_and_name">
            <a href="index.jsp"><img src="img/zhiyuanzhe.png"></a>
            <span>杭州亚运会和亚残会赛会志愿者管理系统</span>
        </div>
        <%String UserId = request.getParameter("UserId");%>
        <form action="do_user_operation.jsp?UserId=<%=UserId%>&opCode=2" method="post" id="form">
            <br>
            <div class="zuo">
                <label ><h2>注册</h2></label>
            </div>
            <div class="zuo">
                <label for="password">新密码</label>
                <input type="password" id="password" name="password"/>
                <p id='password_p'>请输入新密码</p>
            </div>
            <div class="zuo">
                <label for="password_confirm">新密码确认</label>
                <input type="password" id="password_confirm" name="password_confirm"/>
                <p id="password_confirm_p">再次输入相同的密码</p>
            </div>
            <button type="submit">提交</button>
        </form>

        <script type="text/javascript">
            var name_info = document.getElementById('name');
            var password_info = document.getElementById('password');
            var password_confirm_info = document.getElementById('password_confirm');
            var email_info = document.getElementById('email');
            var phone_info = document.getElementById('phone_number')
            var name_p = document.getElementById('name_p');
            var password_p = document.getElementById('password_p');
            var password_confirm_p = document.getElementById('password_confirm_p');
            var email_p = document.getElementById('email_p');
            var phone_p = document.getElementById('phone_number_p')
            let queding = document.getElementsByName("queding");

            //获取焦点和失去焦点
            for(var i=0,j=document.getElementsByTagName("input");i<j.length;i++){
                j[i].onblur=function(){//表单失去焦点时，显示验证结果
                    validateName();
                    validatePassword();
                    validateConPassword();
                    validateEmail();
                    validatePhone();
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
            var validateConPassword = function(){
                if(password_confirm_info.value!=""){
                    if(password_info.value === password_confirm_info.value){
                        password_confirm_p.innerHTML = "密码输入一致";
                        password_confirm_p.style.color = "#0f0";
                        password_confirm_info.style.border = "2px solid #0f0";
                        return true;
                    }else{
                        password_confirm_p.innerHTML = "密码输入不一致";
                        password_confirm_p.style.color = "#f00";
                        password_confirm_info.style.border = "2px solid #f00";
                        return false;
                    }
                }else{
                    password_confirm_p.innerHTML = "再次输入相同的密码";
                    password_confirm_p.style.color = "#bbb";
                    password_confirm_info.style.border = "1px solid #888";
                    return false;
                }
            }
        </script>
    </div>
</div>
</body>

