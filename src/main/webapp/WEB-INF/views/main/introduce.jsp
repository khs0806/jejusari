<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${root}/css/main/introduce.css">
	<div id="content">
		<div class="first">
			<h2>제주살이</h2>
			<p>제주살이는 제주거주를 꿈꾸는 이들을 위한 부동산 매물 정보 제공 사이트입니다.</p>
			<p>제주도 주택의 매매 및 전월세 정보뿐만 아니라,</p>
			<p>바다, 감귤, 대중교통, 마트와 같은 항목을 점수를 산정해 지수로 제공합니다.</p>
			<p>제주살이를 통해서 당신만의 특별한 제주살이를 실현하세요!</p>
		</div>

		<div class="second">
			<h2>지수 선정 방식</h2>
			<p>감귤 지수</p>
			<p>모든 지수의 총 합을 10점 만점으로 하여 산정합니다.</p>
			<p>해안가 지수</p>
			<p>매물 주택에서 가장 가까운 해안가와의 거리를 계산하여 점수를 산정합니다.</p>
			<p>대중교통 지수</p>
			<p>매물 주택에서 이용할 수 있는 버스 정류장과의 거리를 수집하여, 점수를 산정합니다.</p>
			<p>마트 지수</p>
			<p>매물 주택 주위에 있는 마트에 대한 정보를 수집하여, 정보를 산정합니다.</p>
		</div>
	</div>
