<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("게시글 삭제 완료");
			location.href="${root}/fileBoard/list.do?pageNumber=${pageNumber}";
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("게시글 삭제 실패");
			location.href="${root}/fileBoard/list.do?pageNumber=${pageNumber}";		// read.do로 하려면 해당 글을 띄워야 하는데...
		</script>
	</c:if>
</body>
</html>