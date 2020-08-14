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
	#table_td>#textCut>a{
		text-decoration: none;
		color:black;
	}
	
	#table_td>#textCut>a:hover{
		color:#6c757d;
	}

	#table_td>#textCut{
		padding:8px;
		list-style-position:inside;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
<script type="text/javascript">

function pop(root,report_number){
	
	var url="${root}/report/detail?report_number="+report_number;
	window.open(url, "", "width=600, height=600, resizable = no, scrollbars = no" );
}


</script>
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
				<div class="col-md-1"><strong>매물번호</strong></div>
				<div class="col-md-2"><strong>신고상세</strong></div>
				<div class="col-md-2"><strong>링크</strong></div>
				<div class="col-md-2"><strong>처리여부</strong></div>
			</div>
		
		<c:forEach var="ReportDto" items="${ReportList}">	
				<div class="row border-bottom" id="table_td">
					<div class="col-md-1" id="textCut">${ReportDto.report_number}</div>
					<div class="col-md-2" id="textCut"><strong>${ReportDto.member_id}</strong></div>
					<div class="col-md-2" id="textCut"><strong>${ReportDto.report_date}</strong></div>
					<div class="col-md-1" id="textCut">${ReportDto.sales_number}</div>
					<div class="col-md-2" id="textCut"> <input type="button"  class="btn btn-secondary" value="상세보기" onclick="pop('${root}','${ReportDto.report_number}')" /></div>
					<div class="col-md-2" id="textCut"> <a href="http://localhost:8181/jeju/sales/detail?sales_number=${ReportDto.sales_number}" >페이지로 이동</a> </div>
					<div class="col-md-2" id="textCut">${ReportDto.check_complete}</div>
				</div>
		</c:forEach>
		</div>
		<div class="col-md-2" id="textCut" id="ptitle"><a href="http://localhost:8181/jeju/sales/detail?sales_number=${ReportDto.report_number}">${ReportDto.report_title}</a></div>
		<div class="col-md-2" id="textCut" id="pcontent"><a href="http://localhost:8181/jeju/sales/detail?sales_number=${ReportDto.report_number}" onclick="pop('${root}','${ReportDto.report_number}')">${ReportDto.report_content}</a></div> 
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