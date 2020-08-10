<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/admin/member_admin.css">
<link rel="stylesheet" href="${root}/css/admin/notice_list.css">
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
<form action="#" method="POST" onsubmit="">
	<div id="admin_container">
		<div id="title" class="text-success"><h3>&#91;회원관리&#93;</h3></div>
		<span  style="margin-top:0px;" class="badge badge-success">관리자</span>
		<table>
	
				<tr>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>6</th>
				</tr>
				<tr>
					<td><input type="checkbox" value="" name=""/></td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
				</tr>
				<tr class="table-success">
					<td><input type="checkbox" value="" name=""/></td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="" name=""/></td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
				</tr>
				<tr class="table-success">
					<td><input type="checkbox" value="" name=""/></td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="" name=""/></td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
					<td>dd</td>
				</tr>
		</table>
		<input type="submit"  class="btn btn-success" value="회원탈퇴"/>
	</div>
</form>
</body>
</html>