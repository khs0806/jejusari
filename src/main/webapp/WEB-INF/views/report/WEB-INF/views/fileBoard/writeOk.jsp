<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>	<!-- 현재페이지(pageContext)로 요청한 컨텍스트패스를 가져와라 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("글쓰기 성공");
			location.href="${root}/fileBoard/list.do";
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("글쓰기 실패");
			location.href="${root}/fileBoard/write.do";
		</script>
	</c:if>
</body>
</html>