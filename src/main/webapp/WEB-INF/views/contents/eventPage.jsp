<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	$(function(){
		// 현재번호 active
		var index = $("#index").val();
		var pageIndex = document.querySelector('.pageIndex'+(Number(index)+1));
		pageIndex.setAttribute("class", "active");
		$("#listCount > option").each(function () {
			if ($(this).val() == $('#listCnt').val()) {
				$(this).prop("selected", true);
			}
		});
	});
	
	//Jquery
	//submit
	function frmPaging() {
	    $("#frmPaging").submit();
	}
	
	// 이전 페이지 index
	function pagePre(index, pageCnt) {
	    if (0 < index - pageCnt) {
	        index -= pageCnt;
	        $("#pageStartNum").val(index);
	        $("#index").val(index - 1);
	        frmPaging();
	    }
	}
	// 다음 페이지 index
	function pageNext(index, total, listCnt, pageCnt) {
	    var totalPageCnt = Math.ceil(total / listCnt);
	    var max = Math.ceil(totalPageCnt / pageCnt);
	    if (max * pageCnt > index + pageCnt) {
	        index += pageCnt;
	        $("#pageStartNum").val(index);
	        $("#index").val(index -1);
	        frmPaging();
	    }
	}
	// 마지막 페이지 index
	function pageLast(index, total, listCnt, pageCnt) {
	    var totalPageCnt = Math.ceil(total / listCnt);
	    var max = Math.ceil(totalPageCnt / pageCnt);
	    while (max * pageCnt > index + pageCnt) {
	        index += pageCnt;
	    }
	    var remainListCnt = total - listCnt * (index - 1);
	    var remainPageCnt = Math.floor(remainListCnt / listCnt);
	    if (remainListCnt % listCnt != 0) {
	        remainPageCnt++;
	    }
	    var pageLastNum = 0;
	    if (remainListCnt <= listCnt) {
	        pageLastNum = index;
	    } else if (remainPageCnt <= pageCnt) {
	        pageLastNum = remainPageCnt + index - 1;
	    } else {
	        pageLastNum = pageCnt + index - 1;
	    }
	    
	    $("#pageStartNum").val(index);
	    $("#index").val(pageLastNum - 1);
	    frmPaging();
	}
	// index 리스트 처리
	function pageIndex(pageStartNum) {
	    $("#index").val(pageStartNum - 1);
	    frmPaging();
	}
	// 리스트출력개수 처리
	function listCnt() {

	    $("#index").val(0);
	    $("#pageStartNum").val(1);
	    $("#listCnt").val($("#listCount").val());
	    frmPaging();
	}
	
	//디테일 팝업창 함수
	function fnDetailPopup(eventId){
		window.open('eventDetail.do?eventId=' + eventId, "_black",
				"toolbar=yes,menubar=yes,width=700,height=500").focus();
	}
</script>


<div class="eventContainer">
	<table border="1" style="margin-top: 30px;" id="eventListTb" class="table table-striped" >
		<colgroup>
			<col width="15%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th>등록 날짜</th>
				<th style="text-align: center;">이벤트</th>
				<th>종료 날짜</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty list}">
				<c:forEach var="e" items="${list }">
					<tr>
						<td>
							<fmt:formatDate value="${e.eventStartDt }" pattern="yyyy.MM.dd"/>
						</td>
						<td class="titleTd" onclick="fnDetailPopup(${e.eventId});">${e.eventTitle }</td>
						<td>
							<fmt:formatDate value="${e.eventEndDt }" pattern="yyyy.MM.dd"/>
						</td>
						<td>${e.userName }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<tr>
					<td colspan="6" style="text-align: center;">등록된 이벤트가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
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
				<form action="event.do" method="post" id='frmPaging'>
					<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
					<input type='hidden' name='index' id='index' value='${p.index}'>
					<input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'>
					<input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'>    
				</form>
			</div>
		</div>
	</div>
</div>
