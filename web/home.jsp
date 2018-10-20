<%--
  Created by IntelliJ IDEA.
  Users: LibraTang
  Date: 2018/10/16
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
  <head>
    <title>学生信息管理系统</title>
  </head>
  <div align="center">
      <body>
        <h1 align="center">学生信息管理系统</h1>

        <form action="/searchInfo" method="get">
            学号:<input type="text" name="id"><input type="submit" value="查询">
        </form>

        <button onclick="{location.href='/searchAllInfo'}">全部学生信息</button>
        <br><br>
        <button onclick="{location.href='addInfo.jsp'}">添加学生信息</button>

      </body>
  </div>
</html>
