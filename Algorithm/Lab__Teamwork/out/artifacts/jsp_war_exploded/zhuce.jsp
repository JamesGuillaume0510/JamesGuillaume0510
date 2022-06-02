<%@ page import="static com.sun.org.apache.xalan.internal.xsltc.compiler.sym.error" %>
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
            margin-top: 3%;
            margin-right: 10%;
            width: 30%;
            float: right;
        }
        #yiyue{
            font-size: 10px;
        }
    </style>
    <%try {
            int error = Integer.parseInt(request.getParameter("error"));
        }catch (Exception e){%>
        <script type="javascript"> alert("注册失败，请检查邮箱")</script>
    <%}%>
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
                    <li><a href="personal_center.jsp">个人中心</a><span>|</span></li>
                    <li><a href="dengru.jsp">登入</a><span>|</span></li>
                    <li><a href="zhuce.jsp" style="background-color: #33ff88;">注册</a></li>
                    <li><span>|</span></li>
                    <li><a href="#">消息(0)</a></li>
                </ul>
            </div>
        </div>
        <div id="img_and_name">
            <a href="#"><img src="img/zhiyuanzhe.png"></a>
            <span>杭州亚运会和亚残会赛会志愿者管理系统</span>
        </div>
        <form action="dozhuce.jsp" method="post" id="form">
            <br>
            <div class="zuo">
                <label ><h2>注册</h2></label>
            </div>
            <div class="zuo">
                <label for="email">邮箱</label>
                <input type="text" id="email" name="email" />
                <p id="email_p">输入您的邮箱</p>
            </div>
            <div class="zuo">
                <label for="password">密码</label>
                <input type="password" id="password" name="password"/>
                <p id='password_p'>请输入密码</p>
            </div>
            <div class="zuo">
                <label for="password_confirm">密码确认</label>
                <input type="password" id="password_confirm" name="password_confirm"/>
                <p id="password_confirm_p">再次输入相同的密码</p>
            </div>
            <div class="zuo">
                <input type="submit" id="submit" value="提交" />
            </div>
            <div id="neirong"><font>一、信息采集及隐私保护政策的背景<br>
                为依法保障赛会志愿者申请人合法权益，合理采集个人信息，尊重并保护个人隐私，杭州亚组委制定《2022年杭州亚运会和亚残运会赛会志愿者申请人信息采集及隐私保护政策》。
                根据工作需要，在遵守中华人民共和国法律法规、遵循合法、正当、必要的原则，及保护个人隐私的前提下，杭州亚组委将有权采集、处理和使用赛会志愿者及赛会志愿者申请人的个人信息。</font><br>
                <font>二、信息用途<br>
                    1.作为赛会志愿服务运行与管理的背景资料。<br>
                    2.作为赛会志愿者选拔录用的参考依据。<br>
                    3.作为赛会志愿者岗位分配和制服发放型号的参考依据。<br>
                    4.用于与赛会志愿者及赛会志愿者申请人取得联系的渠道之一，并在后续工作中推送相关信息。<br>
                    5.用于赛会志愿者申请人反映个人服务意愿的渠道之一。</font><br><br>
                <input value="0" type="radio" name="queding" style="float: left; margin-top: 6px; padding: 0px; width: 10px; display:inline;" >
                <font id="yiyue">我已阅读并同意 2022年杭州亚运会和亚残运会赛会志愿者申请人信息采集和隐私保护政策</font>
            </div>
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
                    validatePassword();
                    validateConPassword();
                    validateEmail();
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
            //验证邮箱
            var validateEmail = function(){
                if(email_info.value!=""){
                    var filter = /^[a-z0-9]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/;
                    if(filter.test(email_info.value)){
                        email_p.innerHTML = "邮箱格式正确";
                        email_p.style.color = "#0f0";
                        email_info.style.border = "2px solid #0f0";
                        return true;
                    }else{
                        email_p.innerHTML = "邮箱格式错误";
                        email_p.style.color = "#f00";
                        email_info.style.border = "2px solid #f00";
                        return false;
                    }
                }else{
                    email_p.innerHTML = "输入您的邮箱";
                    email_p.style.color = "#BBB";
                    email_info.style.border = "1px solid #888";
                    return false;
                }
            }
            //验证手机号码
            var validatePhone = function(){
                if(phone_info.value != ""){
                    var filter = /^1[3|4|5|8][0-9]\d{8}$/i;
                    if(filter.test(phone_info.value)){
                        phone_p.innerHTML = "手机格式正确";
                        phone_p.style.color = "#0f0";
                        phone_info.style.border = "2px solid #0f0";
                        return true;
                    }else{
                        phone_p.innerHTML = "手机格式错误";
                        phone_p.style.color = "#f00";
                        phone_info.style.border = "2px solid #f00";
                        return false;
                    }
                }else{
                    phone_p.innerHTML = "输入您的手机号码";
                    phone_p.style.color = "#BBB";
                    phone_info.style.border = "1px solid #888";
                    return false;
                }
            }
            var valiqueding = function(){
                if (queding [0].checked) {
                    return true;
                }
                else{
                    alert("请确认已阅读隐私政策。")
                }
            }
            var validateAll = function (e){
                if(validatePassword()&&validateEmail()&&validateConPassword()&&valiqueding()){
                    alert("注册成功！")
                }else{
                    alert("注册失败，请正确填写。");
                    e.preventDefault();
                    return false;
                }
            }
            subObj=document.getElementById("submit");
            if(subObj.addEventListener){
                subObj.addEventListener("click",validateAll,false);
            }else{
                subObj.attachEvent("onclick",validateAll);
            }
        </script>

    </div>
</div>
</body>
