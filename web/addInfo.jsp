<%--
  Created by IntelliJ IDEA.
  User: LibraTang
  Date: 2018/10/20
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Add information</title>
</head>
<div align="center">
    <body>
        <h1 align="center">Add information</h1>
        <form action="/addInfo" method="get">
            ID:<input type="text" name="id"><br><br>
            Name:<input type="text" name="name"><br><br>
            Sex:<input type="text" name="sex"><br><br>
            Age:<input type="text" name="age"><br><br>
            College:<input type="text" name="college"><br><br>
            Major:<input type="text" name="major"><br><br>
            Phone:<input type="text" name="phone"><br><br>
            <br><br>
            <input type="submit" value="提交">
        </form>
    </body>
</div>
</html>
