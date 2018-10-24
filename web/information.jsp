<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%--
  Created by IntelliJ IDEA.
  Users: LibraTang
  Date: 2018/10/18
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java" %>
<html>
<head>
    <title>学生信息</title>
</head>
<div align="center">
    <body>
        <h1>学生信息</h1>
        <table align="center" width="100%" border="1">
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>学院</th>
                <th>专业</th>
                <th>联系方式</th>
                <th>操作</th>
            </tr>

            <%
                request.setCharacterEncoding("UTF-8");
            %>

            <c:forEach items="${list}" var="usr">
                <tr>
                    <td>${usr.id}</td>
                    <td>${usr.name}</td>
                    <td>${usr.sex}</td>
                    <td>${usr.age}</td>
                    <td>${usr.college}</td>
                    <td>${usr.major}</td>
                    <td>${usr.phone}</td>
                    <td>
                        <a href="/deleteInfo?id=${usr.id}">删除</a>
                        <a href="changeInfo.jsp?id=${usr.id}&name=${usr.name}&sex=${usr.sex}&age=${usr.age}&college=${usr.college}&major=${usr.major}&phone=${usr.phone}">修改</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <button onclick="{location.href='addInfo.jsp'}">添加学生信息</button>
        <br><br>
        <button onclick="{location.href='home.jsp'}">返回首页</button>
    </body>
</div>
</html>
