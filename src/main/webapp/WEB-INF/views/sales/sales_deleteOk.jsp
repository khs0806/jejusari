<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("게시글 삭제 완료");
			self.close();
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("게시글 삭제 실패");
			location.href="${root}/sales/sales_delete";
		</script>
	</c:if>
</body>
</html>