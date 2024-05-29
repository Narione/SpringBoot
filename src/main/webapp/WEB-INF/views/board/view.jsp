<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ynhp3
  Date: 2024-05-28
  Time: 오후 5:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>${board.title}</div>
    <div>${board.content}</div>
    <div>${board.writer}</div>
    <div>${board.createDate}</div>
<div>
    <c:forEach items="${board.fileList}" var="file">
        <div>${file.originalName}</div>
    </c:forEach>
</div>
</body>
</html>
