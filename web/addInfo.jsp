<%--
  Created by IntelliJ IDEA.
  Users: LibraTang
  Date: 2018/10/20
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>添加学生信息</title>
</head>
<div align="center">
    <body>
        <h1 align="center">添加学生信息</h1>
        <form action="/addInfo" method="get">
            学号:<input type="text" name="id"><br><br>
            姓名:<input type="text" name="name"><br><br>
            性别:<input type="text" name="sex"><br><br>
            年龄:<input type="text" name="age"><br><br>
            学院:<input type="text" name="college"><br><br>
            专业:<input type="text" name="major"><br><br>
            联系方式:<input type="text" name="phone"><br><br>
            <br><br>
            <input type="submit" value="提交">
        </form>
    </body>
</div>
</html>
