<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${root}/css/member/member_signup.css">
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${root}/javascript/member/member_signup.js"></script>
</head>
<body>
	<form id="plus_info" onsubmit="return validate(this)" action="${root}/member/tempjoin" method="post">
		<div class="tit">회원가입</div>
		
		<div class="nickname">
			<div class="label">아이디</div>
			<input type="text" name="member_id" class="col-sm-4 h-25 form-control" maxlength="15" 
				placeholder="6~20자 사이의 대소문자와 숫자만"/>
			<button class="btn btn-outline-warning btn-sm" type="button" id="idCheck" style="margin-top:2px;">중복 확인</button>
		</div>
		
		<div class="nickname">
			<div class="label">비밀번호</div>
			<input type="password" name="member_pwd" class="col-sm-4 h-25 form-control" maxlength="15" 
				placeholder="8~12자,영문자/숫자/특수문자 포함"/>
		</div>
		<div class="nickname">
			<div class="label">비밀번호 확인</div>
			<input type="password" name="member_pwd_chk" class="col-sm-4 h-25 form-control"/>
		</div>
		<div class="nickname">
			<div class="label">이름</div>
			<input type="text" name="member_name" class="col-sm-4 h-25 form-control" maxlength="15"/>
		</div>
		<div class="nickname">
			<div class="label">생년월일</div>
			<input type="text" name="member_birthday" class="col-sm-4 h-25 form-control" maxlength="15" 
				placeholder="YYYYMMDD ex) 19910806"/>
		</div>
			
		<div class="email">
			<div class="label">이메일</div>
			<input type="text" name="member_email" class="col-sm-5 h-25 form-control" autocomplete="off"
			placeholder="ex) abcd12@naver.com"/>
		</div>
		
		<div class="member_level">
			<div class="label">가입 유형</div>
			<input type="radio" name="member_level" value="GE" id = "member_level"/>
			<span>일반회원</span>		
			<input type="radio" name="member_level" value="BR" id = "member_level"/>
			<span>중개업자</span>
			<input type="radio" name="member_level" value="admin" id = "member_level"/>
			<span>관리자</span>
		</div>
		
		<div id="if_broker" style="display:none;">
			<div class="msg">국가공간정보포털의 부동산중개업 정보에 등록된<br/>대표 공인중개사만 회원가입이 가능합니다.</div>
			<div class="phone_num">
				<div class="label2">대표공인중개사<br/>휴대폰 번호</div>
				<select class="col-sm-2 h-25 custom-select" name="num1">
					<option selected>010</option>
					<option value="1">011</option>
					<option value="2">016</option>
				</select>
				<div style="color:black;">-</div>
				<input type="text" class="col-sm-2 h-25 form-control" name="num2">
				<div style="color:black;">-</div>
				<input type="text" class="col-sm-2 h-25 form-control" name="num3">
			</div>	
		</div>
		
		<div class="last_btn">
			<input type="submit" value="완료" class="btn btn-warning btn-sm" />
			<input type="reset" value="취소" class="btn btn-light btn-sm"/>
		</div>
	</form>
	
	
	
</body>
</html>