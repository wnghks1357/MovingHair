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
		alert(" 준비 중 ");
	}
	function fnFindPwd(){
		alert(" 준비 중 ");
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
							<input type="text" id="userName" name="userName" maxlength="8" size="22"/>
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
					
					<h2 class="card-title text-center"> 패스워드 찾기</h2>
					
					
					<form id="form2" name="form2" method="post" action="#">
						
						<div class="form-label-group">
							<input type="text" id="userName2" name="userName" maxlength="8" size="22"/>
							<label for="userName2">성명</label>
						</div>
						
						<div class="form-label-group">
							<input type="text" id="userId" name="userId" maxlength="15" size="22"/>
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