<%--
  Created by IntelliJ IDEA.
  User: 16033
  Date: 3/5/2022
  Time: 上午12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="sql.Vol" %>
<%@ page import="sql.VolDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="assignment.bean.UserBean" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<Vol> Volunteers = (List<Vol>) session.getAttribute("volunteers");
  if (Volunteers == null) {
    Volunteers = new ArrayList<Vol>();
    session.setAttribute("volunteers", Volunteers);
  }
%>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
  <title>查看志愿者信息界面</title>
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
    #gerenxiangxi{
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
      -webkit-transform:translate3d(0,-10px,0);
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
      -webkit-transform:translate3d(0,-10px,0);
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
      -webkit-transform:translate3d(0,-10px,0);
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
      -webkit-transform:translate3d(0,-10px,0);
    }
    td,th{
      border: 1px solid gray;
    }
    table{
      border-collapse:collapse
    }
  </style>
  <script>
    var xmlHttp;


    function getDetectedGroup(gno){
      createXMLHttpRequest();
      xmlHttp.open("GET","selectGroup.jsp?Gno="+gno,true);
      xmlHttp.onreadystatechange = handleStateChange;
      xmlHttp.send();

    }

    function createXMLHttpRequest() {
      if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
      }else {
        alert("您的浏览器不支持 XMLHTTP.");
      }
    }

    function handleStateChange(){
      if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
          parseResults();
        }
      }
    }

    function parseResults(){

      var detectedGroup =xmlHttp.responseText.replace(/\s*/g,"");
      var allGroup = document.getElementById("allGroup");
      var G01 = document.getElementById("G01");
      var G02 = document.getElementById("G02");

      if(detectedGroup=="全部"){

        sessionStorage.setItem("group","全部");
        allGroup.style.display = "block";
        G01.style.display = "none";
        G02.style.display = "none";
      }else if(detectedGroup=="G01"){

        sessionStorage.setItem("group","G01");
        allGroup.style.display = "none";
        G01.style.display = "block";
        G02.style.display = "none";

      }else if(detectedGroup=="G02"){

        sessionStorage.setItem("group","G02");
        allGroup.style.display = "none";
        G01.style.display = "none";
        G02.style.display = "block";
      }

    }

    function appoint(Uno,Gno){
      createXMLHttpRequest();
      xmlHttp.open("GET","appoint.jsp?Uno="+Uno+"&Gno="+Gno,true);
      xmlHttp.onreadystatechange = function (){
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
          //var group = document.getElementById("selectGroup").value;
          location.reload();
          //getDetectedGroup(group);
          //document.getElementById("selectGroup").options[1].selected = true;


        }
      };
      xmlHttp.send();
    }

    window.onload = function () {
      document.getElementById("selectGroup").addEventListener('change',function (){
        getDetectedGroup(this.value);
      },false);

      for(var i=0,j=document.getElementsByTagName("button");i<j.length;i++){
        j[i].onclick = function (){
          appoint(this.name,this.value);
        }
      }



      var group = sessionStorage.getItem("group");
      console.log(group);
      var allGroup = document.getElementById("allGroup");
      var G01 = document.getElementById("G01");
      var G02 = document.getElementById("G02");
      if(group == "全部"){

        document.getElementById("selectGroup").options[0].selected = true;
        allGroup.style.display = "block";
        G01.style.display = "none";
        G02.style.display = "none";
      }else if(group=="G01"){

        document.getElementById("selectGroup").options[1].selected = true;
        allGroup.style.display = "none";
        G01.style.display = "block";
        G02.style.display = "none";

      }else if(group=="G02"){

        document.getElementById("selectGroup").options[2].selected = true;
        allGroup.style.display = "none";
        G01.style.display = "none";
        G02.style.display = "block";
      }else{
        document.getElementById("selectGroup").options[0].selected = true;
        allGroup.style.display = "block";
        G01.style.display = "none";
        G02.style.display = "none";
      }
    }
  </script>
</head>
<%
  UserBean yong=(UserBean) session.getAttribute("yong");
%>
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
          <li><a href="admin_center.jsp" style="background-color: #33ff88;">管理中心</a></li>
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
    <div>
      <p style="margin-left:65%;float: left ">选择组：</p>
      <form action="">
        <select id="selectGroup">
          <option id="0">全部</option>
          <option id="1" value="G01" >体育馆</option>
          <option id="2" value="G02" >田径场</option>
        </select>
      </form>

    </div>
    <div id="allGroup" style="text-align: center;margin-top: 3%;">
      <table   width="50%" style="text-align: center;border: 1px solid;margin: 10px auto auto;">
        <tr>
          <th>志愿者编号</th>
          <th>姓名</th>
          <th>性别</th>
          <th>组编号</th>
          <th>组名</th>
          <th>职务</th>
          <th>组长任免</th>
        </tr>
        <%
          VolDAO vol = new VolDAO();
          List<Vol> volunteers = vol.getAllVolunteers();
          for(int i=0;i<volunteers.size();i++){
            Vol volunteer = volunteers.get(i);

        %>
        <tr>
          <td><%=volunteer.getUno()%></td>
          <td><a href="UserInfo.jsp?id=<%=volunteer.getUno()%>"><%=volunteer.getUname()%></a></td>
          <td><%=volunteer.getUsex()%></td>
          <td><%=volunteer.getGno()%></td>
          <td><%=volunteer.getGname()%></td>
          <td><%=volunteer.getPosition()%></td>
          <td><% if(volunteer.getPosition().equals("组员")){
          %><button name="<%=volunteer.getUno()%>" value="<%=volunteer.getGno()%>">任命组长</button> <%
            } %></td>
        </tr>
        <% } %>
      </table>
    </div>

    <div id="G01" style="text-align: center;margin-top: 3%;display: none">
      <table   width="50%" style="text-align: center;border: 1px solid;margin: 10px auto auto;">
        <tr>
          <th>志愿者编号</th>
          <th>姓名</th>
          <th>性别</th>
          <th>组编号</th>
          <th>组名</th>
          <th>职务</th>
          <th>组长任免</th>
        </tr>
        <%
          VolDAO vol1 = new VolDAO();
          List<Vol> volunteers1 = vol1.getVolunteersByGroup("G01");
          for(int i=0;i<volunteers1.size();i++){
            Vol volunteer = volunteers1.get(i);

        %>
        <tr>
          <td><%=volunteer.getUno()%></td>
          <td><a href=""></a><a><%=volunteer.getUname()%></a></td>
          <td><%=volunteer.getUsex()%></td>
          <td><%=volunteer.getGno()%></td>
          <td><%=volunteer.getGname()%></td>
          <td><%=volunteer.getPosition()%></td>
          <td><% if(volunteer.getPosition().equals("组员")){
          %><button name="<%=volunteer.getUno()%>" value="<%=volunteer.getGno()%>">任命组长</button> <%
            } %></td>

        </tr>
        <% } %>
      </table>
    </div>

    <div id="G02" style="text-align: center;margin-top: 3%;display: none">
      <table   width="50%" style="text-align: center;border: 1px solid;margin: 10px auto auto;">
        <tr>
          <th>志愿者编号</th>
          <th>姓名</th>
          <th>性别</th>
          <th>组编号</th>
          <th>组名</th>
          <th>职务</th>
          <th>组长任免</th>
        </tr>
        <%
          VolDAO vol2 = new VolDAO();
          List<Vol> volunteers2 = vol2.getVolunteersByGroup("G02");
          for(int i=0;i<volunteers2.size();i++){
            Vol volunteer = volunteers2.get(i);

        %>
        <tr>
          <td><%=volunteer.getUno()%></td>
          <td><a href=""></a><a><%=volunteer.getUname()%></a></td>
          <td><%=volunteer.getUsex()%></td>
          <td><%=volunteer.getGno()%></td>
          <td><%=volunteer.getGname()%></td>
          <td><%=volunteer.getPosition()%></td>
          <td><% if(volunteer.getPosition().equals("组员")){
          %><button name="<%=volunteer.getUno()%>" value="<%=volunteer.getGno()%>">任命组长</button> <%
            } %></td>

        </tr>
        <% } %>
      </table>
    </div>


  </div>
</div>
</body>