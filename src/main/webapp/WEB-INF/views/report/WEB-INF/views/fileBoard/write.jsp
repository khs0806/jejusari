<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>	<!-- 현재페이지(pageContext)로 요청한 컨텍스트패스를 가져와라 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/board/writeStyle.css">
<script type="text/javascript" src="${root}/javascript/board/write.js"></script>
</head>
<body>
	<div id="writeForm">
		<div style="text-align: right;">
			<a href="${root}/fileBoard/list.do">글목록</a>
		</div>
		
		<!-- 보통 왔다갔다 하는 type은 text이지만, 파일업로드는 binary 형태의 데이터가 왔다갔다하므로 enctype을 바꿔주고 lib를 다운받아 추가해야한다. -->
		<form action="${root}/fileBoard/writeOk.do" method="post" onsubmit="return boardCheck(this)" enctype="multipart/form-data">
			
			<!-- 네자리 숫자 가져오는 hidden타입. submit시 WriteOkcommand로 넘어간다. -->
			<input type="hidden" name="boardNumber" value="${boardNumber}"/>
			<input type="hidden" name="groupNumber" value="${groupNumber}"/>
			<input type="hidden" name="sequenceNumber" value="${sequenceNumber}"/>
			<input type="hidden" name="sequenceLevel" value="${sequenceLevel}"/>
						
			<div class="row" style="border-top: solid 2px black;">
				<div class="title">
					<label>작성자</label>
				</div>
				<div class="content">
					<input type="text" name="writer">
				</div>
			</div>
			
			<div class="row">
				<div class="title">
					<label>제목</label>
				</div>
				<div class="content">
					<input type="text" name="subject">
				</div>
			</div>
			
			<div class="row">
				<div class="title">
					<label>이메일</label>
				</div>
				<div class="content">
					<input type="text" name="email">
				</div>
			</div>
			
			<div class="row" id="contentrow">
				<div class="title">
					<label>내용</label>
				</div>
				<div class="textContent">
					<textarea name="content" rows="10" cols="70"></textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="title">
					<label>비밀번호</label>
				</div>
				<div class="content">
					<input type="password" name="password">
				</div>
			</div>
			
			<div class="row">
				<div class="title">
					<label>파일명</label>
				</div>
				<div class="content">
					<input type="file" name="file">
				</div>
			</div>
			
			<div class="row" style="text-align: center;" id="button">
				<input type="submit" value="글쓰기">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onclick="location.href='${root}/fileBoard/list.do'">
			</div>
		</form>
	</div>	
</body>
</html>