<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/admin/report_admin.css">
<meta charset="UTF-8">
<title>신고관리</title>
<style type="text/css">

</style>
</head>
<body>
	<div class="container">
		<div id="title" class="text-secondary"><h3>&#91;신고관리&#93;</h3></div>
		<span  style="margin-top:0px;"class="badge badge-secondary">관리자</span>
		<div class="table active">
			<div class="row border-bottom" id="table_th">

				<div class="col-md-1"><strong>신고번호</strong></div>
				<div class="col-md-2"><strong>작성자</strong></div>
				<div class="col-md-2"><strong>날짜</strong></div>
				<div class="col-md-2"><strong>매물번호</strong></div>
				<div class="col-md-2"><strong>제목</strong></div>
				<div class="col-md-2"><strong>내용</strong></div>
				<div class="col-md-1"><strong>처리여부</strong></div>
			</div>
		<c:forEach begin="0" end="10">	
			<div class="row border-bottom" id="table_td">
				<div class="col-md-1">1</div>
				<div class="col-md-2"><strong>abc123</strong></div>
				<div class="col-md-2"><strong>2020-08-11</strong></div>
				<div class="col-md-2">1</div>
				<div class="col-md-2">프리미엄 럭셔리 인테리어 최고급 샷시</div>
				<div class="col-md-2">논현신동아파밀리에..</div>
				<div class="col-md-1">미처리</div>
			</div>
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
		</div>
	</div>
</body>
</html>