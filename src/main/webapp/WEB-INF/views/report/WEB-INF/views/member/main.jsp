<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../../index.jsp"></jsp:include>
	<c:if test="${memberLevel=='MA'}">
		<h3>관리자 페이지</h3>
		<a href="">회원관리...</a>		
	</c:if>
	<h3>
		${id}님 안녕하세요. 메인 페이지입니다.
	</h3>
</body>
</html>