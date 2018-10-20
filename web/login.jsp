<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: LibraTang
  Date: 2018/10/20
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<div align="center">
    <body>
        <h1>用户登录</h1>

    <%
        request.setCharacterEncoding("utf-8");
    %>

    <%
        List<String> info = (List<String>) request.getAttribute("info"); //得到结果
        String s;

        //若用户有登录操作，则信息不为空
        if(info != null) {
            Iterator<String> iterator = info.iterator();
            while(iterator.hasNext()) {
                s = iterator.next();
                //若登录成功则跳转到首页
                if (s.equals("登录成功")) {
                    response.sendRedirect("home.jsp");
                }
                //登录不成功提示错误
                else {
    %>

    <h4><%=s%></h4> //显示错误

    <%
                }
            }
        }
    %>

    <form action="/Login" method="post" onsubmit="return validate(this)">
        用户名：<input type="text" name="name"><br>
        密码：<input type="password" name="password"><br>
        <input type="submit" value="登录">
    </form>

    </body>
</div>
</html>
