<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/javascripts/bootstrap/jquery-3.2.1.min.js"></script>
<link rel='stylesheet' href='resources/stylesheets/bootstrap/bootstrap.min.css' />
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
<script>

	function fnRegMyQna(){
		
		
		var data = $("#form1").serialize();
	
		$.ajax({
	    	url : "regQna.do",
	    	type:"post",
	    	data: data,
	    	success : function(data){
	    		alert("질문이 등록 되었습니다.");
	    	},
	    	error: function(data){
	    		alert("서버 처리 중 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.");
	    	},
	    	complete: function(data){
	    		console.log(data);
	    		window.close();   //자기자신창을 닫습니다.
	    	}
		});
	}
    		
</script>
</head>
<body>
	
	<div class="container">
  		<h2>1:1 QnA</h2>
  		<form id="form1">
			<div class="row">
				<div class="col-25">
					<label for="subject">디자이너에게 질문을 남겨주세요.</label>
				</div>
				<div class="col-75">
					<input type="hidden" name="designerId" value="${qnaVo.designerId }">
					<textarea id="qnaContents" name="qnaContents" style="height:200px"></textarea>
				</div>
			</div>
			<div class="row" class="text-right">
				<button class="btn btn-rounded float-right" onclick="fnRegMyQna();">등록</button>
			</div>
		</form>
	</div>
</body>
</html>