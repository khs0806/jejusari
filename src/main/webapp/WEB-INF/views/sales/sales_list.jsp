<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root }/css/bootstrap/bootstrap.min.css">
<style type="text/css">
	a {color: black; text-decoration: none !important;}
</style>
</head>
<body>
	<div class="container" id="sales_list">
		<h3>매물게시판</h3>
			<div class="btn-group" role="group" aria-label="room_type">
			  <button type="button" class="btn btn-warning">아파트</button>
			  <button type="button" class="btn btn-secondary">원룸</button>
			  <button type="button" class="btn btn-secondary">투룸</button>
			  <button type="button" class="btn btn-secondary">쓰리룸</button>
			  <button type="button" class="btn btn-secondary">오피스텔</button>
			</div>
		<form>
			<br>
			<input type="hidden" value="위에 li값 가져오기" name="sales_type">
			<!-- <input type="text" placeholder="지역명을 입력하세요.">
			<input type="submit" value="검색" class="btn btn-warning"> -->

			<div class="input-group mb-3">
				<select class="custom-select col-md-1">
					<option value="">옵션</option>
					<option value="sales">매매</option>
					<option value="rent_year">전세</option>
					<option value="rent_month">월세</option>
				</select>
			  <input type="text" class="form-control col-md-4" placeholder="지역명을 입력하세요." aria-label="지역명을 입력하세요." aria-describedby="button-addon2">
			  <div class="input-group-append">
			    <button class="btn btn-outline-warning" type="submit" id="button-addon2"><strong>검색</strong></button>
			  </div>
			</div>
			
			<input type="range"> <label>가격</label>
			<input type="range"> <label>면적</label>
			<br>
			
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="풀옵션">
			  <label class="form-check-label" for="inlineCheckbox1">풀옵션</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="주차장">
			  <label class="form-check-label" for="inlineCheckbox2">주차장</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="신축">
			  <label class="form-check-label" for="inlineCheckbox3">CCTV</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="신축">
			  <label class="form-check-label" for="inlineCheckbox3">엘레베이터</label>
			</div>
			
		</form>
		<nav aria-label="정렬">
		  <div class="pagination justify-content-end">
		    <select>
			<option value="">정렬	</option>
			<option value="">가격내림차순</option>
			<option value="">가격오름차순</option>
			<option value="">지수오름순</option>
			<option value="">지수내림순</option>
		</select>
		  </div>
		</nav>
		<div class="table active">
			<div class="row border-bottom" id="table_th">
				<div class="col-md-8"><strong>제목</strong></div>
				<div class="col-md-1"><strong>구분</strong></div>
				<div class="col-md-2"><strong>면적</strong></div>
				<div class="col-md-1"><strong>가격</strong></div>
			</div>
		<c:forEach begin="0" end="10">	
			<a href="#">
			<div class="row border-bottom" id="table_td">
				<div class="col-md-8"><strong>프리미엄 럭셔리 인테리어 최고급 샷시</strong><p>논현신동아파밀리에 105동</p></div>
				<div class="col-md-1">아파트</div>
				<div class="col-md-2">52/35m^2중층/13층</div>
				<div class="col-md-1">전세5억<span>월세</span></div>
			<!-- 	<div class="col-md-2"></div> -->
			</div>
			</a>
		</c:forEach>
		</div>
		<div class="d-flex bd-highlight">
			 <div class="p-2 w-100 bd-highlight">
				<nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
				    <li class="page-item disabled">
				      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				  
				</nav>
			 </div>
			 <!-- 매매업자에게만 보이는 글쓰기 버튼 -->
			 <div class="p-2 flex-shrink-1 bd-highlight">
			  	<input type="button" value="매물올리기" class="btn btn-warning">
			 </div>
		</div>
		
		
		<br>
		<br>
	</div>
</body>
</html>