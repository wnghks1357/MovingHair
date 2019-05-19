<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="card card-signin my-5" style="width:1000px;">
	<div class="card-body">
		<div class="container">
			<div class="row">
				<h5 class="card-title text-center">예약 내역</h5>
			
				<div id="myOrderListDiv">
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
			
						<table border="1" id="myOrderListTb" class="table table-hover">
							<colgroup>
								<col width="25%"/>
								<col width="*"/>
								<col width="25%"/>
								<col width="25%"/>
							</colgroup>
							<thead>
								<th>예약 번호</th>
								<th>디자이너</th>
								<th>예약 날짜</th>
								<th>변경 횟수</th>
							</thead>
							<c:if test="${!empty list}">
								<c:forEach var="b" items="${list }">
									<tr>
										<td>${b.buyDt }</td>
										<td>${b.gdsNm }</td>
										<td>${b.buyQtt }</td>
										<td>${b.buyAmt }</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty list}">
								<tr>
									<td colspan="6">주문 내역이 없습니다.</td>
								</tr>
							</c:if>
						</table>
						
						<form method="post" id="orderConfirmForm" name="orderConfirmForm">
							<input type="hidden" id="usrNo"   name="usrNo" />
							<input type="hidden" id="gdsNo"   name="gdsNo" />
							<input type="hidden" id="buyDt"   name="buyDt" />
							<input type="hidden" id="buyTm"   name="buyTm" />
							<input type="hidden" id="buyQtt"  name="buyQtt" value="0" />
							<input type="hidden" id="buyStat" name="buyStat" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>