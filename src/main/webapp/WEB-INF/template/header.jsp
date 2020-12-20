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
<meta property="og:type" content="article" />
<meta property="og:url" content="http://jejusari.shop:8080/jejusari/main" />
<meta property="og:title" content="제주살이" />
<meta property="og:description" content="제주살이에 오신걸 환영합니다!" />
<meta property="og:image" content="https://www.jeju.go.kr/files/link/67e92970-f08d-4a45-a4dc-da751fd454df.png" />
<style type="text/css">
	a {color: black; text-decoration: none !important;}
	#addr_detail{display: none;}
	#main_page .table{margin-top: 0.5rem;
    margin-bottom: 0.5rem;}
    #sales_list strong{margin-top: 0.5rem;}
	#sales_list p{margin-bottom: 0.5rem;}
	#sales_list #table_td .col-md-1, #sales_list #table_td .col-md-2{    line-height: 3rem}
	.container{margin-top:100px; margin-bottom: 100px;}
	.active {
	    font-weight: 700;
	    color: black !important;
	}
</style>
<!--===============================================================================================-->
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${root }/javascript/bootstrap/bootstrap.min.js"></script>
<title>제주살이</title>
<script type="text/javascript">
	$(function(){
		$(".menu li a").click(function(){
			$(".menu li").removeClass('active');
			$(this).parent().addClass('active');
		});
	});
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="${root}/"><b>제주살이</b></a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarColor03">
	    <ul class="navbar-nav mx-auto menu">
	      <li class="nav-item mx-5 ${active eq 'introduce' ? 'active' : ''}">
	        <a class="nav-link" href="${root}/introduce">소개</a>
	      </li>
	      <li class="nav-item mx-5 ${active eq 'sales' ? 'active' : ''}">
	        <a class="nav-link" href="${root}/sales">매물정보<span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item mx-5 ${active eq 'notice' ? 'active' : ''}">
	        <a class="nav-link" href="${root}/notice">공지사항</a>
	      </li>
	      <li class="nav-item mx-5 ${active eq 'news' ? 'active' : ''}"> 
	        <a class="nav-link" href="${root}/news">최신뉴스</a>
	      </li>
	    </ul>
	    <c:if test="${member_name == null}">
			<ul class="navbar-nav my-2 my-lg-0">
				<li class="nav-item"><a class="nav-link" href="${root}/member/login" style="font-size:15px;">로그인</a></li>
			</ul>
			<ul class="navbar-nav my-2 my-lg-0">
				<li class="nav-item"><a class="nav-link" href="${root}/member/join" style="font-size:15px;">회원가입</a></li>
			</ul>
		</c:if>
		<c:if test="${member_name != null}">
			<span>${member_name} 님 환영합니다.</span>
			<ul class="navbar-nav my-2 my-lg-0">
				<%-- <li class="nav-item"><a class="nav-link" href="https://kauth.kakao.com/oauth/authorize?client_id=8c08273a21863da84621e6bb6aca71ee&redirect_uri=http://localhost:8282${root}&response_type=code">로그인</a></li> --%>
				<c:choose>
					<c:when test="${member_id ne 'admin'}">
					<li class="nav-item"><a class="nav-link" href="${root}/member/mypage" style="font-size:15px;">마이페이지</a></li>
					</c:when>
					<c:when test="${member_id eq 'admin'}">
					<li class="nav-item"><a class="nav-link" href="${root}/member/admin" style="font-size:15px;">관리자 페이지</a></li>
					</c:when>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="${root}/member/logout" style="font-size:15px;">로그아웃</a></li>
	<!-- 			<li class="nav-item"><a class="nav-link" href="https://kauth.kakao.com/oauth/logout?client_id=47d269828391ebdbbd9ef43e5d60962c&logout_redirect_uri=http://localhost:8282/jeju/member/logout" style="font-size:15px;">로그아웃</a></li> -->
			</ul>
		</c:if>
	  </div>
	</nav>