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
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/admin/notice_list.css">
</head>
<body>
<form action="#" method="POST" onsubmit="">
	<div id="admin_container">
		<h3 class="text-success">[공지사항]</h3>
		<span class="badge badge-success">관리자</span>
		<br/>
		<button class="btn btn-success" type="button" style = "margin-bottom: 5px;">글작성</button>
		<table>
				<tr>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
				</tr>
				
				<tr>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			    </tr>
				
				<tr class="table-success">
			      <th scope="row">Success</th>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
    			</tr>
    			
    			<tr>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			    </tr>
    			
    			<tr class="table-success">
			      <th scope="row">Success</th>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
    			</tr>
				
				<tr>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			    </tr>
				
				<tr class="table-success">
			      <th scope="row">Success</th>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
    			</tr>
    			
    			<tr>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			    </tr>
				
				<tr class="table-success">
			      <th scope="row">Success</th>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
    			</tr>
		</table>
		
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