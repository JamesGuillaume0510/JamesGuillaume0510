<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="assignment.*" %>
<%@ page import="assignment.dao.UserDao" %>
<%@ page import="assignment.bean.UserBean" %>
<%@ page import="static com.sun.xml.internal.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table" %>
<%@ page import="java.util.StringTokenizer" %>

<%
    UserBean recent_user=(UserBean) session.getAttribute("yong");
    // System.out.println(recent_user.toString());
    String UserId = recent_user.getUno();
    // ############################################################################# wlk
    // 数据库链接读取相关用户信息，并且将他们存入一个用户信息数组中                      ##
    // 1.创建一个用户类                            已经集成在UserBean.java中      ##
    // 2.创建一个存放完用户类的数组并连接数据库        已经集成在UserDao.java中        ##

    UserDao ud = new UserDao();
    int Uclass = recent_user.getUclass();
    // ############################################################################# wlk
%>

<%
    String mess = (String)request.getAttribute("mess");         // 获取错误属性
    String correct = (String)request.getAttribute("correct");
    if(mess != null) {
%>
<script type="text/javascript" language="javascript">
    alert("信息填写不完整，请重新填写");                                            // 弹出错误信息
    window.location='personal_center.jsp' ;                            // 跳转到登录界面
</script>
<%
    }
    if(correct != null) {
%>
<script type="text/javascript" language="javascript">
    alert("信息提交成功");                                            // 弹出错误信息
    window.location='personal_center.jsp' ;                            // 跳转到登录界面
</script>
<%
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>个人信息界面</title>
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
        #detail1{
            font-size: 23px;
        }
        .edit_box{
            width: 300px;
        }
        textarea{
            width: 300px;
        }

    </style>
    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript">

        function changeForm1(){
            // 给form绑定opcode = 1，即保存信息的情况
            $("#opcode").attr("value",1);
            $("#addForm").attr("action","${pageContext.request.contextPath}/do_user_info_operation.jsp");
        }

        function changeForm2(){
            // 给form绑定opcode = 2，即提交（相比于保存信息多了一层检测）
            $("#opcode").attr("value",2);
            $("#addForm").attr("action","${pageContext.request.contextPath}/do_user_info_operation.jsp");
        }
    </script>
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
                    <li><a href="#">你好，<%=recent_user.getUname()%></a><span>|</span></li>
                    <li><a href="dozhuxiao.jsp">退出登入</a><span>|</span></li>
                    <li><a href="#">消息(0)</a><span>|</span></li>
                </ul>
            </div>
        </div>
        <div id="img_and_name">
            <a href="shouye.jsp"><img src="img/zhiyuanzhe.png"></a>
            <span>杭州亚运会和亚残会赛会志愿者管理系统</span>
        </div>
        <div id="gerenxingxi" align="center">
            <font>个人信息填写</font>
            <%-- ################################################################ wlk --%>
            <form action="" id="addForm">
                <div id="EditBox">
                    <%if (Uclass == 0){     // 是普通用户%>
                    <table id="detail1">
                        <tr><td></td></tr>
                        <tr><td><input id="opcode" name="opcode" type="text" style="display: none"><input id="UserId" name="UserId" type="text" value="<%=UserId%>" style="display: none"></td></tr>
                        <tr><td>姓名：</td><td><input class="edit_box" type="text" id="Uname" name="Uname"></td></tr>
                        <tr><td>身份证号：</td><td><input type="text" class="edit_box" id="Uid" name="Uid"></td></tr>
                        <tr><td>身高：</td><td><input type="text" class="edit_box" id="height" name="height"></td></tr>
                        <tr><td>体重：</td><td><input type="text" class="edit_box" id="weight" name="weight"></td></tr>
                        <tr><td>电话：</td><td><input type="text" class="edit_box" id="tel" name="tel"></td></tr>
                    </table>
                    </div>
                    <div id="Buttons">
                        <button type="submit" onclick="changeForm1()">保存信息</button>
                        <button type="submit" onclick="changeForm2()">提交</button>
                    </div>
                    <%}else if(Uclass == 1) {       // 是实名用户%>
                    <table id="detail1">
                        <tr><td></td></tr>
                        <tr><td><input id="opcode" name="opcode" type="text" style="display: none"><input id="UserId" name="UserId" type="text" value="<%=UserId%>" style="display: none"></td></tr>
                        <tr><td>姓名：</td><td><input class="edit_box" type="text" id="Uname" name="Uname" value="<%=recent_user.getUname()%>"></td></tr>
                        <tr><td>身份证号：</td><td><input type="text" class="edit_box" id="Uid" name="Uid" value="<%=recent_user.getUid()%>"></td></tr>
                        <tr><td>身高：</td><td><input type="text" class="edit_box" id="height" name="height" value="<%=recent_user.getUheight()%>"></td></tr>
                        <tr><td>体重：</td><td><input type="text" class="edit_box" id="weight" name="weight" value="<%=recent_user.getUweight()%>"></td></tr>
                        <tr><td>电话：</td><td><input type="text" class="edit_box" id="tel" name="tel" value="<%=recent_user.getUtel()%>"></td></tr>
                    </table>
                    </div>
                    <div id="Buttons">
                        <button type="submit" onclick="changeForm1()">保存信息</button>
                        <button type="submit" onclick="changeForm2()">提交</button>
                    </div>
                    <%}else if (Uclass == 2){       // 是志愿者
                        String email = recent_user.getUemail();
                        recent_user = ud.getUserInfoById(recent_user.getUno());
                        session.setAttribute("yong",recent_user);
                        if (recent_user.getUno().equals("")){
                            recent_user = ud.getUserInfoByEmail(email);
                            session.setAttribute("yong",recent_user);
                        }
                        // System.out.println("volunteer bean: ");
                        // System.out.println(recent_user.toString());
                    %>
                    <table id="detail1">
                        <tr><td></td></tr>
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
                        <tr><td>身高：</td><td><%=recent_user.getUheight()%></td><td></td></tr>
                        <tr><td>体重：</td><td><%=recent_user.getUweight()%></td><td></td></tr>
                        <tr><td>电话：</td><td><%=recent_user.getUtel()%></td></tr>
                    </table>
                    <%}%>
            <%-- ################################################################ wlk --%>
            </form>
        </div>
    </div>
</div>
</body>
