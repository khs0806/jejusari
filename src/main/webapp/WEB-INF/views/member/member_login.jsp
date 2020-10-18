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
		$("button[name=signup]").click(function(){
			location.href="${root}/member/join";
		})
	})
</script>
<div class="container">
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">로그인 후 이용하실 수 있습니다.</h5>
					<form class="form-signin" action="${root}/member/login" method="post">
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
						type="submit" name="signup">
						회원가입
					</button>
					<div class="foot">
						<div>카카오톡으로 시작하기</div>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=47d269828391ebdbbd9ef43e5d60962c&redirect_uri=http://localhost:8080/jejusari/member/kakaologin&response_type=code"> <img alt="페이스북로그인"
							src="${root}/img/kakao_login_small.png">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
