<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<td width="530">
					<a href="${root}/fileBoard/write.do">글쓰기</a>
				</td>
			</tr>
		</table>
	</div>
	
	<c:if test="${count==0 || boardList.size()==0}">
		<div align="center">
			게시글이 없습니다.
		</div>
	</c:if>
	
	<c:if test="${count>0}">
		<div align="center">
			<table border="1">
				<tr>
					<td align="center" width="50">번호</td>
					<td align="center" width="250">제목</td>
					<td align="center" width="70">작성자</td>
					<td align="center" width="170">작성일</td>
					<td align="center" width="50">조회수</td>
				</tr>
				
				<c:forEach var="boardDto" items="${fileBoardList}">
					<tr>
						<td align="center" width="50">${boardDto.boardNumber}</td>
						<td width="250">
							<c:if test="${boardDto.sequenceLevel>0}">	<%-- 시퀀스레벨이 0인 애들은 ROOT 글이므로 --%>
								<c:forEach begin="0" end="${boardDto.sequenceLevel}">
									&nbsp;&nbsp;
								</c:forEach>
								[답글]
							</c:if>
							<a href="${root}/fileBoard/read.do?boardNumber=${boardDto.boardNumber}&pageNumber=${currentPage}">${boardDto.subject}</a>	<!-- 목록보기 했을 때, 해당 페이지로 가야 하니까 페이지넘버는 항상 가지고 다닌다. -->
						</td>
						<td align="center" width="70">${boardDto.writer}</td>
						<td align="center" width="170">
							<fmt:formatDate value="${boardDto.writeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td align="center" width="50">${boardDto.readCount}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	
	<div align="center">
		<!-- 페이징 : 총 게시글 수 (count)를 제외하고 DB와 관련없음.
				1. 한 페이지당 게시글 수 : 10
				2. 총 페이지 수 : 10Page = 전체 레코드 수 100 / 한 페이지당 게시물 수 10
								  11Page = 전체 레코드 수 101 / 한 페이지당 게시물 수 10
				3. 페이지 번호 블럭(요청 페이지(currentPage)와 관련) : ex) 10 -> [1][2][3][4][5]...[10]
																		   if(요청페이지번호==5) -> startPage=1, endPage=10
																		   if(요청페이지번호==15) -> startPage=11, endPage=20
																	   pageBlock, currentPage로 시작번호와 끝번호 뽑아내기
																	   		- int startPage=(int) ((currentPage-1)/pageBlock)*pageBlock+1	-> int형 나누면 몫만
																	   		- int endPage=startPage+pageBlock-1
				4. boardSize, currentPage, count : ListCommand에서 페이징 처리를 위해 보낸 Data
		 -->
		 
		 <!-- 2 : 전체값에서 나머지를 제거하주는 경우이므로 식을 나눌 필요가 없음 -->
		 <fmt:parseNumber var="pageCount" value="${count / boardSize + (count%boardSize==0 ? 0:1)}" integerOnly="true"/>	<!-- 나눠서 떨어지지 않으면 1을 반환해 페이지 하나를 더 늘려준다. -->
		 
		 <!-- 3 : 식을 나눌 필요가 있음  -->
		 <c:set var="pageBlock" value="${5}"/>
		 <fmt:parseNumber var="result" value="${(currentPage - 1) / pageBlock}" integerOnly="true"/>
		 <c:set var="startPage" value="${result * pageBlock + 1}"/>
		 <c:set var="endPage" value="${startPage + pageBlock - 1}"/>
		 <%-- ${startPage}, ${endPage} <br> --%>
		 
		 <c:if test="${endPage > pageCount}">
		 	<c:set var="endPage" value="${pageCount}"/>
		 </c:if>
		 <%-- ${startPage}, ${endPage} --%>
		 
		 <c:if test="${startPage > pageBlock}">
		 	<a href="${root}/fileBoard/list.do?pageNumber=${startPage - pageBlock}">[이전]</a>	<!-- 이전이나 다음을 누르면 페이지 이동하는게 아니라 페이지 번호만 바뀌는 거니까 이렇게 처리해준다 -->
		 </c:if>
		 
		 <c:forEach var="i" begin="${startPage}" end="${endPage}">
		 	<a href="${root}/fileBoard/list.do?pageNumber=${i}">[${i}]</a>
		 </c:forEach>
		 
		 <c:if test="${endPage < pageCount}">
		 	<a href="${root}/fileBoard/list.do?pageNumber=${startPage + pageBlock}">[다음]</a>
		 </c:if>
	</div>
</body>
</html>