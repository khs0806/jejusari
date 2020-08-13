<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${memberLevel!=null}">
	
		<!-- 서블릿에서 session을 set해주는 것보다 훨씬 간편하다. -->
		<c:set var="id" value="${id}" scope="session"/>
		<c:set var="memberLevel" value="${memberLevel}" scope="session"/>
		
		<script type="text/javascript">
			alert("로그인 성공'${id}'");
			location.href="${root}/member/main.do";		// 원래는 main으로 넘어가야 하는데 안만들어줬으므로 그냥 login.do
		</script>
		
	</c:if>
	
	<c:if test="${memberLevel==null}">
		<script type="text/javascript">
			alert("로그인 실패. ID와 비밀번호를 확인하세요");
			location.href="${root}/member/login.do";		// 원래는 main으로 넘어가야 하는데 안만들어줬으므로 그냥 login.do
		</script>
	</c:if>
</body>
</html>