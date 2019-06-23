<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

$(function () {
	fnListPage();
});

function fnListPage() {
	//var f = document.form1;
	var f = $("#form1").serialize();
	
	$.ajax({
		url : "myReservation.do",
		type: "post",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
		data : f,
		//async : false,	// 중복 count로 submit 여부를 결정하기 위한 동기 처리
		success : function(data){
			
			//TODO 페이징 처리 추가해야 함.
			$("#listBody").empty();
			
			if(data.length == 0){
				
				var emptyList = [];
				emptyList.push("<tr>");
				emptyList.push("<td colspan='5'>예약 내역이 없습니다.</td>");
				emptyList.push("</tr>");
				$("#listBody").append($(emptyList.join("")));
				
				
				
			}else{	
				
				var reservList = [];
				
				$(data).each(function(index, item){
					
					reservList.push("<tr>");
					reservList.push("<td>"+ item.reservId +"</td>");
					reservList.push("<td>"+ item.reservDateStr +"</td>");
					reservList.push("<td>"+ item.designerId +"</td>");
					reservList.push("<td>"+ item.reservLoc +"</td>");
					reservList.push("<td>"+ item.changeCount +"</td>");
					reservList.push("</tr>");
					
					$("#listBody").append($(reservList.join("")));
				});
				
			}
			
		},error : function(responseData){
			alert('처리 중 서버에서 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.');
		}
	})
};

//기간별(버튼 오늘,일주일, 한달) 구매목록을 조회하기 위한 함수
function fnSrchMylist(during){

	var ToDay = new Date();

	var y = new Date(ToDay.getFullYear(),ToDay.getMonth(),ToDay.getDate() - during);

	var srchTerm= y.getFullYear() + "/" + (y.getMonth() +1 ) + "/" + y.getDate();

	$("#srchTerm").val(srchTerm);
	
	//alert(srchTerm);
	fnListPage();
}
//특정 기간 구매목록 조회 함수
function fnSrchDuring(){
	
	//현재 일자를 구해오는 코드
	var Now = new Date();
	var curYear = Now.getFullYear();
	var curMonth = Number(Now.getMonth())+1;
	var curDate = Now.getDate();
	var curDateCompare = new Date(curYear, curMonth, curDate);
	//현재 일자를 구해오는 코드//
	
	var searchStartDate = $("#sDate").val();
	var searchStartDateArr = searchStartDate.split("-");
	
	var srchStartDateCompare = new Date(searchStartDateArr[0], searchStartDateArr[1], searchStartDateArr[2]);
	
	var srchEndDate = $("#eDate").val();
	var srchEndDateArr = srchEndDate.split("-");
	
	var srchEndDateCompare = new Date(srchEndDateArr[0], srchEndDateArr[1], srchEndDateArr[2]);
	
	if(srchStartDateCompare.getTime() > srchEndDateCompare.getTime()){
		alert("검색 시작일자를 최종일자 이전으로 해주세요.");
		$("#sDate").val("");
		$("#eDate").val("");
		return;
	}
	
	if(srchEndDateCompare.getTime() > curDateCompare.getTime()){
		alert("검색 최종일자를 오늘 이전으로 해주세요.");
		$("#sDate").val("");
		$("#eDate").val("");
		return;
	}
	
	if($("#sDate").val() == "" || $("#eDate").val() == ""){
		alert("검색 날짜를 확인하세요.");
		$("#sDate").val("");
		$("#eDate").val("");
		return;
	}
	
	var sDateArr = $("#sDate").val().split("-");
	var sDate = sDateArr[0] + "/" + sDateArr[1] + "/" + sDateArr[2];
	var eDateArr = $("#eDate").val().split("-");
	var eDate = eDateArr[0] + "/" + eDateArr[1] + "/" + eDateArr[2];
	
	$("#startDate").val(sDate);
	$("#endDate").val(eDate);
	
	/* alert(sDate);
	alert(eDate); */
	
	fnListPage();
	$("#sDate").val("");
	$("#eDate").val("");
	$("#startDate").val("");
	$("#endDate").val("");
	
}
</script>

<div class="card card-signin my-5" style="width:1000px;">
	<div class="card-body">
		<div class="container">
			<div class="row">

				<h5 class="card-title text-center">예약 내역</h5>
			
					<div id="myOrderListDiv" style="width: 80%; margin-top: 35px;">
						<br/>
						<form method="post" id="form1" name="form1">
							<input type="hidden" name="srchTerm" id="srchTerm"/>
							<input type="hidden" name="startDate" id="startDate">
							<input type="hidden" name="endDate" id="endDate">
						</form>
						<div id="searchBox" style="padding-bottom:20px;">
							<span style="margin-right: 10px;">기간별</span>
							<button type="button" onclick="fnSrchMylist(0);" class="btn btn-info">오늘</button>
							<button type="button" onclick="fnSrchMylist(7);" class="btn btn-success">일주일</button>
							<button type="button" onclick="fnSrchMylist(30);" class="btn btn-warning">한달</button>
						</div>
						<div>	
							<input type="date" id="sDate" name="sDate">
							<input type="date" id="eDate" name="eDate">
							<input type="button" value="조회" onclick="fnSrchDuring();" class="btn btn-primary" style="float: right;">
						</div>
						<br/>
						<div id="divListPage" class="form-label-group">
				
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
								<%-- <c:if test="${!empty myReservList}">
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
								</c:if> --%>
							</table>
							
						</div>
					</div>
		
				</div>
			</div>
		
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
					<form action="eventList.do" method="post" id='frmPaging'>
						<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
						<input type='hidden' name='index' id='index' value='${p.index}'>
						<input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'>
						<input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'>    
					</form>
				</div>
			</div>
		</div>
	</div>
</div>