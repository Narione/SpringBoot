<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ynhp3
  Date: 2024-05-28
  Time: 오후 5:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<div class="container">

    <h3>${board.title}</h3>
    <div class="row">
    <div class="col-6">${board.writer}</div>
    <div class="col-6">${board.createDate}</div>

    </div>
    <div class="row">
    <div>${board.content}</div>

    </div>
    <hr class="my3">
    <div class="row">

        <div>첨부파일
            <c:forEach items="${board.fileList}" var="file">
                <div>${file.originalName}</div>
            </c:forEach>
        </div>
    </div>
    <hr class="my3">
    <div class="row">
        <h6>댓글</h6>
        <div>


        <div class="list-group" id="commentList">
            <c:forEach items="${board.commentList}" var="comment">
                <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                    <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
                    <div class="d-flex gap-2 w-100 justify-content-between">
                        <div>
                            <h6 class="mb-0">${comment.writer}</h6>
                            <p class="mb-0 opacity-75">${comment.content}</p>
                        </div>
                        <small class="opacity-50 text-nowrap">${comment.createDate}</small>
                        <div>
                        <button class="btn btn-secondary" type="button" id="modifyBtn">수정</button>
                        <button class="btn btn-secondary" type="button" id="removeBtn">삭제</button>
                        </div>
                    </div>
                </a>
            </c:forEach>

        </div>
        </div>

        <!--댓글입력부분-->
        <div>
            <form class="row" id="registerForm">
                <div class="input-group">
                    <textarea name="content" class="form-control" id="content"></textarea>
                    <input type="hidden" name="boardNo" value="${board.no}">
                    <input type="hidden" name="writer" value="nina">
                    <button class="btn btn-secondary" type="button" id="registerBtn">등록</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/js/bootstrap.min.js"></script>
<script>
    const registerForm = document.querySelector("#registerForm");
    const registerBtn = document.querySelector("#registerBtn");
    const content = document.querySelector("#content");

    registerBtn.addEventListener("click", evt => {
        const formData = new FormData(registerForm)
        fetch("/comment/register", {
            method: "post",
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                const ct = document.querySelector("#commentTemplate").cloneNode(true);
                ct.querySelector("h6").textContent=data.writer;
                ct.querySelector("p").textContent=data.content;
                ct.querySelector("small").textContent=data.createDate;
                ct.classList.remove("d-none");
                document.querySelector("#commentList").appendChild(ct);
                content.value="";
            });
    })
</script>

<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3 d-none" id="commentTemplate" aria-current="true">
    <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
    <div class="d-flex gap-2 w-100 justify-content-between">
        <div>
            <h6 class="mb-0"></h6>
            <p class="mb-0 opacity-75"></p>
        </div>
        <small class="opacity-50 text-nowrap"></small>
    </div>
</a>


</body>
</html>
