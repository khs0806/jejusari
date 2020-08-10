<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>매물 상세 페이지</title>
<!-- css -->
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/sales/sales_details.css"/>
<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eafdfb5702ba1931c394b787fa39561f"></script>
</head>
<body>
	<!-- 매물이름, 가격 -->
	<div id="title">
		<span>매물이름(주소)</span>
		<span>가격(전월세/매매)</span>
	</div>

	<!-- 신고처리(문의 문구) -->
	<div id="if_report">
		<span>신고당한 게시글입니다. 중개인 혹은 관리자에게 문의하세요.</span>
		<span>!</span>		<!-- 이미지? 그냥 해도 될 듯 -->
	</div>

	<!-- 중개인정보, 스크랩수, 신고수?, 스크랩신고버튼 -->
	<div id="info">
		<div class="borker">
			<img src="${root }/img/중개인.png" width="25px" height="25px"/>		
			<span>홍길동</span>		<!-- 중개업자 이름 -->
		</div>

		<div class="scrap_report">
			<img src="${root }/img/star.png" width="20px" height="20px"/>
			<span>14</span>		<!-- 스크랩수 -->
			<input type="button" name="scrap_btn" value="스크랩" class="btn btn-outline-warning btn-sm"/>
			<input type="button" name="report_btn" value="신고하기" class="btn btn-outline-danger btn-sm"/>
		</div>
	</div>

	<!-- 지도 -->
	<div id="map"></div>
	<script>
		var container = document.getElementById('map');
		var options = {	
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
	</script>

	<!-- 매물 상세 설명 :면적,평수,준공년월일,층수 -->
	<div id="sales_info">
		<img src="${root }/img/home4.png" width="60px" height="60px"/>
		<div>
			<div class="col1">
				<span>면적(m²)</span>
				<span>면적</span>
			</div>
			<div class="col2" style="margin-bottom:5px;">
				<span>평형</span>
				<span>평형-면적으로 계산</span>
			</div>
			<div class="col1">
				<span>준공년월일</span>
				<span>준공년월일</span>
			</div>
			<div class="col2">
				<span>층수</span>
				<span>층수</span>			
			</div>
		</div>
	</div>


	<!-- 매물요약 -->
	<div id="sales_sum">
		<div>매물요약</div>
		<div class="all_opt">		<!-- 있으면 그 자리에 아이콘 나오기 -->
			<div class="opt">
				<ul>
					<li><img src="${root }/img/room.png" width="60px" height="60px"/></li>
					<li>풀옵션</li>
				</ul>
			</div>
			<div class="opt">
				<ul>
					<li><img src="${root }/img/parking.png" width="60px" height="60px"/></li>
					<li>주차장</li>
				</ul>
			</div>
			<div class="opt">
				<ul>
					<li><img src="${root }/img/camera.png" width="60px" height="60px"/></li>
					<li>CCTV</li>
				</ul>
			</div>
			<div class="opt">
				<ul>
					<li><img src="${root }/img/elevator.png" width="60px" height="60px"/></li>
					<li>엘리베이터</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 지수정보 -->
	<div id="sales_index">
		<div>지수 정보</div>
		<div class="all_index">
			<div class="index">
				<ul>
					<li><img src="${root }/img/station.png" width="80px" height="80px"/></li>
					<li>버스(교통) 지수</li>
					<li>지수 값</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root }/img/beach.png" width="80px" height="80px"/></li>
					<li>해변 지수</li>
					<li>지수 값</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root }/img/barn.png" width="80px" height="80px"/></li>
					<li>농장(교통) 지수</li>
					<li>지수 값</li>
				</ul>
			</div>
			<div class="index_sum">
				<ul>
					<li><img src="${root }/img/fruit.png" width="80px" height="80px"/></li>
					<li>총 귤 지수</li>
					<li>지수 값</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 매물 소개-중개인 작성 내용 -->
	<div id="sales_content">
		<textarea rows="20" cols="97" readOnly="readOnly">매물 내용</textarea>
	</div>

	<!-- 매물 이미지 -->
	<div id="sales_img">
		<div class="img_all">
			<div class="img"><img/></div>
			<div class="img"><img/></div>
			<div class="img"><img/></div>
			<!-- 3개 이상일 경우 -->
			<div class="img_more"><img src="${root }/img/next1.png" width="30px" height="30px"/></div>	<!-- 꺽은 모양;3개 이상시 보임 -->
			<!-- <div class="img"><img/></div>	 -->	<!-- 3개이상시 클릭하면-->
		</div>
	</div>

	<!-- 중개인정보,매물더보기 -->
	<div id="member_btn">
		<input type="button" name="member_info" value="중개인 정보" class="btn btn-outline-info btn-sm"/>
		<input type="button" name="more_sales" value="매물 더보기" class="btn btn-secondary btn-sm"/>
	</div>

	<!-- 수정/신고, 삭제 -->
	<div id="plus_btn">
		<input type="button" name="sales_update" value="수정" class="btn btn-light btn-sm"/>		<!-- 혹은 신고처리 - dark-->
		<input type="button" name="sales_delete" value="삭제" class="btn btn-light btn-sm"/>
	</div>
</body>
</html> 