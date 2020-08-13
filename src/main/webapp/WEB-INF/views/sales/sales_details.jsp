<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				window.open('${root}/report/write?sales_number=${salesDto.sales_number}&sales_title=${salesDto.sales_title}', '', 'width = 600, height = 600');
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

<div class="container" id="sales_detail">
	<!-- 매물이름, 가격 -->
	<div id="title">
		<span>${salesDto.sales_title }</span>
		<span>${salesDto.sales_category_rent }</span>
		<c:if test="${salesDto.sales_category_rent=='매매' }">
			<span>${salesDto.sales_cost }</span>
		</c:if>	
		<c:if test="${salesDto.sales_category_rent=='전세' }">
			<span>${salesDto.sales_deposit }</span>
		</c:if>	
		<c:if test="${salesDto.sales_category_rent=='월세' }">
			<span>${salesDto.sales_deposit } / ${salesDto.sales_cost }</span>
		</c:if>	
		<span>만원</span>		
		<div>${salesDto.sales_address }</div>
		
	</div>

	<!-- 신고처리(문의 문구) -->
	<div id="if_report">
		<c:if test="${salesDto.sales_check_blind>0 }">
			<span>신고당한 게시글입니다. 중개인 혹은 관리자에게 문의하세요.</span>
			<span>!</span>	
		</c:if>
	</div>
	
	<!-- 중개인정보, 스크랩수, 신고수?, 스크랩신고버튼 -->
	<div id="info">
		<div class="borker">
			<img src="${root}/img/중개인.png" width="25px" height="25px"/>		
			<span>${salesDto.member_id }</span>	<!-- 이름으로 뽑아와야함 -->
		</div>

		<div class="scrap_report">
			<img src="${root}/img/star.png" width="20px" height="20px"/>
			<span>14</span>		<!-- 스크랩수 -->
			<input type="button" name="scrap_btn" value="스크랩" class="btn btn-outline-warning btn-sm scrap_btn"/>
			<input type="button" name="report_btn" value="신고하기" class="btn btn-outline-danger btn-sm report_btn"/>
		</div>
	</div>
	
	<!-- 주소, 매물요약 -->
	<div id="map_plus_sales" class="row justify-content-between">
			<div class="col mr-3 mt-3" id="map" style="width:50%;height:250px;margin-top:10px;"></div>
			<div class="col ml-2">	
				<div class="input-group input-group  mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">구 조</span>
					</div>
				  <input type="text" class="form-control" readonly value="${salesDto.sales_category_type }">
				</div>	
				<div class="input-group input-group mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">면 적 (m²)</span>
					</div>
				  <input type="text" class="form-control" readonly value="${salesDto.sales_area } m²">
				</div>
				<div class="input-group input-group  mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">평 형</span>
					</div>
					<fmt:formatNumber var="pyung" value="${salesDto.sales_area/(3.3) }" type="number" pattern="0.0"/>
				  <input type="text" class="form-control" readonly value="${pyung} 평">
				</div>
				<div class="input-group input-group  mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">중 공 년 도</span>
					</div>
				  <input type="text" class="form-control" readonly value="${salesDto.sales_build_year} 년도">
				</div>
				<div class="input-group input-group  mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing ">층 수</span>
					</div>
				  <input type="text" class="form-control" readonly value="${salesDto.sales_floor}층 ">
				</div>
			</div>
		</div>
		<script>
			var container = document.getElementById('map');
			var options = {	
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
		
			var map = new kakao.maps.Map(container, options);
		</script>
	
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
					<li><img src="${root}/img/fruit.png" width="50px" height="50px"/></li>
					<li>총 귤 점수</li>
					<li>${salesDto.sales_factor_total}</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 매물 소개-중개인 작성 내용 -->
	<div id="form-group">
		 <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" readOnly="readOnly">${salesDto.sales_content}</textarea>
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

