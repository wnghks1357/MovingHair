<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>
	
	<div class="container">
  		<h2>예약 정보</h2>
  		<div class="row">
    		<div class="col-25">
      			<label for="reservId">예약자 ID</label>
   			</div>
			<div class="col-75">
				<input type="text" id="reservId" readonly="readonly" value="${reservVo.userId }">
			</div>
		</div>
		<div class="row">
    		<div class="col-25">
      			<label for="reservName">예약자 성명</label>
   			</div>
			<div class="col-75">
				<input type="text" id="reservName" readonly="readonly" value="${reservVo.userName }">
			</div>
		</div>
		<div class="row">
    		<div class="col-25">
      			<label for="reservDate">예약 날짜</label>
   			</div>
			<div class="col-75">
				<input type="text" id="reservDate" readonly="readonly" value="${reservVo.reservDateStr }">
			</div>
		</div>
		<div class="row">
    		<div class="col-25">
      			<label for="reservTime">예약 시간</label>
   			</div>
			<div class="col-75">
				<input type="text" id="reservTime" readonly="readonly" value="${reservVo.reservTime }">
			</div>
		</div>
 
		<div class="row">
			<div class="col-25">
				<label for="subject">기타 요청 사항</label>
			</div>
			<div class="col-75">
				<textarea id="subject" name="subject" style="height:200px">${reservVo.reservMsg }</textarea>
			</div>
		</div>
  	  
</div>
</body>
</html>