<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${ pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${root}/css/board/footer.css">
<link rel="stylesheet" href="${root}/css/board/board_main.css">
<link rel="stylesheet" href="${root}/css/member/memberJoin.css">
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<style type="text/css">
	a {color: black; text-decoration: none !important;}
</style>
<!--===============================================================================================-->
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header class="navbar navbar-expand-lg navbar-light border-bottom border-primary">
		<a class="navbar-brand" href="${root}/">제주살이</a>
		
		<div class="navbar-collapse justify-content-center" id="navbarColor01">
			<ul class="navbar-nav mx-5">
				<li class="nav-item active mx-5"><a class="nav-link" href="${root}/introduce">소개
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item mx-5"><a class="nav-link" href="${root}/sales">매물정보</a></li>
				<li class="nav-item mx-5"><a class="nav-link" href="${root}/notice">공지사항</a></li>
				<li class="nav-item mx-5"><a class="nav-link" href="${root}/news">최신뉴스</a></li>
			</ul>
		</div>
		<ul class="navbar-nav ml-md-auto">
			<%-- <li class="nav-item"><a class="nav-link" href="https://kauth.kakao.com/oauth/authorize?client_id=8c08273a21863da84621e6bb6aca71ee&redirect_uri=http://localhost:8282${root}&response_type=code">로그인</a></li> --%>
			<li class="nav-item"><a class="nav-link" href="${root}/member/login" style="font-size:15px;">로그인 · 회원가입</a></li>
		</ul>
	</header>
