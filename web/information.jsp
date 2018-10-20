<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: LibraTang
  Date: 2018/10/18
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java" %>
<html>
<head>
    <title>Search Students Information</title>
</head>
<div align="center">
    <body>
        <h1>Search Students Information</h1>
        <table align="center" width="100%" border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Sex</th>
                <th>Age</th>
                <th>College</th>
                <th>Major</th>
                <th>Phone</th>
                <th>Operate</th>
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
        <button onclick="{location.href='index.jsp'}">返回首页</button>
    </body>
</div>
</html>
