<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#main_page .card {height: 700px; overflow: hidden;display: flex;
            align-items: center;
            justify-content: flex-end;}
	#main_page .card img{    
		width: 100%;
	}
	#main_page .card-img-overlay{padding:15rem; text-align: center;}
</style>
 <c:set var="root" value="${pageContext.request.contextPath }"/>
 
 <script>
 	$(function(){
 		if (${msg ne null}){
 			alert('${msg}');
 		}
 	});
 </script>
 
 <div id="main_page">
	 <div class="card bg-dark text-white">
	  <img src="${root}/img/cozy-seopji-1833560_1920.jpg" class="card-img" alt="...">
	  <div class="card-img-overlay ">
		<div class="input-group mb-3">
		  <input type="text" class="form-control" placeholder="지역명을 검색하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
		  <div class="input-group-append">
		    <button class="btn btn-warning" type="button" id="button-addon2">매물찾기</button>
		  </div>
		</div>
	    <h5 class="card-title">제 주 살 이</h5>
	    <p class="card-text">제주살이는 제주거주를 꿈꾸는 이들을 위한 부동산 매물 정보 제공 사이트입니다.</p>
	    <p class="card-text">제주살이를 통해서 당신만의 특별한 제주살이를 실현하세요!</p>
	  </div>
	
	</div>

			<!-- <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
			  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
		   </svg> -->

	<div class="container">
		<div class="main">
			<div class="row mt-5 mb-5 mx-md-n5">
				<div class="col px-md-5">
						<div class="border-bottom mr-3 p-3" id="table_th_news"><strong>공지사항</strong></div>
						
						<c:forEach begin="1" end="7" var="i" step="1">
						<a href="#">
							<div class="row table active ">
								<div class="col-md-1 pl-5">${i} </div>
								<div class="col-md-7">&#9786;공지사항</div>
								<div class="col-md-3">2020-08-10 </div>
							</div>
						</a>
						</c:forEach>
				</div>
				<div class="col px-md-5">
						<div class="border-bottom mr-3 p-3" id="table_th_news"><strong>최신뉴스</strong></div>
					<c:forEach begin="1" end="7" var="i" step="1">
					<a href="#">
						<div class="row table active">
							<div class="col-md-1 pl-5">${i} </div>
							<div class="col-md-7">&#9786;최신뉴스</div>
							<div class="col-md-3">2020-08-10 </div>
						</div>
					</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
