<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="${root}/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="${root}/javascript/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/javascript/board/report_register.js"></script>
<script>


function funcCancel(){
	self.close();
}

function button_event(){

	if (confirm("정말 삭제하시겠습니까??") == true){    //확인

	    document.form.submit();

	}else{   //취소

	    return;

	}
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center" style="margin-top: 100px;">
		<form action="${root}/sales/delete" method="post" onsubmit="return createForm(this)">
			<input type="hidden" name = "sales_number" value="${sales_number}">
			
			<div>삭제하시겠습니까</div>
			<!-- <div>
				<input type="password" name="password">
			</div> -->
			<br/>
			<div>
				<button type="submit" class="btn btn-warning" onclick="button_event()">삭제</button>
				<button type="button" class="btn btn-light" onclick="funcCancel()">취소</button>
			</div>
		</form>
	</div>
</body>
</html>