<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/member/member_mypage.css">
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
</head>
<body>
	<div id="wrap">
		<div id="first">
			<p>제주살이</p>
			<p>
				<span>### &nbsp; 님</span>
				<a href="#">⚙ 회원정보 수정</a>
			</p>
		</div>
		
		<div id="second">
			<p style="">나의 스크랩</p>
			
			<div class="scrap-cards">
				<c:forEach begin="0" end="4">
					<div class="card border-warning card-sh" style="max-width: 20rem;">
						<div class="card-body">
							<img alt="test" src="https://s3.ap-northeast-2.amazonaws.com/img.kormedi.com/news/article/__icsFiles/artimage/2013/11/17/c_km601/402573_570.jpg" width="100%" height="100%">
							<input type="button" class="btn btn-warning" value="삭제">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 중개업자만 보임 -->
		<div id="third">
			<p>내가 올린 매물</p>
			
			<div class="scrap-cards">
				<c:forEach begin="0" end="4">
					<div class="card border-warning card-sh" style="max-width: 20rem;">
						<div class="card-body">
							<img alt="test" src="https://storage.googleapis.com/cr-resource/image/6a831c14cc96e33da3abd5763c97a62d/wooahanplace/1920/b312885c14aee7a7e209fb4f6d2d5551.JPG" width="100%" height="100%">
							<input type="button" class="btn btn-warning" value="삭제">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>