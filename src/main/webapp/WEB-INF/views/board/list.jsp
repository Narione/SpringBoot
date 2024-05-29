<%--
  Created by IntelliJ IDEA.
  User: ynhp3
  Date: 2024-05-28
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>list</title>
</head>
<body>
<table>
    <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일자</th>
    </tr>
    <c:forEach items="${boards}" var="board">
        <tr>
            <th>${board.no}</th>
            <th><a href="/board/view?no=${board.no}">${board.title}</a></th>
            <th>${board.writer}</th>
            <th>${board.createDate}</th>
        </tr>

    </c:forEach>
</table>

</body>
</html>
