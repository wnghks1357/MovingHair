<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		
		//핸드폰 번호 값 넣기
		var phoneArr = [];
		mobNoOld = $("#userPhone").val();
		phoneArr = mobNoOld.split("-");

		$("#txtMobile1").val(phoneArr[0]).prop("selected", true);
		$("#txtMobile2").val(phoneArr[1]);
		$("#txtMobile3").val(phoneArr[2]);
		//핸드폰 번호 값 넣기//
		
		//이메일 값 넣기
		var emailArr=[];
		var mail = $("#userEmail").val();
		emailArr = mail.split("@");
		
		$("#emailID").val(emailArr[0]);
		$("#emailAddr").val(emailArr[1]).prop("selected", true);
		//이메일 값 넣기//
		
		
		//정보 수정 버튼 클릭 이벤트
		$("#myInfoUpdateBtn").click(function(){
			
			
			if( $("#userName").val() =="" ){
				alert("성명을 입력하세요.");
				return;
			}else if( $("#txtMobile1 option:selected").val()=="" || $("#txtMobile2").val() =="" || $("#txtMobile3").val() =="" ){
				alert("휴대폰 번호를 입력하세요.");
				return;
			}else if( $("#sample4_postcode").val()=="" ){
				alert("우편번호를 입력해주세요.");
				return;
			}else if($("#phoneMessageBox").text() =="중복된 번호가 존재합니다."){
				alert("휴대폰번호 중복확인을 해주세요.");
				return;			
			}else if($("#emailAddr option:selected").val() == ""){
				$("#userEmail").val("");
			}
			else{
				var emailID = $("#emailID").val();
				var emailAddr =$("#emailAddr option:selected").val();
				var user_email = emailID +"@"+ emailAddr;
				$("#userEmail").val(user_email);
			}
			
			
			var txtMobile1 = $.trim($("#txtMobile1 option:selected").val());
			var txtMobile2 = $.trim($("#txtMobile2").val());
			var txtMobile3 = $.trim($("#txtMobile3").val());
			var mob_no = txtMobile1 + "-" + txtMobile2 + "-" + txtMobile3
			$("#userPhone").val(mob_no);
			
			//회원정보 수정
			var f = document.form1;
			f.submit();	
			
			/* //휴대폰 번호 중복 체크
			$.ajax({
				url : "phoneJungbokCheck.do",
				type: "post",
				data : { userPhone : $("#userPhone").val(), userId: $("#userId").text() },
				async : false,	// 중복 count로 submit 여부를 결정하기 위한 동기 처리
				success : function(count){  
					
					//번호 중복
					if(count > 0){
						$("#phoneMessageBox").empty();
						var msgTag = "<p style='color:red;'> 이미 사용중인 번호 입니다.</p>";
		 				$("#phoneMessageBox").append(msgTag);
		 				
	 				//중복된 핸드폰 번호가 없을떄만 submit
					}else{
						var f = document.form1;
						f.submit();	
					}
				},error : function(responseData){
					alert('처리 중 서버에서 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.');
				}
			}); */
		});
		
		//패스워드 변경 버튼 클릭시 함수
		$("#pwdConfirmBtn").click(function () {
			
			var oldUserPwd = $("#oldUserPwd").val();
			
			var userPwd = $("#userPwd").val();
			var userPwdCheck = $("#userPwdCheck").val();
			
			if(oldUserPwd == null){
				alert("기존 패스워드를 입력해 주세요.");
				return;
			}else if(userPwd == null){
				alert("신규 패스워드를 입력해 주세요.");
				return;
			}else if(userPwd != userPwdCheck){
				alert("신규 패스워드가 일치하지 않습니다.");
				return;
			}
			
			var oldUserPwd = hex_sha512($('#oldUserPwd').val()).toString();
			oldUserPwd = oldUserPwd.substring(0,20);
		
			$.ajax({
				url : "checkUserPwd.do",
				type: "post",
				data : { userId: $("#userId").text(), oldUserPwd: oldUserPwd },
				async : false,
				success : function(data){  
					
					data = Number(data);
					
					//기존 패스워드 일치 시
					if( data > 0 ){
						
						var newPwd = hex_sha512($('#userPwd').val()).toString();
						newPwd = newPwd.substring(0,20);
						
						//기존 패스워드와 신규 패스워드가 동일하지 않은 경우
						if(oldUserPwd != newPwd){
							$("#userPwd").val(newPwd);
							
							var f = document.form2;
							f.submit();
							//기존, 신규 패스워드가 동일한 경우 변경 요청
						}else{
							alert("신규 패스워드를 기존 패스워드와 다르게 설정해 주세요.");
							return;
						}
						
					}else{
						alert("기존 패스워드가 일치하지 않습니다.");
					}
					
					
				},error : function(responseData){
					alert('처리 중 서버에서 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.');
				}
			});
			
			
			
			
			
		});
	});
	
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

<div class="col-sm-9 col-md-7">
	<div class="card card-signin my-5" style="width:550px;">
		<div class="card-body">
			<h5 class="card-title text-center">내 정보 관리</h5>
			
			<form action="userInfoUpdate.do" name="form1" id="form1" method="post">
				<div class="form-label-group">
					<strong><span id="userId">${userInfo.userId }</span></strong>
					<input type="hidden" name="userId" value="${userInfo.userId }">
					<span>고객님 정보</span>
				</div>
				<br/>
				
				<!-- 사진 표시 및 첨부 기능 -->
				<div class="form-label-group">
						사진  공간
				</div>
				
				<div class="form-label-group">
					<input type="text" id="userName" name="userName" maxlength="8" value="${userInfo.userName }"/>
					<label for="USR_NM">성명</label>
				</div>
			 	<div class="form-label-group">
	                <div style="margin-bottom: 5px;">휴대폰 번호</div>
	                <select id="txtMobile1" required style="float: left; display: block; width: 28%; padding:  .75rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">
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
					<input type="hidden" id="userPhone" name="userPhone" value="${userInfo.userPhone }"/>
					<span id="phoneMessageBox"></span>
				</div>
				
				<div class="form-label-group">
					<div style="margin-bottom: 5px;">이메일</div>
	                <input type="text" id="emailID" maxlength="15" size="30" style="float:left;" required/>
	                
	                <span style="float:left; padding-top:12px;">@</span>
	                <select id="emailAddr" style="float: left; display: block; width: 28%; padding:  .75rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">
						<option value="">선택</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="daum.com">daum.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
	                <input type="hidden" id="userEmail" name="userEmail" value="${userInfo.userEmail }"/>
				</div>
				<div class="form-label-group" style="clear: both; margin-top: 70px;">
					<input type="text" value="${userInfo.userZip }" id="sample4_postcode" size="6" placeholder="우편번호" name="userZip" required="required" readonly="readonly">
					<button type="button" onclick="sample4_execDaumPostcode()" class="btn btn-primary" style="margin-bottom: 10px;">우편번호 찾기</button><br>
					<label for="sample4_postcode">우편번호</label>
				</div>
				<div class="form-label-group">
					<input type="text" value="${userInfo.userAddr1 }" class="form-control" id="sample4_roadAddress" size="50" placeholder="도로명주소" name="userAddr1" readonly="readonly" maxlength="100" required>
					<label for="sample4_roadAddress">주소</label>
				</div>
				<div class="form-label-group">
					<input type="text" value="${userInfo.userAddr2 }" class="form-control" id="sample4_jibunAddress" size="50" name="userAddr2" maxlength="100" required>
					<label for="sample4_jibunAddress">상세주소</label>
				</div>
				<button type="button" id="myInfoUpdateBtn" class="btn btn-primary" style="float: right; margin-right: 10px;">저장</button>
				
			
			</form>
			
			
		
			<form action="updateUserPwd.do" name="form2" id="form2" method="post" style="clear: both; margin-top: 20px;">
				<div class="form-label-group">
					<span>비밀번호 변경</span>
				</div>
				<div class="form-label-group">
					<input type="password" id="oldUserPwd" name="oldUserPwd" maxlength="15"/><br/>
					<label for="oldUserPwd">기존 비밀번호</label>
				</div>
				
				<div class="form-label-group"> 
					<input type="password" id="userPwd" name="userPwd" maxlength="15"/><br/>
					<label for="usrPwd">신규 비밀번호</label> 
				</div>
				
				<div class="form-label-group">
				
					<input type="password" id="userPwdCheck" maxlength="15"/>
					<label for="userPwdCheck">비밀번호 확인</label>
				</div>
				<input type="hidden" name="userId" value="${userInfo.userId }">
				<button type="button" id="pwdConfirmBtn" class="btn btn-primary" style="float: right; margin-right: 10px;">저장</button>
			</form>
			
		</div>
	</div>
</div>