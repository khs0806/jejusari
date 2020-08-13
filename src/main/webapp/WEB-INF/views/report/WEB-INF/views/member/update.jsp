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
</head>
<body>
	<jsp:include page="../../../index.jsp"/>	<!-- 제어권이 넘어가지 않는다. -->
	<br><br>
	
	<div id="joinForm">
		<div style="text-align: center; font-weight: bold;">
			<span>회원가입(*필수입력사항입니다.)</span>
		</div>
		
		<!-- form의 name과 function 이름이 같으면 안되는 경우가 있다(웹 브라우저의 버전에 따라 차이가 있다) -->
		<form name="createForm1" action="${root}/member/updateOk.do" method="post" onsubmit="return createForm(this)">
			<div id="row" style="border-top: solid 2px black;">
			<input type="hidden" name="num" value="${memberDto.num}">
				<div class="title">
					<label>아이디</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="text" name="id" value="${memberDto.id}" disabled="disabled">
					<!-- disabled를 써서 막으면 data가 submit 되지 않아 dto를 찍어보면 id에 null값이 들어온다.
						 1. readonly 속성을 사용하는 방법 : disabled 대신 readonly를 써도 되지만 뷰단에 통일감이 없다.
						 2. session을 사용하는 방법 : UpdateOkcommand에서 id를 받을때 request가 아닌 session으로 받는다. 
						 3. num을 사용하는 방법 : hidden 타입을 이용해 num을 받아 num을 기준으로 수정한다.-->
					
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>비밀번호</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="password" name="password" value="${memberDto.password}">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>비밀번호 확인</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="password" name="passwordCheck" value="${memberDto.password}">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>이름</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="text" name="name" value="${memberDto.name}" disabled="disabled">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>주민번호</label>
				</div>
				
				<div>
					<span>*</span>
					<input type="text" name="jumin1" size="10" value="${memberDto.jumin1}" disabled="disabled">
					<span>-</span>
					<input type="text" name="jumin2" size="10" value="${memberDto.jumin2}" disabled="disabled">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>이메일</label>
				</div>
				
				<div>
					<input type="text" name="email" value="${memberDto.email}">
				</div>
			</div>
	
			<div id="row">
				<div class="title">
					<label>우편번호</label>
				</div>
				
				<div>
					<!-- 여기에서도 input의 name과 function 이름이 같아서 에러 떴었음 -->
					<input type="text" name="zipcode" value="${memberDto.zipcode}">
					<input type=button onclick="zipcodeReader('${root}')" value="우편번호검색">
				</div>
			</div>
			
			<div id="row">
				<div class="title">
					<label>주소</label>
				</div>
				
				<div>
					<input type="text" name="address" size="45px" value="${memberDto.address}">
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
					<script type="text/javascript">
						createForm1.job.value="${memberDto.job}";
					</script>
					
					<!-- 자바스크립트로 뷰단에 데이터 찍어주는 것을 처리해주기 전에 일단 데이터를 잘 가지고 오는지부터 확인해보는 작업. 어차피 지워주면 되니까 -->
					<%-- ${memberDto.job} --%>
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
				<script type="text/javascript">
					for(var i=0; i<createForm1.mailing.length; i++) {
						if(createForm1.mailing[i].value=="${memberDto.mailing}") {
							createForm1.mailing[i].checked=true;
						}
					}
				</script>
				<%-- ${memberDto.mailing} --%>
			</div>
			
			<div id="row">
				<div class="title">
					<label>관심분야</label>
				</div>
				
				<div>
					<input type="checkbox" name="interest" value="economy">
					<span>경제</span>
					<input type="checkbox" name="interest" value="it">
					<span>IT</span>
					<input type="checkbox" name="interest" value="music">
					<span>음악</span>
					<input type="checkbox" name="interest" value="painting">
					<span>미술</span>
					<input type="hidden" name="resultInterest">
				</div>
				
				<!-- 다중for문을 돌리는 것이라 생각 -->
				<!-- forTokens로 memberDto.interest에서 하나씩 가져와 interest라는 변수에 담아 그것을 createForm1.interest.value와 비교한다 -->
				<c:forTokens var="interest" items="${memberDto.interest}" delims=",">
					<script type="text/javascript">
						for(var i=0; i<createForm1.interest.length; i++) {
							if(createForm1.interest[i].value=="${interest}") {
								createForm1.interest[i].checked=true;
							}
						}
					</script>
				</c:forTokens>
				
				<%-- ${memberDto.interest} --%>
			</div>
			
			<div id="row" style="text-align: center;">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>
</body>
</html>