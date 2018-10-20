<%--
  Created by IntelliJ IDEA.
  Users: LibraTang
  Date: 2018/10/19
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>修改学生信息</title>
</head>
<div align="center">
    <body>
        <h1>修改学生信息</h1>
        <form action="/changeInfo" method="get">
            学号:<input type="text" name="id" value=<%=request.getParameter("id")%>><br><br>
            姓名:<input type="text" name="name" value=<%=request.getParameter("name")%>><br><br>
            性别:<input type="text" name="sex" value=<%=request.getParameter("sex")%>><br><br>
            年龄:<input type="text" name="age" value=<%=request.getParameter("age")%>><br><br>
            学院:<input type="text" name="college" value=<%=request.getParameter("college")%>><br><br>
            专业:<input type="text" name="major" value=<%=request.getParameter("major")%>><br><br>
            联系方式:<input type="text" name="phone" value=<%=request.getParameter("phone")%>><br><br>
            <br><br>
            <input type="submit" value="修改">
        </form>
    </body>
</div>
</html>
