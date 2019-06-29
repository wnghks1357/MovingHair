<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table border="1" id="myOrderListTb" class="table table-hover" style="text-align: center;">
	<colgroup>
		<col width="13%"/>
		<col width="25%"/>
		<col width="15%"/>
		<col width="*"/>
		<col width="13%"/>
	</colgroup>
	<thead>
		<th>예약 번호</th>
		<th>예약 날짜</th>
		<th>디자이너</th>
		<th>예약 장소</th>
		<th>변경 횟수</th>
	</thead>
	<tbody id="listBody">
	
	</tbody>
	<c:if test="${!empty myReservList}">
		<c:forEach var="r" items="${myReservList }">
			<tr>
				<td>${r.reservId }</td>
				<td>
					<fmt:formatDate value="${r.reservDate }" pattern="yyyy.MM.dd HH:mm"/>
				</td>
				<td>${r.designerId }</td>
				<td>${r.reservLoc }</td>
				<td>${r.changeCount }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty myReservList}">
		<tr>
			<td colspan="5">예약 내역이 없습니다.</td>
		</tr>
	</c:if>
</table>
							
<div class="container">
	<div class="row">
		<div class="col">
			<!-- 5. paging view -->    
			<ul class="pagination justify-content-center">
				<c:if test="${p.pageStartNum ne 1}">
					<!--맨 첫페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'>처음으로</a></li>
					<!--이전 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pagePre(${p.pageStartNum},${p.pageCnt});'>이전</a></li>
				</c:if>
		          
				<!--페이지번호 -->
				<c:forEach var='i' begin="${p.pageStartNum}" end="${p.pageLastNum}" step="1">
					<li class='page-item pageIndex${i}'><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
				</c:forEach>
		          
				<c:if test="${p.lastChk}">
					<!--다음 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>다음</a></li>
					<!--마지막 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pageLast(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>끝으로</a></li>
				</c:if>
			</ul>
						
			<form action="myReservationPage.do" method="post" id='frmPaging'>
				<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
				<input type='hidden' name='index' id='index' value='${p.index}'>
				<input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'>
				<input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'>    
			</form>
		</div>
	</div>
</div>