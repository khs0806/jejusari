<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<%-- <link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/admin/member_admin.css">
<link rel="stylesheet" href="${root}/css/admin/notice_list.css"> --%>
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript">
function memberDrop(obj){
	var drop=[];
	
	$("input[name=drop]:checked").each(function(){
		drop.push($(this).val());
	});
	
	alert(drop);
	
}
</script>
</head>
<body>
<form action="#" method="POST" onsubmit="return memberDrop(this)">
	<div class = "container" id="admin_container">
		<div id="title" class="text-secondary"><h3>&#91;회원관리&#93;</h3></div>
		<span  style="margin-top:0px;" class="badge badge-secondary">관리자</span>
		
		<div class="table active">
			<div class="row border-bottom" id="table_th">
				<div class="col-md-1">&nbsp;</div>
				<div class="col-md-1"><strong>번호</strong></div>
				<div class="col-md-2"><strong>아이디</strong></div>
				<div class="col-md-3"><strong>이메일</strong></div>
				<div class="col-md-2"><strong>등급</strong></div>
				<div class="col-md-3"><strong>가입일시</strong></div>
			</div>
		<c:forEach begin="0" end="10">	
			<div class="row border-bottom" id="table_td">
				<div class="col-md-1"><input type="checkbox" value="1" name="drop"/></div>
				<div class="col-md-1">1</div>
				<div class="col-md-2"><p><strong>abc123</strong></p></div>
				<div class="col-md-3">abc123@naver.com</div>
				<div class="col-md-2">일반</div>
				<div class="col-md-3">2020-08-11</div>
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
			 
			 <!-- 관리자에게만 보이는 글쓰기 버튼 -->
			 <div class="p-2 flex-shrink-1 bd-highlight">
				 <input type="submit"  class="btn btn-secondary" value="회원탈퇴"/>
			 </div>
		</div>
		
	</div>
</form>
</body>
</html>