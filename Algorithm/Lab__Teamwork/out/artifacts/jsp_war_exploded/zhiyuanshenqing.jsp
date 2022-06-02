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
    <title>修改志愿界面</title>
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
    <script type="text/javascript">
        function chackMclass(n){
            var x;
            x=document.getElementById('Mclass').value;
            if (x==1 || x==2){
                document.getElementById("Gno").value="";
                document.getElementById("G01").style.display="none";
                document.getElementById("G02").style.display="none";
                document.getElementById("G03").style.display="none";
                document.getElementById("G04").style.display="none";
                document.getElementById(n).style.display="inline";

            }
            else if(x==3){
                document.getElementById("Gno").value="";
                document.getElementById("G01").style.display="inline";
                document.getElementById("G02").style.display="inline";
                document.getElementById("G03").style.display="inline";
                document.getElementById("G04").style.display="inline";
                document.getElementById(n).style.display="none";
            }
            else if(x==5){
                document.getElementById("Gno").value="";
                document.getElementById("G01").style.display="inline";
                document.getElementById("G02").style.display="inline";
                document.getElementById("G03").style.display="inline";
                document.getElementById("G04").style.display="inline";
            }

        }
    </script>
</head>
<body>
<%
    UserBean yong=(UserBean) session.getAttribute("yong");

%>
<script language="JavaScript">
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
        <%
            manageGet manageList2=new manageGet();
            if(manageList2.chackManageExist(yong.getUno())){
        %>
        <form class="shenqinbiao">
            <div class="leixing">
                <h2>待审批申请</h2>
            </div>
            <div class="xinxi">
                <table style="margin-left: 250px;text-align: center">
                    <tr>
                        <th>申请编号</th>
                        <th>用户编号</th>
                        <th>申请分组</th>
                        <th>申请项目</th>
                        <th>申请状态</th>
                    </tr>
                    <% manageGet manageList3=new manageGet();
                        List<manage> m3= manageList3.getManageByUno(yong.getUno());
                        manage m4 = m3.get(0);
                    %>
                    <tr>
                        <td><%=m4.getMnum()%></td>
                        <td><%=m4.getUno()%></td>
                        <td><%=m4.getGno()%></td>
                        <td><%=m4.getMclassOfchange()%></td>
                        <td>正在审批中</td>
                    </tr>

                </table>
            </div>
        </form>

        <%
        }
        else{
            GroupMassageGet manageChack=new GroupMassageGet();
            //String user=request.getParameter("user");
            if(manageChack.chackVolunteerExist(yong.getUno())){
        %>
        <script type="text/javascript" language="javascript">
            alert("请先申请成为志愿者");                                            // 弹出处理信息
            window.location='volunteer_register.jsp' ;                            // 跳转到申请界面
        </script>

        <%}

        else{
            GroupMassageGet manageList=new GroupMassageGet();
            //String user=request.getParameter("user");
            volunteerGroupMassage m1= manageList.getGroupmassageByUno(yong.getUno());
            if(m1.textLno()){

        %>



        <form class="shenqinbiao" name="process" method="post" action="doAddManage.jsp">
            <div class="leixing">
                <h2>志愿修改申请</h2>
            </div>
            <div class="xinxi">
                <table style="margin-left: 250px;text-align: center">
                    <tr>
                        <th>用户编号</th>
                        <th>所属分组</th>
                        <th>申请事项</th>
                        <th>申请分组</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td><input type="text" name="Uno" id="Uno" value="<%=m1.getUno()%>" readonly style="width: 100px"></td>
                        <td><input type="text"  value="<%=m1.getGno()%>" readonly style="width: 100px"></td>
                        <td><select  name="Mclass" onchange="chackMclass('<%=m1.getGno()%>')" id="Mclass">
                            <option value="5">--请选择--</option>
                            <option value="2" id="v3">申请撤销组长职务</option>
                        </select></td>
                        <td><select  name="Gno" id="Gno">
                            <option value="">--请选择--</option>
                            <option value="G01" id="G01">technology</option>
                            <option value="G02" id="G02">logistics</option>
                            <option value="G03" id="G03">protocol</option>
                            <option value="G04" id="G04">flexible</option>
                        </select></td>
                        <td><button  class="" onclick="">提交</button></td>
                    </tr>
                </table>
            </div>
        </form>
        <%
        }
        else{
        %>
        <form class="shenqinbiao" name="process" method="post" action="doAddManage.jsp">
            <div class="leixing">
                <h2>志愿修改申请</h2>
            </div>
            <div class="xinxi">
                <table style="margin-left: 250px;text-align: center">
                    <tr>
                        <th>用户编号</th>
                        <th>所属分组</th>
                        <th>申请事项</th>
                        <th>申请分组</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td><input type="text" name="Uno" id="Uno" value="<%=m1.getUno()%>" readonly style="width: 100px"></td>
                        <td><input type="text"  value="<%=m1.getGno()%>" readonly style="width: 100px"></td>
                        <td><select  name="Mclass" onchange="chackMclass('<%=m1.getGno()%>')" id="Mclass">
                            <option value="5">--请选择--</option>
                            <option value="1" id="v2">申请成为组长</option>
                            <option value="3" id="v4">申请修改分组</option>
                        </select></td>
                        <td><select  name="Gno" id="Gno">
                            <option value="">--请选择--</option>
                            <option value="G01" id="G01">technology</option>
                            <option value="G02" id="G02">logistics</option>
                            <option value="G03" id="G03">protocol</option>
                            <option value="G04" id="G04">flexible</option>
                        </select></td>
                        <td><button  class="" onclick="">提交</button></td>
                    </tr>
                </table>
            </div>
        </form>
        <%}
        }
        }%>
    </div>
</div>

</body>
