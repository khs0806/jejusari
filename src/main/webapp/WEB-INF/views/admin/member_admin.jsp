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
<form action="#" method="POST" onsubmit="return memberDrop(this)">
	<div id="admin_container">
		<div id="title" class="text-success"><h3>&#91;회원관리&#93;</h3></div>
		<span  style="margin-top:0px;" class="badge badge-success">관리자</span>
		<table>
	
				<tr>
					<th>&nbsp;</th>
					<th>번호</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>등급</th>
					<th>가입일시</th>
				</tr>
				<tr>
					<td><input type="checkbox" value="1" name="drop"/></td>
					<td>1</td>
					<td>abc123</td>
					<td>abc123@naver.com</td>
					<td>일반</td>
					<td>2020-08-11</td>
				</tr>
				<tr class="table-success">
					<td><input type="checkbox" value="2" name="drop"/></td>
					<td>2</td>
					<td>abc123</td>
					<td>abc123@naver.com</td>
					<td>일반</td>
					<td>2020-08-11</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="3" name="drop"/></td>
					<td>3</td>
					<td>abc123</td>
					<td>abc123@naver.com</td>
					<td>일반</td>
					<td>2020-08-11</td>
				</tr>
				<tr class="table-success">
					<td><input type="checkbox" value="4" name="drop"/></td>
					<td>4</td>
					<td>abc123</td>
					<td>abc123@naver.com</td>
					<td>일반</td>
					<td>2020-08-11</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="5" name="drop"/></td>
					<td>5</td>
					<td>abc123</td>
					<td>abc123@naver.com</td>
					<td>일반</td>
					<td>2020-08-11</td>
				</tr>
		</table>
		<input type="submit"  class="btn btn-success" value="회원탈퇴"/>
	</div>
</form>
</body>
</html>