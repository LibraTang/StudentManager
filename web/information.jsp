<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
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

            <%
                List<Map> list = (List)request.getAttribute("list");
                for(Map map : list) {
            %>
                    <tr>
                        <td><%=map.get("id")%></td>
                        <td><%=map.get("name")%></td>
                        <td><%=map.get("sex")%></td>
                        <td><%=map.get("age")%></td>
                        <td><%=map.get("college")%></td>
                        <td><%=map.get("major")%></td>
                        <td><%=map.get("phone")%></td>
                        <td>
                            <a href="/deleteInfo?id=<%=map.get("id")%>">删除</a>
                            <a
                                href="/changeInfo.jsp?id=<%=map.get("id")%>&name=<%=map.get("name")%>&sex=<%=map.get("sex")%>
                                &age=<%=map.get("age")%>&college=<%=map.get("college")%>&major=<%=map.get("major")%>
                                &phone=<%=map.get("phone")%>">
                            修改</a>
                        </td>
                    </tr>
            <%}%>
        </table>
        <br>
        <button onclick="{location.href='addInfo.jsp'}">添加学生信息</button>
        <br><br>
        <button onclick="{location.href='home.jsp'}">返回首页</button>
    </body>
</div>
</html>
