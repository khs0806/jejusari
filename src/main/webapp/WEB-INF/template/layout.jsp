<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	
	<!-- header -->
	<tiles:insertAttribute name="header"/>
	
	<!-- 계속 바뀌는 content -->
	<tiles:insertAttribute name="content"/> 
	
	<hr>
	<!-- footer -->
	<tiles:insertAttribute name="footer"/>
	
	
