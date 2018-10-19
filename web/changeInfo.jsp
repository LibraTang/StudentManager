<%--
  Created by IntelliJ IDEA.
  User: LibraTang
  Date: 2018/10/19
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change information</title>
</head>
<div align="center">
    <body>
        <h1>Change information</h1>
        <form action="/changeInfo" method="get">
            ID:<input type="text" name="id" value=<%=request.getParameter("id")%>><br><br>
            Name:<input type="text" name="name" value=<%=request.getParameter("name")%>><br><br>
            Sex:<input type="text" name="sex" value=<%=request.getParameter("sex")%>><br><br>
            Age:<input type="text" name="age" value=<%=request.getParameter("age")%>><br><br>
            College:<input type="text" name="college" value=<%=request.getParameter("college")%>><br><br>
            Major:<input type="text" name="major" value=<%=request.getParameter("major")%>><br><br>
            Phone:<input type="text" name="phone" value=<%=request.getParameter("phone")%>><br><br>
            <br><br>
            <input type="submit" value="修改">
        </form>
    </body>
</div>
</html>
