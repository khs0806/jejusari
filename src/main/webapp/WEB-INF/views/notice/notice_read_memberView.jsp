<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<%-- <link type = "text/css" rel = "stylesheet" href = "${root}/css/admin/notice_read.css"/>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css"> --%>
<script>
	$(function(){
		$(".update-btn").click(function(){
			location.href='${root}/notice/update';
		});
		$(".delete-btn").click(function(){
			location.href='${root}/notice/delete';
		});
	})
</script>
	<div class = "container" id = "board">
				<div id = "box">
					<h3 class="text-secondary">[공지사항]</h3>
					<span class="badge badge-secondary">회원</span>
					<div class = "text" style = "text-align: right;">
						<!-- <input type = "button" value = "목록"/> -->
						
						<button class="btn btn-secondary" type="button" onclick = "location.href = '${root}/notice/notice_list.do'">목록</button>
					</div>
				
					<!-- <div class = "title">
						<label>제목   </label>
						제주살이 공지사항 필독
					</div> -->
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">안녕하세요</div>
					</div>
					
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">글번호</span>
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">1</div>
					  
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">조회수</span>
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">100</div>
					  
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">작성일</span>
					    <%-- <fmt:formatDate value = "${dto.작성일}" pattern = "yyyy-MM-dd HH:mm:ss"/> --%>
					    
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">2020-08-11</div>
					  
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>					    
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">관리자</div>
					</div>
					
					<%-- <c:if test = "${boardDto.fileSize != 0}">
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">첨부 파일</span>
					  </div>
					  <div class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">있으면출, 없으면 출력안함</div>
					  <a href = "${root}/notice/downLoad.do?글번호=${글번호}">${파일이름}</a>
					</div>
					</c:if> --%>

					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-default">내용</span>
					  </div>
					  <div class="form-control text-justify notice-content" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  	[제주살이 공지사항 !!필독!!]
						안녕하세요. 제주살이 관리자입니다.
						현재 코로나 19의 여파로 인하여 당분간 직거래가 불가한 점 양해 부탁드립니다.
						코로나 19의 영향이 더 커지지 않길 바라며, 그동안 더 좋은 서비스를 제공해드릴 수 있는 방법을
						모색하겠습니다. 감사합니다.
						<br>감사합니다.
						<br>감사합니다.
						<br>감사합니다.
						<br>감사합니다.
						<br>감사합니다.
						<br>감사합니다.
						<br>감사합니다.
						<br>
					  </div>
					</div>
					
					
					
					<%-- <c:if test = "${boardDto.fileSize != 0}">
					<div class = "file">
						<label>첨부파일</label>
						파일이 있으면 나오고 없으면 안나옴. 나중에 코드 추가 요망.
						<a href = "${root}/notice/downLoad.do?글번호=${글번호}">${파일이름}</a>
					</div>
					</c:if> --%>
			</div>
			
			
	</div>
