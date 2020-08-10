<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link type = "text/css" rel = "stylesheet" href = "${root}/css/admin/notice_read.css"/>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
</head>
<body>
	<div id = "board">
				<div id = "box">
					<h3 class="text-success">[공지사항]</h3>
					<span class="badge badge-success">관리자</span>
					<div class = "text" style = "text-align: right;">
						<!-- <input type = "button" value = "목록"/>
						
						<input type = "button" value = "수정"/>
						
						<input type = "button" value = "삭제"/> -->
						
						<button class="btn btn-success" type="button" onclick = "location.href = '${root}/notice/notice_list.do'">목록</button>
						<button class="btn btn-success" type="button">수정</button>
						<button class="btn btn-success" type="button">삭제</button>
					</div>
				
					<div class = "title">
						<label>제목   </label>
						제주살이 공지사항 필독
					</div>
					
					<div class = "number">
						<label>글번호 : </label>
						12345
					</div>
					
					<div class = "count">
						<label>조회수 : </label>
						12345
					</div>
					
					<div class = "date">
						<label>작성일 : </label>
						2020.01.01 12:00:00
						<%-- <fmt:formatDate value = "${dto.작성일}" pattern = "yyyy-MM-dd HH:mm:ss"/> --%>
					</div>
					
					<div class = "writer">
						<label>작성자 : </label>
						관리자
					</div>
					
					<div class = "category">
						[제주살이 공지사항 !!필독!!]
						안녕하세요. 제주살이 관리자입니다.
						현재 코로나 19의 여파로 인하여 당분간 직거래가 불가한 점 양해 부탁드립니다.
						코로나 19의 영향이 더 커지지 않길 바라며, 그동안 더 좋은 서비스를 제공해드릴 수 있는 방법을
						모색하겠습니다. 감사합니다.
					</div>
					
					
					
					<%-- <c:if test = "${boardDto.fileSize != 0}"> --%>
					<div class = "file">
						<label>첨부파일</label>
						파일이 있으면 나오고 없으면 안나옴. 나중에 코드 추가 요망.
						<%-- <a href = "${root}/notice/downLoad.do?글번호=${글번호}">${파일이름}</a> --%>
					</div>
					<%-- </c:if> --%>
			</div>
			
			
	</div>
</body>
</html>