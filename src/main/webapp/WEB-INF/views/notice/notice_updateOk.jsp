<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 완료</title>
</head>
<body>
	<c:set var = "root" value = "${pageContext.request.contextPath}"/>
	<c:if test = "${check > 0}">
		<script type="text/javascript">
			alert("[관리자 페이지]게시글이 수정 되었습니다.");
			location.href = "${root}/notice/notice_list.do";
		</script>
	</c:if>
	
	<c:if test = "${check == 0}">
		<script type="text/javascript">
			alert("[관리자 페이지]게시글이 수정 되지 않았습니다.");
			location.href = "${root}/notice/notice_update.do";
		</script>
	</c:if>
</body>
</html>