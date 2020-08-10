<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시물 삭제</title>
</head>
<body>

	<div align = "center" style = "margin-top: 100px;">
		<form method = "post" action = "${root}/notice/notice_deleteOk.do">
			<input type = "hidden" value = "${boardNumber}" name = "boardNumber"/>
			<input type = "hidden" value = "${pageNumber}" name = "pageNumber"/>
			
			<div>[관리자 페이지]게시물을 삭제합니다. 삭제하시려면 비밀번호를 입력해주세요.</div>
			<div>
				<input type = "password" name = "password"/>
			</div>
			<br/><br/>
			<div>
				<input type = "submit" value = "글삭제"/>
				<input type = "button" value = "목록보기" onclick = "location.href = ${root}/fileBoard/list.do?pageNumber=${pageNumber}"/>
			</div>
		</form>
	</div>
</body>
</html>