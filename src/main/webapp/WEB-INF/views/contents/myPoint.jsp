<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>

$(function () {
	fnListPage();
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
function frmPaging() {
	 
    //$("#frmPaging").submit();
	fnListPage();
}
//이전 페이지 index
function pagePre(index, pageCnt) {
    if (0 < index - pageCnt) {
        index -= pageCnt;
        $("#pageStartNum").val(index);
        $("#index").val(index - 1);
        $("#pageStartNum2").val(index);
        $("#index2").val(index - 1);
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
        $("#pageStartNum2").val(index);
        $("#index2").val(index -1);
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
    $("#pageStartNum2").val(index);
    $("#index2").val(pageLastNum - 1);
    frmPaging();
}
// index 리스트 처리
function pageIndex(pageStartNum) {
    $("#index").val(pageStartNum - 1);
    $("#index2").val(pageStartNum - 1);
    frmPaging();
}
// 리스트출력개수 처리
function listCnt() {

    $("#index").val(0);
    $("#pageStartNum").val(1);
    $("#listCnt").val($("#listCount").val());
    $("#index2").val(0);
    $("#pageStartNum2").val(1);
    $("#listCnt2").val($("#listCount").val());
    frmPaging();
} 
 
function fnListPage() {
	//var f = document.form1;
	var f = $("#form1").serialize();
	
	$.ajax({
		url : "myPointListAjax.do",
		type: "get",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data : f,
		async : false,   // 중복 count로 submit 여부를 결정하기 위한 동기 처리
		success : function(data){
			
			$("#divListPage").html(data);
		      
		},error : function(responseData){
			alert('처리 중 서버에서 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.');
		}
	})
	
};

//기간별(버튼 오늘,일주일, 한달) 구매목록을 조회하기 위한 함수
function fnSrchMylist(during){
	
	//날짜 조회를 했을 떄 페이지 번호를 초기화
	$("#index").val(0);
	$("#index2").val(0);

	var ToDay = new Date();

	var y = new Date(ToDay.getFullYear(),ToDay.getMonth(),ToDay.getDate() - during);

	var srchTerm= y.getFullYear() + "/" + (y.getMonth() +1 ) + "/" + y.getDate();

	$("#srchTerm").val(srchTerm);
	
	//alert(srchTerm);
	fnListPage();
}
//특정 기간 예약목록 조회 함수
function fnSrchDuring(){
	
	$("#index").val(0);
	$("#index2").val(0);
	
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
	
	if(srchStartDateCompare.getTime() >= srchEndDateCompare.getTime()){
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

				<h5 class="card-title text-center">나의 포인트 내역</h5>
			
				<div id="myOrderListDiv" style="width: 80%; margin-top: 35px;">
					<br/>
					<form method="post" id="form1" name="form1">
						<input type="hidden" name="srchTerm" id="srchTerm"/>
						<input type="hidden" name="startDate" id="startDate">
						<input type="hidden" name="endDate" id="endDate">
						<!-- 페이징과 날짜 조회를 하기 위한 index2 , pageStartNum2, listCnt2 추가 -->
						<input type='hidden' name='index' id='index2' value='${p.index}'>
						<input type='hidden' name='pageStartNum' id='pageStartNum2' value='${p.pageStartNum}'>
						<input type='hidden' name='listCnt' id='listCnt2' value='${p.listCnt}'>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>