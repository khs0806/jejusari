<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${root}/css/member/member_login.css">
<script>
	$(function(){
		if (${msg ne null} && ${msg eq 'failure'}){
			alert("아이디 또는 비밀번호를 다시 확인해주세요.");
		}
	})
</script>
<div class="login">
	<div class="logo">
		<div>제주살이</div>
		<div>간편하게 로그인 하고</div>
		<div>다양한 서비스를 이용하세요.</div>
	</div>
	<div class="kakao">
		<!-- 카카오로 로그인 링크 ----------------------------------------------------------------->
		<a
			href="https://kauth.kakao.com/oauth/authorize?client_id=47d269828391ebdbbd9ef43e5d60962c&redirect_uri=http://localhost:8080/jejusari/test/join&response_type=code">
			<!-----------------------------> <%-- <a href="${root}/member/signup"> --%>
			<img alt="카카오톡로그인" src="${root}/img/kakao_login_medium_wide.png">
		</a>
	</div>
	<div class="foot">
		<div>다른 방법으로 시작하기</div>
		<a href=""> <img alt="페이스북로그인"
			src="//s.zigbang.com/zigbang-account/prod/_next/static/btn_content_login_fb_36x36-df6b07d3564954ead2a9ed323aa2b8ca.png">
		</a> <a href=""> <img alt="구글로그인"
			src="//s.zigbang.com/zigbang-account/prod/_next/static/btn_content_login_google_36x36-cd1a611ed48bc787e3acc89a8e876800.png">
		</a> <a href=""> <img alt="이메일로그인"
			src="//s.zigbang.com/zigbang-account/prod/_next/static/btn_content_login_email_36x36-e87aa45322ef0190edc5473519396308.png">
		</a>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">로그인 후 이용하실 수 있습니다.</h5>
					<form class="form-signin" action="${root}/member/templogin" method="post">
						<div class="form-label-group">
							<input type="text" id="inputEmail" class="form-control"
								name="member_id" placeholder="id" required autofocus> <label
								for="inputEmail">아이디</label>
						</div>
						<div class="form-label-group">
							<input type="password" id="inputPassword" class="form-control"
								name="member_pwd" placeholder="pwd" required> <label
								for="inputPassword">비밀번호</label>
						</div>
						<button class="btn btn-lg btn-warning btn-block text-uppercase"
							type="submit">로그인</button>
					</form>
					<p class="desc">
						<span>제주살이 회원이 아니시라면?</span>
					</p>
					<button class="btn btn-lg btn-google btn-block text-uppercase"
						type="submit">
						회원가입
					</button>
					<div class="foot">
						<div>카카오톡으로 시작하기</div>
						<a href=""> <img alt="페이스북로그인"
							src="${root}/img/kakao_login_small.png">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
