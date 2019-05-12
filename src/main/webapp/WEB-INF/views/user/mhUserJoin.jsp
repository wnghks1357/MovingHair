<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>회원가입</title>
<!-- 부트스트랩 cdn-->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- 부트스트랩 local-->
<link rel='stylesheet' href='resources/stylesheets/bootstrap/bootstrap.min.css' />
<!-- custom css -->
<link rel='stylesheet' href='resources/stylesheets/bootstrap/login_boot.css' />

<script src="resources/javascripts/bootstrap/jquery-3.2.1.min.js" charset="utf-8"></script>
<script src="resources/javascripts/sha512.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>

$(function () {

	//저장 버튼클릭시 유효성 검사
	$("#newMemberJoinBtn").click(function () {
		
		if( $("#idMessageBox").text()=="" || $("#idMessageBox").text() == "중복된 ID가 존재합니다.") {
			alert("ID 중복검사를 해주세요.");
			return;
		}
		
		if( $("#userPwd").val() != $("#repeatPassword").val() ){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
    
		/* if( $("#phoneMessageBox").text() =="" || $("#phoneMessageBox").text() =="중복된 번호가 존재합니다."){
		 	alert("휴대폰번호 중복확인을 해주세요.");
		 	return;			
		} */
		
		//아아디는 입력했는데 도메인을 입력하지 않은 경우
		if( $("#emailID").val() != "" && $("#emailAddr option:selected").val() == ""){
			alert("이메일 도메인 주소를 입력해 주세요.");
			return;
		}
		
		//이메일을 입력을 생략한 경우
		if($("#emailAddr option:selected").val() == ""){
			$("#userEmail").val("");
		}
		else{
			var emailID = $("#emailID").val();
			var emailAddr =$("#emailAddr option:selected").val();
			var user_email = emailID + "@" + emailAddr;
			$("#userEmail").val(user_email);
    	}
    
    	var txtMobile1 = $.trim($("#txtMobile1 option:selected").val());
	    var txtMobile2 = $.trim($("#txtMobile2").val());
	    var txtMobile3 = $.trim($("#txtMobile3").val());
	    var userPhone = txtMobile1 + "-" + txtMobile2 + "-" + txtMobile3;
		$("#userPhone").val(userPhone);
		
		// 패스워드 hashing ( sha512.js 사용 )
		var shaPwd = hex_sha512($('#userPwd').val()).toString();
		shaPwd = shaPwd.substring(0,20);
		$("#userPwd").val(shaPwd);
		// 패스워드 hashing ( sha512.js 사용 ) //
		
		var f = document.form1;
		f.submit();
	});
	
	$("#cancelBtn").click(function () {
		history.back();
	});
});

function fnPwdCheck(){
	var usrPwd = $("#userPwd").val();
	var usrPwdCheck = $("#repeatPassword").val();
	if(usrPwd != usrPwdCheck){
		$("#pwdMsg").html("<font color='red'>패스워드가 일치하지 않습니다.<font>");
	}
	if(usrPwd == usrPwdCheck){
		$("#pwdMsg").text("");
	}
	
}

//아이디 중복 체크를 위한 함수
function fnJungbokID(){
	
	$.ajax({
		url : "idJungbokCheck.do",
		type: "post",
		data : { userId : $("#userId").val() },
		success : function(count){   	
			// 아이디 사용 가능
			if(count === "0"){
				$("#idMessageBox").empty();
				var msgTag = "<p> 사용 가능한 아이디 입니다.</p>";
 				$("#idMessageBox").append(msgTag);
			// 아이디 중복
			}else{
				$("#idMessageBox").empty();
				var msgTag = "<p style='color:red;'> 이미 사용중인 아이디 입니다.</p>";
    	   
				$("#idMessageBox").append(msgTag);
			}
		},error : function(responseData){
			alert('처리 중 서버에서 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.');
		}
	});
}

//휴대폰 번호 중복 체크 함수
/* function fnJungbokPhone(){
	var txtMobile1 = $.trim($("#txtMobile1 option:selected").val());
	var txtMobile2 = $.trim($("#txtMobile2").val());
	var txtMobile3 = $.trim($("#txtMobile3").val());
	var mob_no = txtMobile1 + "-" + txtMobile2 + "-" + txtMobile3
	$("#userPhone").val(mob_no);
	  
	$.ajax({
		url : "phoneJungbokCheck.do",
		type: "post",
		data : { userPhone : $("#userPhone").val() },
		success : function(count){   	
			// 번호 사용 가능
			if(count === "0"){
				$("#phoneMessageBox").empty();
				var msgTag = "<p> 사용 가능한 번호 입니다.</p>";
 				$("#phoneMessageBox").append(msgTag);
 
			// 번호 중복
			}else{
				$("#phoneMessageBox").empty();
				var msgTag = "<p style='color:red;'> 이미 사용중인 번호 입니다.</p>";
 				$("#phoneMessageBox").append(msgTag);
			}
		},error : function(responseData){
			alert('처리 중 서버에서 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.');
		}
	});
 } */

//숫자만 입력 가능하도록 하기 위한 함수
function ageChkNumber(event,type) {
	  if(type == "numbers") {
           if(event.keyCode < 48 || event.keyCode > 57) return false;
           //onKeyDown일 경우 좌, 우, tab, backspace, delete키 허용 정의 필요
       }
} 

//다음 api 주소 검색 함수
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            /* document.getElementById('sample4_jibunAddress').value = data.jibunAddress; */
        }
    }).open();
}

</script>
</head>
<body id="newMember">
  <div class="container">
    <div class="row">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Welcome To the Moving Hair</h5>
            <form class="form-signin" id="form1" name="form1" action="joinProc.do" method="POST">
            
              <!-- 사진 표시 및 첨부 기능 -->
              <div class="form-label-group">
              	사진  공간
              </div>

              <div class="form-label-group">
                <input type="text" id="userId" name="userId" maxlength="20" minlength="4" size="40" placeholder="ID" required autofocus>
                <label for="userId">아이디</label>
                <input type="button" value="중복확인" onclick="fnJungbokID();" class="btn btn-primary" style="margin-bottom:9px; padding-bottom: 15px;"/>
                <span id="idMessageBox"></span>
              </div>

              <div class="form-label-group">
                <input type="password" id="userPwd" name="userPwd" maxlength="20" minlength="7" size="40" placeholder="Password" required>
                <label for="userPwd">패스워드</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="repeatPassword" maxlength="20" minlength="7" onblur="fnPwdCheck();" size="40" placeholder="Repeat Password" required>
                <label for="repeatPassword">패스워드 확인</label>
                <span id="pwdMsg"></span>
              </div>

              <div class="form-label-group">
                <input type="text" id="userName" name="userName" maxlength="20" minlength="2" size="40" placeholder="User Name" required>
                <label for="userName">성명</label>
              </div>

              <div class="form-label-group">
                <input type="text" id="userBirthday" onkeypress="return ageChkNumber(event,'numbers');" name="userBirthday" maxlength="20" minlength="2" size="40" placeholder="주민번호 앞자리" required>
                <label for="userBirthday">생년월일  Ex) 19900721</label>
              </div>
              
              <div class="form-label-group" style="margin-left:10px;">
				<input type="radio" name="userSex" value="M">남
				<input type="radio" name="userSex" value="W">여
              </div>

              <div class="form-label-group">
                <select id="userCls" name="userType" class="form-control" required>
                  <option value="">회원 구분</option>
                  <option value="U">이용자</option>
                  <option value="D">디자이너</option>
                  <option value="A">관리자</option>
                </select>
              </div>

              <div class="form-label-group">
                <div style="margin-bottom: 5px;">휴대폰 번호</div>
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
                <!-- <input type="button" value="중복확인" onclick="fnJungbokPhone();" class="btn btn-primary" style="margin-bottom: 20px; padding-bottom: 13px;"/>
                <span id="phoneMessageBox"></span> -->
                <input type="hidden" id="userPhone" name="userPhone"/>
              </div>
              
              <div class="form-label-group">
                <div style="margin-bottom: 5px;">이메일</div>
                <input type="text" id="emailID" maxlength="15" size="30" style="float:left;" required/>
                
                <span style="float:left; padding-top:12px;">@</span>
                <select id="emailAddr" style="float: left; display: block; width: 21%; padding:  .75rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">
                  <option value="">선택</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.com">hanmail.com</option>
                  <option value="daum.com">daum.com</option>
                  <option value="gmail.com">gmail.com</option>
                </select>
                <input type="hidden" id="userEmail" name="userEmail"/>
              </div>

              <div class="form-label-group" style="clear: both; margin-top: 70px;">
                <input type="text" id="sample4_postcode" size="6" placeholder="우편번호" name="userZip" required="required" readonly="readonly">
                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary" style="padding-bottom: 15px;"><br>
                <label for="sample4_postcode">우편번호</label>
              </div>
              <div class="form-label-group">
                <input type="text" class="form-control" id="sample4_roadAddress" size="50" placeholder="도로명주소" name="userAddr1" readonly="readonly" maxlength="100" required>
                <label for="sample4_roadAddress">주소</label>
              </div>
              <div class="form-label-group">
                <input type="text" class="form-control" id="sample4_jibunAddress" size="50" placeholder="상세주소를 입력해 주세요." name="userAddr2" maxlength="100" required>
                <label for="sample4_jibunAddress">상세주소</label>
              </div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" id="newMemberJoinBtn">Join !</button>
              <button id="cancelBtn" class="btn btn-lg btn-primary btn-block text-uppercase" type="button">Back</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>