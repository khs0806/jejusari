<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>	<!-- 현재페이지(pageContext)로 요청한 컨텍스트패스를 가져와라 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/board/writeStyle.css">
<script type="text/javascript">
	function replyFun(root, boardNumber, groupNumber, sequenceNumber, sequenceLevel) {
		var url=root + "/fileBoard/write.do?boardNumber=" + boardNumber;
		url += "&groupNumber=" + groupNumber + "&sequenceNumber=" + sequenceNumber + "&sequenceLevel=" + sequenceLevel;
		
		// alert(url);
		location.href=url;
	}
	
	function delFun(root, boardNumber, pageNumber) {
		/* 삭제하는 방법은 두가지 */
		/* 1. 비밀번호로 삭제 */
		var url=root + "/fileBoard/delete.do?boardNumber=" + boardNumber + "&pageNumber=" + pageNumber;
		//alert(url);
		location.href=url;
		
		/* 2. 비밀번호 없이 삭제 (window.confirm 이용) : 지금 상태에서는 password가 null이기 때문에 dao에 null이 들어가 삭제되지 않는다. */
		/*
		var value=confirm("정말로 삭제하시겠습니까?");
		if(value==true) {
			var url=root + "/board/deleteOk.do?boardNumber=" + boardNumber + "&pageNumber=" + pageNumber;
			location.href=url;
		} else {
			alert("취소되었습니다.");
		}
		*/
		
	}
	
	function updateFun(root, boardNumber, pageNumber) {
		var url=root + "/fileBoard/update.do?boardNumber=" + boardNumber + "&pageNumber=" + pageNumber;
		//alert(url);
		location.href=url;
	}
</script>
</head>
<body>
	<div id="writeForm">
		<div class="row" style="border-top: solid 2px black;">	
			<div class="title">
				<label>글번호</label>
			</div>
			<div class="content">
				${boardDto.boardNumber}
			</div>
		</div>
		
		<div class="row">
			<div class="title">
				<label>조회수</label>
			</div>
			<div class="content">
				${boardDto.readCount}
			</div>
		</div>
		
		<div class="row">
			<div class="title">
				<label>작성자</label>
			</div>
			<div class="content">
				${boardDto.writer}
			</div>
		</div>
		
		<div class="row">
			<div class="title">
				<label>작성일</label>
			</div>
			<div class="content">
				<fmt:formatDate value="${boardDto.writeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</div>
		</div>
		
		<div class="row">
			<div class="title">
				<label>제목</label>
			</div>
			<div class="content">
				${boardDto.subject}
			</div>
		</div>
		
		
		<div class="row" id="contentrow">
			<div class="title">
				<label>내용</label>
			</div>
			<div class="textContent">
				${boardDto.content}
			</div>
		</div>
		
		<c:if test="${boardDto.fileSize!=0}">
			<div class="row">
				<div class="title">
					<label>파일명</label>
				</div>
				<div class="content">
					<a href="${root}/fileBoard/downLoad.do?boardNumber=${boardDto.boardNumber}">${boardDto.fileName}</a>		<!-- boardNumber를 가지고 넘어가서 -->
				</div>
			</div>
		</c:if>
		
		<div class="row" style="text-align: center;" id="button">
			<input type="button" value="글수정" onclick="updateFun('${root}','${boardDto.boardNumber}','${pageNumber}')"/>
			<input type="button" value="글삭제" onclick="delFun('${root}','${boardDto.boardNumber}','${pageNumber}')"/>
			<input type="button" value="답글" onclick="replyFun('${root}','${boardDto.boardNumber}','${boardDto.groupNumber}','${boardDto.sequenceNumber}','${boardDto.sequenceLevel}')"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/fileBoard/list.do?pageNumber=${pageNumber}'"/>
		</div>
	</div>	
</body>
</html>