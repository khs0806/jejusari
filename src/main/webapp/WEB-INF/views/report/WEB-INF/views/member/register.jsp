<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>	<!-- 현재페이지(pageContext)로 요청한 컨텍스트패스를 가져와라 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/member/registerStyle.css">
<script type="text/javascript" src="${root}/javascript/member/register.js"></script>
<script type="text/javascript" src="${root}/javascript/jquery.js"></script>
</head>
<body>
	<%-- <jsp:include page="../../../index.jsp"/> --%>	<!-- 제어권이 넘어가지 않는다. -->
	<br><br>
	
	<div id="joinForm">
		<div style="text-align: center; font-weight: bold;">
			<span>회원가입(*필수입력사항입니다.)</span>
		</div>
		
		<!-- form의 name과 function 이름이 같으면 안되는 경우가 있다(웹 브라우저의 버전에 따라 차이가 있다) -->
		<form name="createForm1" action="${root}/member/registerOk.do" method="post" onsubmit="return createForm(this)">
			<div id="row" style="border-top: solid 2px black;">
				<div class="title">
					<label>아이디</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="text" name="id">
					<input type="button" name="idCheck1" onclick="idCheck('${root}')" value="아이디중복">
					<input type="hidden" name="jimin" value="1">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>비밀번호</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="password" name="password">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>비밀번호 확인</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="password" name="passwordCheck">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>이름</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="text" name="name">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>주민번호</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="text" name="jumin1" size="10">
					<span>-</span>
					<input type="text" name="jumin2" size="10">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>이메일</label>
				</div>
				
				<div>
					<input type="text" name="email">
				</div>
			</div>
	
			<div id="row">
				<div class="title">
					<label>우편번호</label>
				</div>
				
				<div>
					<!-- 여기에서도 input의 name과 function 이름이 같아서 에러 떴었음 -->
					<input type="text" name="zipcode">
					<input type=button onclick="zipcodeReader('${root}')" value="우편번호검색">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>주소</label>
				</div>
				
				<div>
					<input type="text" name="address" size="45px">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>직업</label>
				</div>
				
				<div>
					<select name="job">
						<option>직업을 선택하세요.</option>
						<option value="100water">백수</option>
						<option value="student">학생</option>
						<option value="knight">기사</option>
						<option value="farmer">농부</option>
						<option value="mrBaek">요리사</option>
						<option value="etc">기타</option>
					</select>
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>메일수신</label>
				</div>
				
				<div>
					<input type="radio" name="mailing" value="mOk">
					<span>yes</span>
					<input type="radio" name="mailing" value="mNo">
					<span>no</span>
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>관심분야</label>
				</div>
				
				<div>
					<input type="checkbox" name="interest" value="경제">
					<span>경제</span>
					<input type="checkbox" name="interest" value="it">
					<span>IT</span>
					<input type="checkbox" name="interest" value="music">
					<span>음악</span>
					<input type="checkbox" name="interest" value="painting">
					<span>미술</span>
					<input type="hidden" name="resultInterest">
				</div>
			</div>
			
			<div id="row" style="text-align: center;">
				<input type="submit" value="가입">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>
</body>
</html>