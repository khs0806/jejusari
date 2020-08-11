<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%-- <link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css"> --%>
<%-- <link rel="stylesheet" href="${root}/css/admin/notice_list_memberView.css"> --%>
<script>
	$(function(){
		$(".write-btn").click(function(){
			location.href='${root}/notice/write';
		});
	});
</script>

<style type="text/css">
	body{
      overflow-x:hidden;
   }
</style>
</head>
<body>
<form action="#" method="POST" onsubmit="">
	<div class = "container" id="admin_container">
		<h3 class="text-secondary">[공지사항]</h3>
		<span class="badge badge-secondary">회원</span>
		<br/>
		
		<div class="table active">
			<div class="row border-bottom" id="table_th">
				<div class="col-md-1"><strong>글번호</strong></div>
				<div class="col-md-8"><strong>내용</strong></div>
				<div class="col-md-1"><strong>조회수</strong></div>
				<div class="col-md-2"><strong>날짜</strong></div>
			</div>
		<c:forEach begin="0" end="10">	
			<a href="${root}/notice/detail">
			<div class="row border-bottom" id="table_td">
				<div class="col-md-1">1</div>
				<div class="col-md-8"><p><strong>공지사항입니다.</strong></p></div>
				<div class="col-md-1">100</div>
				<div class="col-md-2">2020-08-11</div>
			<!-- 	<div class="col-md-2"></div> -->
			</div>
			</a>
		</c:forEach>
		</div>
		
		<!-- 페이징 -->
		<div class="d-flex bd-highlight">
			 <div class="p-2 w-100 bd-highlight">
				<nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
				    <li class="page-item disabled">
				      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				  
				</nav>
			 </div>
			 
			 <!-- 관리자에게만 보이는 글쓰기 버튼 -->
			 <div class="p-2 flex-shrink-1 bd-highlight">
			  	<input type="button" value="글작성" class="btn btn-secondary">
			 </div>
		</div>
<!-- 		<button class="btn btn-success write-btn" type="button" style = "margin-top: 5px;">글작성</button>
 -->		
<%-- 		<!-- 페이지 번호 들어갈 자리. -->
		<div align = "center">
			<fmt:parseNumber var = "pageCount" value = "${count / boardSize + (count % boardSize == 0 ? 0 : 1)}" integerOnly = "true"/>
			<c:set var = "pageBlock" value = "${5}"/>
			
			<fmt:parseNumber var = "result" value = "${(currentPage - 1) / pageBlock}" integerOnly = "true"/>
			<c:set var = "startPage" value = "${result * pageBlock + 1}"/>
			<c:set var = "endPage" value = "${startPage + pageBlock - 1}"/>
			${startPage}, ${endPage}
			
			<c:if test = "${endPage > pageCount}">
				<c:set var = "endPage" value = "${pageCount}"/>
			</c:if>
			${startPage}, ${endPage}
			
			<c:if test = "${startPage > pageBlock}">
				<a href = "${root}/notice/notice_list.do?pageNumber=${startPage - pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
				<a href = "${root}/notice/notice_list.do?pageNumber=${i}">[${i}]</a>
			</c:forEach>
			
			<c:if test = "${endPage < pageCount}">
				<a href = "${root}/notice/notice_list.do?pageNumber=${startPage + pageBlock}">[다음]</a>
			</c:if>
		</div> --%>
	</div>
</form>
</body>
</html>