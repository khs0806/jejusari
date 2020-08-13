<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/board/writeStyle.css">
<script type="text/javascript" src="${root}/javascript/board/write.js"></script>
<script type="text/javascript">
      function fileDel(){
         fileUpdate.fileDelete.value = 1;
         alert("삭제 되었습니다.");
         
         var header = document.getElementById("hasFile");   //제거하고자 하는 엘리먼트
         header.remove();
      }
</script>
</head>
<body>
	<div id="writeForm">
		<div style="text-align: right;">
			<a href="${root}/fileBoard/list.do">글목록</a>
		</div>
		
		<form name="fileUpdate" action="${root}/fileBoard/updateOk.do" method="post" onsubmit="return boardCheck(this)">
			
			<input type="hidden" name="boardNumber" value="${boardNumber}"/>
			<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			<input type="hidden" name="fileDelete" value="0"/>
			
			<div class="row" style="border-top: solid 2px black;">
				<div class="title">
					<label>작성자</label>
				</div>
				<div class="content">
					<input type="text" name="writer" value="${boardDto.writer}" disabled="disabled" >
				</div>
			</div>
			
			<div class="row">
				<div class="title">
					<label>제목</label>
				</div>
				<div class="content">
					<input type="text" name="subject" value="${boardDto.subject}">
					<span></span>
				</div>
			</div>
			
			<div class="row">
				<div class="title">
					<label>이메일</label>
				</div>
				<div class="content">
					<input type="text" name="email" value="${boardDto.email}">
				</div>
			</div>
			
			<div class="row" id="contentrow">
				<div class="title">
					<label>내용</label>
				</div>
				<div class="textContent">
					<textarea name="content" rows="10" cols="70">${boardDto.content}</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="title">
					<label>비밀번호</label>
				</div>
				<div class="content">
					<input type="password" name="password" value="${boardDto.password}">
				</div>
			</div>
			
			<c:if test="${boardDto.fileSize != 0}">
				<div class="row" id="hasFile">
					<div class="title">
						<label>파일</label>
					</div>
					<div class="content">
						<fmt:formatNumber var="fileSize" value="${boardDto.fileSize/1000}" pattern="###.#"/>
						<span>${boardDto.fileName}(${fileSize}kb)</span>
						<button type="button" name="idChk" onclick="fileDel()">파일삭제</button>
					</div>
				</div>
			</c:if>
			
			<div>
				<label class="six">파일수정</label>
				<input type="file" size="40" name="file" value="파일 수정">
			</div>
			
			<div class="row" style="text-align: center;" id="button">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onclick="location.href='${root}/fileBoard/list.do?pageNumber=${pageNumber}'">
			</div>
		</form>
	</div>	
</body>
</html>