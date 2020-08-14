<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  -->
<script type="text/javascript" src="${root }/javascript/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!--  -->
<link rel="stylesheet" href="${root }/css/bootstrap/bootstrap.min.css">

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18514d37ace0e69349e647543ecf89f8&libraries=services"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		
		if(${salesDto.sales_category_type=='아파트'}){
			$("#APT").attr("checked",true);
		}
		if(${salesDto.sales_category_type=='원룸'}){
			$("#ONE").attr("checked",true);
		}
		if(${salesDto.sales_category_type=='투룸' }){
			$("#TWO").attr("checked",true);
		}
		if(${salesDto.sales_category_type=='쓰리룸'}){
			$("#THREE").attr("checked",true);
		}
		if(${salesDto.sales_category_type=='오피스텔'}){
			$("#OFFICE").attr("checked",true);
		}
		
		if(${salesDto.sales_full!=1}){
			$("#inlineCheckbox1").prop("checked", true);
		}
		if(${salesDto.sales_parking!=1}){
			$("#inlineCheckbox2").prop("checked", true);
		}
		if(${salesDto.sales_cctv!=1}){
			$("#inlineCheckbox3").prop("checked", true);
		}
		if(${salesDto.sales_ele!=1}){
			$("#inlineCheckbox4").prop("checked", true);
		}
	})
</script>
</head>
<body>
	<div class="container" id="sales_list">
		<h3>매물 글쓰기</h3>
		<form action="${root }/sales/updateOk" method="post">
		<div class="row align-items-center justify-content-between">
			<div class="col-md-8">
			
				<!-- 아파트/원룸투룸쓰리룸/오피스텔 라디오박스 -->
				<div class="btn-group btn-group-toggle mb-3" data-toggle="buttons">
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="아파트" id="APT">아파트
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="원룸" id="ONE">원룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="투룸" id="TWO">투룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="쓰리룸" id="THREE">쓰리룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="sales_category_type" value="오피스텔" id="OFFICE">오피스텔
					</label>
				</div>
				
				<!-- 전월세/매매 선택 셀렉트 박스 -->
				<div class="input-group mb-3 align-items-center">
					<select id="sales_category_rent" name="sales_category_rent" class="custom-select col-md-2">
						<option value="${salesDto.sales_category_rent }">${salesDto.sales_category_rent }</option>
						<option value="매매">매매</option>
						<option value="전세">전세</option>
						<option value="월세">월세</option>
					</select>
					
					
				  <input name="sales_title" type="text" class="form-control" placeholder="${salesDto.sales_title }" aria-label="제목을 입력하세요.">
				</div>
				
				<!-- 옵션 선택 태그 -->
				<div class="form-check form-check-inline">
				  <input name="sales_option" class="form-check-input" type="checkbox" id="inlineCheckbox1" value="풀옵션">
				  <label class="form-check-label" for="inlineCheckbox1">풀옵션</label>
				</div>
				<div class="form-check form-check-inline">
				  <input name="sales_option" class="form-check-input" type="checkbox" id="inlineCheckbox2" value="주차장">
				  <label class="form-check-label" for="inlineCheckbox2">주차장</label>
				</div>
				<div class="form-check form-check-inline">
				  <input name="sales_option" class="form-check-input" type="checkbox" id="inlineCheckbox3" value="CCTV">
				  <label class="form-check-label" for="inlineCheckbox3">CCTV</label>
				</div>
				<div class="form-check form-check-inline">
				  <input name="sales_option" class="form-check-input" type="checkbox" id="inlineCheckbox4" value="엘레베이터">
				  <label class="form-check-label" for="inlineCheckbox4">엘레베이터</label>
				</div>
				
				<!-- 주소찾기 검색창 -->
				<div class="input-group input-group-sm mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-sm">주소찾기</span>
				  </div>
				  <input type="text" name="sales_address" id="sample5_address" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="${salesDto.sales_address }" value="${salesDto.sales_address }">
				  <div class="input-group-append">
				    <button class="btn btn-outline-secondary" type="button" id="button-addon2" aria-describedby="inputGroup-sizing-sm" onclick="sample4_execDaumPostcode()">Button</button>
				  </div>
				</div>
				
			</div>
			
			<!-- 우측상단 3개 입력정보 -->
			<div class="col-md-3">
			<script type="text/javascript">
					$(function(){	//매매, 전세, 월세 선택에 따라 보증금, 매매가(월세) 입력란 드러나고 감춰지게
						$("select[name='sales_category_rent']").click(function(){
							//console.log($("#sales_category_rent option:selected").val());
							if($("#sales_category_rent option:selected").val()=='전세'){
								$("#sales_cost").hide();
								$("#sales_deposit").show();
							}
							if($("#sales_category_rent option:selected").val()=='월세'){
								$("#sales_cost").show();
								$("#sales_deposit").show();
							}
							if($("#sales_category_rent option:selected").val()=='매매'){
								$("#sales_cost").show();
								$("#sales_deposit").hide();
							}
						});
					});
			</script>
			<!-- 여기에 c:if써서 월세면 보증금도 추가, 전세면 보증금만 나오게, 매매는 가격만 나오게 -->
				<div class="input-group input-group-sm mb-2" id="sales_deposit">
					<div class="input-group-prepend">
				    	<span class="input-group-text">가격 (만원)</span>
					</div>
					<input name="sales_cost" type="text" class="form-control" placeholder="${salesDto.sales_deposit }" value="${salesDto.sales_deposit }"  aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group input-group-sm mb-2" id="sales_cost">
					<div class="input-group-prepend">
				    	<span class="input-group-text">가격 (만원)</span>
					</div>
					<input name="sales_cost" type="text" class="form-control" placeholder="${salesDto.sales_cost }" value="${salesDto.sales_cost }" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group input-group-sm mb-2">
					<div class="input-group-prepend">
				    	<span class="input-group-text" id="sales_area">면적(m<sup>2</sup>)</span>
					</div>
					<input name="sales_area" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="${salesDto.sales_area }" value="${salesDto.sales_area }">
				</div>
				<div class="input-group input-group-sm mb-2">
					<div class="input-group-prepend">
				    	<span class="input-group-text" id="sales_build_year">준공년도</span>
					</div>
					<input name="sales_build_year" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="${salesDto.sales_build_year }" value="${salesDto.sales_build_year }">
				</div>
				<div class="input-group input-group-sm mb-2">
					<div class="input-group-prepend">
				    	<span class="input-group-text" id="sales_floor">&nbsp;&nbsp;층&nbsp;&nbsp;수&nbsp;&nbsp;</span>
					</div>
					<input name="sales_floor" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="${salesDto.sales_floor }" value="${salesDto.sales_floor }">
				</div>
			</div>
			
		</div>

		<!-- 주소 검색시 생겨날 창 -->
		<div id="addr_result" class="row">
			<div id="addr_detail" class="col">
				<div class="input-group input-group-sm mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-sm">우 편 번 호</span>
					</div>
				  <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" readonly>
				</div>
				<div class="input-group input-group-sm mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-sm">도로명주소</span>
					</div>
				  <input name="road_address" type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" readonly>
				</div>
				<div class="input-group input-group-sm mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-sm">지 번 주 소</span>
					</div>
				  <input name="jibun_address" type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" readonly>
				</div>
				<span id="guide" style="color:#999;display:none"></span>
				<div class="input-group input-group-sm mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-sm">상 세 주 소</span>
					</div>
				  <input name="detail_address" type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소를 입력하세요">
				</div>
				<div class="input-group input-group-sm mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-sm">참 고 항 목</span>
					</div>
				  <input name="extra_address" type="text" class="form-control" id="sample4_extraAddress" placeholder="참고항목" readonly>
				</div>
				
			</div>
			<div class="col mr-3" id="map" style="width:400px;height:250px;margin-top:10px;display:none"></div>
		</div>
		<!-- 본문 -->
		<div class="form-group">
		    <label for="exampleFormControlTextarea1">내용</label>
		    <textarea name="sales_content" class="form-control" id="summernote" rows="14">${salesDto.sales_content }</textarea>
		</div>
		
		<script>
		$(document).ready(function() {
			  $('#summernote').summernote();
			});
		
			$('#summernote').summernote({
				  height: 300,				//에디터 높이
				  minHeight: null,			//최소 높이
				  maxHeight: null,			//최대 높이
				  focus: true,				//에디터 로딩 후 포커스를 맞출지
				  placeholder: '최대 2048자까지 작성할 수 있습니다.'
			
			// 이미지 첨부 부분
				  callbacks:{
					  onImageUpload : function(files){
						  uploadSummernoteImageFile(files[0], this);
					  }
				  }
			// 이미지 첨부 부분 끝
				});
				
				$('.dropdown-toggle').dropdown();
				
				$("#summernote").summernote({
				    toolbar: [
				        ['para', ['ul']]
				    ],
				    focus: true,
				    disableResize: true,
				    disableResizeEditor: true,
				    resize: false
				});
				$('.note-statusbar').hide()
			function uploadSummernoteImageFile(file, editor){
					data = new FormData();
					data.append("file", file);
					$.ajax({
						data : data,
						type : "POST",
						url : "/uploadSummernoteImageFile",
						contentType : false,
						processData : false,
						success : function(data){
							//항상 업로드된 파일의 url이 있어야한다.
							$(editor).summernote('insertImange', data.url);
						}
					});
				}
    	</script>
		
		<!-- 파일업로드 -->
		<div class="input-group mb-3">
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" id="inputGroupFile02">
		    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
		  </div>
		  <div class="input-group-append">
		    <span class="input-group-text" id="inputGroupFileAddon02">Upload</span>
		  </div>
		</div>
		
		<!-- 작성버튼 -->
		<div class="d-flex justify-content-end mb-5">
			<button type="submit" class="btn btn-warning mr-3">수정</button>
			<button type="button" name="sales_no_update" class="btn btn-light">취소</button>
		</div>
		<script type="text/javascript">
			$("input:button[name=sales_no_update]").click(function(){
				var check=confirm("매물 정보 수정을 취소하시겠습니까?");
				if(check==true){
					location.href="${root }/sales/detail?sales_number=${salesDto.sales_number }&pageNumber=${pageNumber}";
				}
			})
		</script>
		</form>
	</div>	

<script type="text/javascript" src="${root }/javascript/sales/sales_address.js"></script>
</body>
</html>