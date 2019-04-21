<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel='stylesheet' href='resources/stylesheets/bootstrap/bootstrap.min.css' />
<!-- custom css -->
<link rel='stylesheet' href='resources/stylesheets/bootstrap/login_boot.css' />

<script src="resources/javascripts/bootstrap/jquery-3.2.1.min.js" charset="utf-8"></script>
<script src="resources/javascripts/sha512.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	function fnFindId(){
		if( $("#userName").val() =="" ){
			alert("성명을 입력하세요.");
			return;
		}
		if( $("#txtMobile1 option:selected").val()=="" || $("#txtMobile2").val() =="" || $("#txtMobile3").val() =="" ){
			alert("휴대폰 번호를 입력하세요");
			return;
		}
		
		var txtMobile1 = $.trim($("#txtMobile1 option:selected").val());
		var txtMobile2 = $.trim($("#txtMobile2").val());
		var txtMobile3 = $.trim($("#txtMobile3").val());
		var userPhone = txtMobile1 + "-" + txtMobile2 + "-" + txtMobile3;
		 $("#userPhone").val(userPhone);
		
		var formData = $("#form1").serialize();
		
		$.ajax({
			url: "idSearchProc.do",
			type: "post",
			data: formData,
			success: function(userId){
				
				if( userId == "" || userId == null ){
					$("#idSrchResult").text(" 입력하신 정보와 일치하는 회원 정보를 찾을 수 없습니다. ");
				}else{
					$("#idSrchResult").text("회원님의 아이디 | " + userId );	
				}
				
			},error: function(result){
				alert("서버 처리 중 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.");
				console.log(result);
			}
		});
		
		
	}
	function fnFindPwd(){
		
		if( $("#userName2").val() =="" ){
			alert("성명을 입력하세요.");
			return;
		}
		if( $("#txt2Mobile1 option:selected").val()=="" || $("#txt2Mobile2").val() =="" || $("#txt2Mobile3").val() =="" ){
			alert("휴대폰 번호를 입력하세요");
			return;
		}
		alert("test");
		var txt2Mobile1 = $.trim($("#txt2Mobile1 option:selected").val());
		var txt2Mobile2 = $.trim($("#txt2Mobile2").val());
		var txt2Mobile3 = $.trim($("#txt2Mobile3").val());
		var userPhone2 = txt2Mobile1 + "-" + txt2Mobile2 + "-" + txt2Mobile3;
		 $("#userPhone2").val(userPhone2);
		
		 var formData = $("#form2").serialize();
		
		$.ajax({
			url: "pwdSearchProc.do",
			data : formData,
			type: "post",
			success: function(result){
				alert(result);
			},error: function(result){
				alert(result);
			}
		});
	}
	
	//숫자만 입력 가능하도록 하기 위한 함수
	function ageChkNumber(event,type) {
		  if(type == "numbers") {
	           if(event.keyCode < 48 || event.keyCode > 57) return false;
	           //onKeyDown일 경우 좌, 우, tab, backspace, delete키 허용 정의 필요
	       }
	} 

</script>

</head>
<body>
	<div class="container">
   		<div class="row">
			<div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">Find Your ID / PASSWORD</h5>

					<h2 class="card-title text-center">ID 찾기</h2>
					
					<form id="form1" name="form1" method="post" action="#">
						
						<div class="form-label-group">
							<input type="text" id="userName" name="userName" maxlength="10" size="22"/>
							<label for="userName">성명</label>
						</div>
						
						<div class="form-label-group">
							<select id="txtMobile1" required style="float: left; display: block; width: 21%; padding:  .75rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">
			                    <option value="010">010</option>
			                    <option value="011">011</option>
			                    <option value="016">016</option>
			                    <option value="017">017</option>
			                    <option value="019">019</option>
			                </select>				
							<span style="text-align: center">-</span>
							<input type="text" id="txtMobile2" size="4" maxlength="4" minlength="3" onkeypress="return ageChkNumber(event,'numbers');" required>
							<span style="text-align: center">-</span>
							<input type="text" id="txtMobile3" size="4" maxlength="4" minlength="3" onkeypress="return ageChkNumber(event,'numbers');" required>					
							<input type="hidden" id="userPhone" name="userPhone"/>
							<button type="button" onclick="fnFindId();" class="btn btn-primary" style="float: right;">찾기</button>
						</div>
						<span id="idSrchResult"></span>
					</form>
						
					<hr style="margin-top:60px; margin-bottom: 50px;">
					
					<h2 class="card-title text-center"> 패스워드 찾기 </h2>
					
					
					<form id="form2" name="form2" method="post" action="#">
						
						<div class="form-label-group">
							<input type="text" id="userName2" name="userName" maxlength="10" size="22"/>
							<label for="userName2">성명</label>
						</div>
						
						<div class="form-label-group">
							<input type="text" id="userId" name="userId" maxlength="30" size="22"/>
							<label for="userId">아이디</label>
						</div>
						
						<div class="form-label-group">
							<select id="txt2Mobile1" required style="float: left; display: block; width: 21%; padding:  .75rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">
			                    <option value="010">010</option>
			                    <option value="011">011</option>
			                    <option value="016">016</option>
			                    <option value="017">017</option>
			                    <option value="019">019</option>
			                </select>				
							<span style="text-align: center">-</span>
							<input type="text" id="txt2Mobile2" size="4" maxlength="4" minlength="3" onkeypress="return ageChkNumber(event,'numbers');" required>
							<span style="text-align: center">-</span>
							<input type="text" id="txt2Mobile3" size="4" maxlength="4" minlength="3" onkeypress="return ageChkNumber(event,'numbers');" required>					
							<input type="hidden" id="userPhone2" name="userPhone"/>
							<button type="button" onclick="fnFindPwd();" class="btn btn-primary" style="float: right;">찾기</button>
						</div>
					</form>
						
					<div id="pwdSrchResult"></div>
					
					
					<div class="form-label-group">
						<form action="/app/member/updateMember.do" method="post" id="pwdChangeForm">
							<input type="hidden" name="findUsrid" id="findUsrid"/>
							<input type="hidden" name="usrNo" id="usrNo"/>
							<input type="hidden" name="pwdChangePage" value="ok"/>
						</form>	
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>