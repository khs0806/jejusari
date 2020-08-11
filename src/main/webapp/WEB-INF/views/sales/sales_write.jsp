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

<!-- 공지사항 작성 툴 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- 공지사항 작성 툴 -->

<script type="text/javascript" src="${root }/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${root }/javascript/bootstrap/bootstrap.min.js"></script>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18514d37ace0e69349e647543ecf89f8&libraries=services"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

</script>
</head>
<body>
	<div class="container" id="sales_list">
		<h3>매물 글쓰기</h3>
		<form action="${root }/sales/writeOk.do">
		<div class="row align-items-center justify-content-between">
			<div class="col-md-8">
			
				<!-- 아파트/원룸투룸쓰리룸/오피스텔 라디오박스 -->
				<div class="btn-group btn-group-toggle mb-3" data-toggle="buttons">
					<label class="btn btn-outline-warning">
						<input type="radio" name="room_type" id="APT">아파트
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="room_type" id="ONE">원룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="room_type" id="TWO">투룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="room_type" id="THREE">쓰리룸
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="room_type" id="OFFICE">오피스텔
					</label>
				</div>
				<!-- 전월세/매매 선택 셀렉트 박스 -->
				<div class="input-group mb-3 align-items-center">
					<select name="rent_option" class="custom-select col-md-2">
						<option value="">옵션</option>
						<option value="sales">매매</option>
						<option value="rent_year">전세</option>
						<option value="rent_month">월세</option>
					</select>
				  <input name="title" type="text" class="form-control" placeholder="제목을 입력하세요." aria-label="제목을 입력하세요.">
				</div>
				
				<!-- 옵션 선택 태그 -->
				<div class="form-check form-check-inline">
				  <input name="option" class="form-check-input" type="checkbox" id="inlineCheckbox1" value="풀옵션">
				  <label class="form-check-label" for="inlineCheckbox1">풀옵션</label>
				</div>
				<div class="form-check form-check-inline">
				  <input name="option" class="form-check-input" type="checkbox" id="inlineCheckbox2" value="주차장">
				  <label class="form-check-label" for="inlineCheckbox2">주차장</label>
				</div>
				<div class="form-check form-check-inline">
				  <input name="option" class="form-check-input" type="checkbox" id="inlineCheckbox3" value="신축">
				  <label class="form-check-label" for="inlineCheckbox3">CCTV</label>
				</div>
				<div class="form-check form-check-inline">
				  <input name="option" class="form-check-input" type="checkbox" id="inlineCheckbox3" value="신축">
				  <label class="form-check-label" for="inlineCheckbox3">엘레베이터</label>
				</div>
				<!-- 주소찾기 검색창 -->
				<div class="input-group input-group-sm mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-sm">주소찾기</span>
				  </div>
				  <input type="text" id="sample5_address" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
				  <div class="input-group-append">
				    <button class="btn btn-outline-secondary" type="button" id="button-addon2" aria-describedby="inputGroup-sizing-sm" onclick="sample4_execDaumPostcode()">Button</button>
				  </div>
				</div>
				
			</div>
			
			<!-- 우측상단 3개 입력정보 -->
			<div class="col-md-3">
				<div class="input-group input-group-sm mb-2">
					<div class="input-group-prepend">
				    	<span class="input-group-text" id="inputGroup-sizing-sm">가격  (원)</span>
					</div>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group input-group-sm mb-2">
					<div class="input-group-prepend">
				    	<span class="input-group-text" id="inputGroup-sizing-sm">면적(m<sup>2</sup>)</span>
					</div>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group input-group-sm mb-2">
					<div class="input-group-prepend">
				    	<span class="input-group-text" id="inputGroup-sizing-sm">준공년도</span>
					</div>
					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
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
				  <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" readonly>
				</div>
				<div class="input-group input-group-sm mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-sm">지 번 주 소</span>
					</div>
				  <input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" readonly>
				</div>
				<span id="guide" style="color:#999;display:none"></span>
				<div class="input-group input-group-sm mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-sm">상 세 주 소</span>
					</div>
				  <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소를 입력하세요">
				</div>
				<div class="input-group input-group-sm mt-3">
					<div class="input-group-prepend">
					    <span class="input-group-text" id="inputGroup-sizing-sm">참 고 항 목</span>
					</div>
				  <input type="text" class="form-control" id="sample4_extraAddress" placeholder="참고항목" readonly>
				</div>
				
			</div>
			<div class="col mr-3" id="map" style="width:400px;height:250px;margin-top:10px;display:none"></div>
		</div>
		<!-- 본문 -->
		<div class="form-group">
		    <label for="exampleFormControlTextarea1">내용</label>
		    <textarea class="form-control" id="exampleFormControlTextarea1" rows="14"></textarea>
		</div>
		
		<script>
    					$('#exampleFormControlTextarea1').summernote({
    					  height: 300,
    					  minHeight: null,
    					  maxHeight: null,
    					  focus: true
    					});
    					
    					$('.dropdown-toggle').dropdown();
    					
    					$("#exampleFormControlTextarea1").summernote({
    					    toolbar: [
    					        ['para', ['ul']]
    					    ],
    					    focus: true,
    					    disableResize: true,
    					    disableResizeEditor: true,
    					    resize: false
    					});
    					$('.note-statusbar').hide()
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
			<button type="submit" class="btn btn-warning mr-3">작성</button>
			<button type="button" class="btn btn-light">취소</button>
		</div>
		</form>
	</div>	

<script type="text/javascript" src="${root }/javascript/sales/sales_address.js"></script>
</body>
</html>