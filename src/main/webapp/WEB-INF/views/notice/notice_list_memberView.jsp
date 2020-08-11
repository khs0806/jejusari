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
<link rel="stylesheet" href="${root}/css/admin/notice_list_memberView.css">
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
	<div id="admin_container">
		<h3 class="text-warning">[공지사항]</h3>
		<span class="badge badge-warning">회원</span>
		<br/>
		
		<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
				
				<tr>
			      <td>1</td>
			      <td><a href="${root}/notice/detail">제주살이 필독</a></td>
			      <td>2020-08-11</td>
			      <td>11</td>
			    </tr>
				
				<tr class="table-warning">
			      <th scope="row">2</th>
			      <td><a href="${root}/notice/detail">안녕하세요.</a></td>
			      <td>2020-08-11</td>
			      <td>14</td>
    			</tr>
    			
	
    			<tr>
			      <td>3</td>
			      <td><a href="${root}/notice/detail">코로나관련 공지사항</a></td>
			      <td>2020-08-11</td>
			      <td>56</td>
			    </tr>
    			
    			<tr class="table-warning">
			      <th scope="row">4</th>
			      <td><a href="${root}/notice/detail">중개업자 공지사항</a></td>
			      <td>2020-08-11</td>
			      <td>75</td>
    			</tr>
				
				<tr>
			      <td>5</td>
			      <td><a href="${root}/notice/detail">회원 공지사항</a></td>
			      <td>2020-08-11</td>
			      <td>100</td>
			    </tr>
				
				<tr class="table-warning">
			      <th scope="row">6</th>
			      <td><a href="${root}/notice/detail">축! 제주살이 사이트 오픈 기념 행사</a></td>
			      <td>2020-08-11</td>
			      <td>897</td>
    			</tr>
    			
    			<tr>
			      <td>7</td>
			      <td><a href="${root}/notice/detail">제주살이 이벤트</a></td>
			      <td>2020-08-11</td>
			      <td>576</td>
			    </tr>
				
				<tr class="table-warning">
			      <th scope="row">8</th>
			      <td><a href="${root}/notice/detail">제주살이 할인행사</a></td>
			      <td>2020-08-11</td>
			      <td>475</td>
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