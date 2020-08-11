<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!-- css -->
<link rel="stylesheet" href="${root}/css/sales_board/sales_details.css"/>
<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2992107a6cdd4a70cae5c448140c5fd1"></script>
<script type="text/javascript">
	$(document).ready(function() {    
		//스크랩 클릭시
		$("input:button[name=scrap_btn]").one("click",function(){
			alert("ok");
			$("input:button[name=scrap_btn]").css("color","#212529");
			$("input:button[name=scrap_btn]").css("background-color","#ffc107");
			$("input:button[name=scrap_btn]").css("background-color","#ffc107");
		})
		
		//신고하기 클릭시
		$("input:button[name=report_btn]").click(function(){
			var check=confirm("이 매물을 신고하시겠습니까?");
			if(check==true){
				window.open('${root}/report/write', '', 'width = 600, height = 600');
			}
		})
		
		//이미지 더 보기 클릭시
		$(".img_more").click(function(){
			//alert("ok");
			$(".imgs").show();
			$(".img_small").show();
			$(".img_more").hide();
		})
		
		//이미지 줄여보기?
		$(".img_small").click(function(){
			//alert("ok");
			$(".imgs").hide();
			$(".img_small").hide();
			$(".img_more").show();
		})
		
		//중개인 더보기 클릭시
		$("input:button[name=member_info]").click(function(){
			window.open('${root}/sales/broker', '', 'width = 300, height = 250');
		})
		
		//매물 더보기 클릭시
		$("input:button[name=more_sales]").click(function(){
			alert("ok");
		})
		
		//수정 클릭시
		$("input:button[name=sales_update]").click(function(){
			var check=confirm("매물 정보를 수정하시겠습니까?");
			if(check==true){
				alert("ok");
			}
		})
		
		//신고처리 클릭시
		$("input:button[name=report_update]").click(function(){
			var check=confirm("매물 정보를 신고처리하시겠습니까?");
			if(check==true){
				alert("ok");
			}
		})
		
		//삭제 클릭시
		$("input:button[name=sales_delete]").click(function(){
			var check=confirm("매물 정보 게시글을 삭제하시겠습니까?");
			if(check==true){
				alert("ok");
			}
		})
	});		
</script>

<div id="details">
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
			<img src="${root}/img/중개인.png" width="25px" height="25px"/>		
			<span>홍길동</span>		<!-- 중개업자 이름 -->
		</div>

		<div class="scrap_report">
			<img src="${root}/img/star.png" width="20px" height="20px"/>
			<span>14</span>		<!-- 스크랩수 -->
			<input type="button" name="scrap_btn" value="스크랩" class="btn btn-outline-warning btn-sm scrap_btn"/>
			<input type="button" name="report_btn" value="신고하기" class="btn btn-outline-danger btn-sm report_btn"/>
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
		<img src="${root }/img/heart.png" width="60px" height="60px"/>
		<div>
			<table class="row1">
				<tr>
					<td class="info_name">면적(m²)</td>
					<td>면적</td>
					<td class="info_name">평형</td>		
					<td>평형</td>		<!-- 면적으로 계산 -->
				</tr>
			</table>
			<table>
				<tr>
					<td class="info_name">중공년월일</td>
					<td>중공년월일</td>
					<td class="info_name">층수</td>
					<td>층수</td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 매물요약 -->
	<div id="sales_sum">
		<div>매물요약</div>
		<div class="all_opt">		<!-- 있으면 그 자리에 아이콘 나오기 -->
			<div class="opt">
				<ul>
					<li><img src="${root}/img/armchair.png" width="60px" height="60px"/></li>
					<li>풀옵션</li>
				</ul>
			</div>
			<div class="opt">
				<ul>
					<li><img src="${root}/img/parking.png" width="60px" height="60px"/></li>
					<li>주차장</li>
				</ul>
			</div>
			<div class="opt">
				<ul>
					<li><img src="${root}/img/camera.png" width="60px" height="60px"/></li>
					<li>CCTV</li>
				</ul>
			</div>
			<div class="opt">
				<ul>
					<li><img src="${root}/img/elevator.png" width="60px" height="60px"/></li>
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
					<li><img src="${root}/img/gas.png" width="50px" height="50px"/></li>
					<li>주유소</li>
					<li>지수 값</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root }/img/market.png" width="50px" height="50px"/></li>
					<li>대형마트</li>
					<li>지수 값</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root}/img/hall.png" width="50px" height="50px"/></li>
					<li>공공기관</li>
					<li>지수 값</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root}/img/hospital.png" width="50px" height="50px"/></li>
					<li>병원</li>
					<li>지수 값</li>
				</ul>
			</div>
			<div class="index">
				<ul>
					<li><img src="${root}/img/entertainment.png" width="50px" height="50px"/></li>
					<li>관광</li>
					<li>지수 값</li>
				</ul>
			</div>
			<div class="index_sum">
				<ul>
					<li><img src="${root}/img/fruit.png" width="80px" height="80px"/></li>
					<li>총 귤 지수</li>
					<li>지수 값</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 매물 소개-중개인 작성 내용 -->
	<div id="sales_content">
		<textarea rows="20" readOnly="readOnly">매물 내용</textarea>
	</div>

	<!-- 매물 이미지 -->
	  <!-- 매물 이미지 -->
	  <div id="sales_img">
		   <div class="img_all">
		    <%-- <c:forEach ></c:forEach>  --%> 
			    <div class="img"><img/></div>
			    <div class="img"><img/></div>
			    <div class="img"><img/></div>
			    <!-- 3개 이상일 경우 -->
			    <%-- <c:if test=""/> --%>
			    <div class="img_more"><img src="${root }/img/next1.png" width="30px" height="30px"/></div> <!-- 꺽은 모양;3개 이상시 보임 -->
			    <div class="imgs"><img/></div>  <!-- 3개이상시 클릭하면-->
			    <div class="imgs"><img/></div> 
			    <div class="imgs"><img/></div> 
		    <div class="img_small"><img src="${root }/img/next2.png" width="30px" height="30px"/></div>
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
</div>

