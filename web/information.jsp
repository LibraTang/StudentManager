<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: LibraTang
  Date: 2018/10/18
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>Search Students Information</title>
</head>
<body>
    <h1 align="center">Search Students Information</h1>
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
                        <a href="/deleteInfo?id=<%=map.get("id")%>">É¾³ý</a>
                        <a
                            href="/changeInfo.jsp?id=<%=map.get("id")%>&name=<%=map.get("name")%>&sex=<%=map.get("sex")%>
                            &age=<%=map.get("age")%>&college=<%=map.get("college")%>&major=<%=map.get("major")%>
                            &phone=<%=map.get("phone")%>">
                        ÐÞ¸Ä</a>
                    </td>
                </tr>
        <%}%>

    </table>
</body>
</html>
