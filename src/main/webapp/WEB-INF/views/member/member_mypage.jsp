<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/member/member_mypage.css">
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
<script type="text/javascript" src="${root}/javascript/xhr/xhr.js"></script>
<script type="text/javascript" src="${root}/javascript/member/member_mypage.js"></script>
<script type="text/javascript">
	$(function() {
		// 중개업자만 매물 등록 섹션 보이기
		if(${member_type == "BR"}){
 			$("#sales_cards").show();
        } else {
        	$("#sales_cards").hide();
        }
		
		$("input:button[name=delBtn]").one("click", function(){
			var check=confirm("정말 삭제하시겠습니까?");
			
			var id=$("#id").val();
			var password=$("#password").val();
			var sendData="id=" + id + "&password=" + password; 
			
			if(check) {
				$.ajax {
					url: "${root}/sales/scrap?sales_number=${salesDto.sales_number}",
					type: "post",
					success: function(){
						
					}
				}
			}
		});
	});
</script>
</head>
<body>
	<div id="wrap">
		<div id="first">
			<p>제주살이</p>
			<p>
				<span>${user} &nbsp; 님</span>
				<a href="${root}/member/update">⚙ 회원정보 수정</a>
			</p>
		</div>
		
		<div id="second">
			<p style="">나의 스크랩</p>
			
			<div class="scrap-cards">
				<c:forEach items="${scrapImgList}" var="scrap">
					<div class="card border-warning card-sh" style="max-width: 20rem;">
						<div class="card-body">
							<img alt="test" src="${root}${scrap}" width="100%" height="100%">
							<input name="delBtn" type="button" class="btn btn-warning" value="삭제">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 중개업자만 보임 -->
		<div id="sales_cards">
			<div id="third">
				<p>내가 올린 매물</p>
				
				<div class="scrap-cards">
					<c:forEach items="${salesImgList}" var="sales">
						<div class="card border-warning card-sh" style="max-width: 20rem;">
							<div class="card-body">
								<img alt="test" src="${root}${sales}" width="100%" height="100%">
								<input name="delBtn" type="button" class="btn btn-warning" value="삭제">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>