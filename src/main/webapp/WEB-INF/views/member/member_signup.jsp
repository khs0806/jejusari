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
<script type="text/javascript" src="${root }/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function(){
	    $("input:radio[name=member_type]").click(function(){  	 
	        if($("input[name=member_type]:checked").val() == "broker"){
	 			$("#if_broker").show();
	        }else{
	        	$("#if_broker").hide();
	        }
	    });
	})
</script>
</head>
<body>
	<form id="plus_info" action="#" method="post">
		<div class="tit">추가 정보 입력</div>
		
		<div class="nickname">
			<div class="label">닉네임</div>
			<input type="text" name="nickname" class="col-sm-3 h-25 form-control"/>
			<button class="btn btn-outline-warning btn-sm" type="button" id="button-addon2" style="margin-top:2px;">중복 확인</button>
		</div>
		
		<div class="email">
			<div class="label">이메일</div>
			<input type="text" name="email_id" class="col-sm-3 h-25 form-control"/>
			@
			<select class="col-sm-3 h-25 custom-select" id="inputGroupSelect01">
			    <option selected>선택하세요.</option>
			    <option value="1">hanmail.net</option>
			    <option value="2">naver.com</option>
			    <option value="3">yahoo.co.kr</option>
			    <option value="4">hotmail.com</option>
			    <option value="5">paran.com</option>
			    <option value="6">nate.com</option>
			    <option value="7">google.com</option>
			    <option value="8">gmail.com</option>
			    <option value="9">empal.com</option>
			    <option value="10">korea.com</option>
			    <option value="11">freechal.com</option>
			  </select>
		</div>
		
		<div class="member_type">
			<div class="label">가입 유형</div>
			<input type="radio" name="member_type" value="general"/>
			일반회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
			<input type="radio" name="member_type" value="broker"/>
			중개업자
		</div>
		
		<div id="if_broker" style="display:none;">
			<div class="msg">국가공간정보포털의 부동산중개업 정보에 등록된<br/>대표 공인중개사만 회원가입이 가능합니다.</div>
			<div class="phone_num">
				<div class="label2">대표공인중개사<br/>휴대폰 번호</div>
				<select class="col-sm-2 h-25 custom-select">
					<option selected>010</option>
					<option value="1">011</option>
					<option value="2">016</option>
				</select>
				<div style="color:black;">-</div>
				<input type="text" class="col-sm-2 h-25 form-control">
				<div style="color:black;">-</div>
				<input type="text" class="col-sm-2 h-25 form-control">
			</div>	
		</div>
		
		<div class="last_btn">
			<input type="submit" value="완료" class="btn btn-warning btn-sm"/>
			<input type="reset" value="취소" class="btn btn-light btn-sm"/>
		</div>
	</form>
</body>
</html>