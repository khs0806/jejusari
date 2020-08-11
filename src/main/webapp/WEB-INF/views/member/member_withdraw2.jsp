<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${root}/css/member/member_info.css">
<link rel="stylesheet" href="${root}/css/member/member_withdraw.css">
</head>
<body>
	<div id="content">
		<div class="info">
			<p>회원 정보 수정</p>
			<a href="#" id="a-first">기본 정보 수정</a>
			<a href="#" id="a-second">회원 탈퇴</a>
		</div>
		
		<div class="wrap">
			<div class="step">
				<img alt="" src="${root}/img/step2.jpg">
			</div>
			
			<div class="check">
				<p>😥 탈퇴가 완료되었습니다.</p>
				
				<div class="p-2 flex-shrink-1 bd-highlight">
					<input type="button" value="확인" class="btn btn-warning" onclick="location.href='${root}/'">
				</div>
			</div>
		</div>
	</div>
</body>
</html>