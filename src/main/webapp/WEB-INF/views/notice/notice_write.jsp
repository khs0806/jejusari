<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link type = "text/css" rel = "stylesheet" href = "${root}/css/admin/notice_write.css"/>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
</head>
<body>
	<div id = "board">
		<h3 class="text-success">[공지사항 작성]</h3>
		<span class="badge badge-success">관리자</span>
		<form action="${root}/notice/notice_writeOk.do" method = "post" onsubmit = "return noticeCheck(this)" enctype = "multipart/form-data">
			<%-- <input type = "hidden" name = "noticeNumber" value = "${noticeNumber}"/>
			<input type = "hidden" name = "sequenceNumber" value = "${sequenceNumber}"/> --%>
				<div id = "box">
					<div class = "writer">
						<label>작성자</label>
						<input type = "text" value = "관리자">
					</div>
					
					<div class = "title">
						<label>제목</label>
						<input type = "text" name = "subject">
					</div>
					
<!-- 					파일 업로드
					<div class = "file">
						<label>첨부파일</label>
						<input type = "file" size = "40" name = "file">
					</div> -->
					
					<div class="file">
				      <label for="exampleInputFile">첨부파일</label>
				      <input class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" type="file">
				      <small class="form-text text-muted" id="fileHelp">첨부파일을 선택해주세요.</small>
    				</div>
					
					<!-- <div class = "category">
						<textarea rows="13" cols="93" name = "content"></textarea>
					</div> -->
					
					<div class="category">
				      <textarea class="form-control" id="exampleTextarea" rows="3">공지사항입니당. 내용을 써주세요!!!!</textarea>
    				</div>
					
					
					<div class = "text" style = "text-align: right;">
						<button class="btn btn-success" type="button" onclick = "location.href = '${root}/notice/notice_list.do'">목록</button>
						<button class="btn btn-success" type="reset">취소</button>
						<button class="btn btn-success" type="submit">작성</button>
						<%-- <input type = "button" value = "목록" onclick = "location.href = '${root}/notice/notice_list.do'"/> --%>
						<!-- <input type = "reset" value = "취소"> -->
						<!-- <input type = "submit" value = "작성"> -->

					</div>
			</div>
		</form>
	</div>
</body>
</html>