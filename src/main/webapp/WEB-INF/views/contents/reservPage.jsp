<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="card card-signin my-5" style="width:1000px; position: relative;">
	<div class="card-body">
	<h5 class="card-title text-center">예약</h5>	
		<div style="float: left; overflow: hidden; width: 15%;">
			<img src="resources/images/movinghair/movinghairLogo.PNG" style="width: 100%; margin-top:50px;">
			<div style="max-width: 120px; margin: auto; text-align: center;">
				<div style="border-bottom: 1px solid black; background-color: #637496">Designer</div>
				<div style="background-color: #ffe9a5" id="designerIdDiv">${designerId }</div>
			</div>
		</div>	
		<div style="float:right; width:80%;">
		
			<form action="#" class="contact_form" id="contact_form" onsubmit="beforSubmit(); return false;">
			
				<div style="margin-bottom: 10px">예약 날짜</div>
				<div class="row contact_row">
					<div class="col-md-6"><input type="date" class="contact_input" id="rDate" name="rDate" placeholder="예약 날짜" required="required"></div>
					<div class="col-md-6"><input type="text" class="contact_input" id="timepicker1" name="rTime" placeholder="예약 시간" required="required"></div>
				</div>
				
				<!-- <div style="margin-bottom: 10px;">이름</div>
				<div class="row contact_row">
					<div class="col-md-6"><input type="text" class="contact_input" placeholder="이름" required="required"></div>
				</div> -->
				<!-- <div class="form-label-group">
	                <div style="margin-bottom: 10px;">휴대폰 번호</div>
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
	                <input type="button" value="중복확인" onclick="fnJungbokPhone();" class="btn btn-primary" style="margin-bottom: 20px; padding-bottom: 13px;"/>
	                <span id="phoneMessageBox"></span>
	                <input type="hidden" id="userPhone" name="userPhone"/>
              </div> -->
              
              <div style="margin-top: 30px;">희망 서비스 지역</div>
              <div class="form-label-group">
                <input type="text" id="sample4_postcode" size="6" placeholder="우편번호" name="userZip" required="required" readonly="readonly">
                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="contact_button" style="padding-bottom: 15px;"><br>
              </div>
              <div class="form-label-group">
                <input type="text" class="form-control" id="sample4_roadAddress" size="50" placeholder="도로명주소" name="userAddr1" readonly="readonly" maxlength="100" required>
                <label for="sample4_roadAddress">주소</label>
              </div>
              <div class="form-label-group">
                <input type="text" class="form-control" id="sample4_jibunAddress" size="50" placeholder="상세주소를 입력해 주세요." name="userAddr2" maxlength="100" required>
                <label for="sample4_jibunAddress">상세주소</label>
              </div>
				
				<div><textarea class="contact_input contact_textarea" placeholder="Message" id="msgTag"></textarea></div>
				<button class="contact_button" style="float: right;">예약신청</button>
			</form>
			
			<form id="submitForm" name="submitForm" action="reservProc.do" method="post">
				<input type="hidden" id="userId" name="userId" value="${userId }">
				<input type="hidden" id="reservDateStr" name="reservDateStr">
				<input type="hidden" id="designerId" name="designerId">
				<input type="hidden" id="reservLoc" name="reservLoc">
				<input type="hidden" id="reservMsg" name="reservMsg">
			</form>
		</div>
	</div>
</div>

<script>
$(function(){
	var today = moment().format('YYYY-MM-DD');
	document.getElementById("rDate").value = today;
	
	$('#timepicker1').timepicki();
})

function beforSubmit(){
	
	var rDate = $("#rDate").val();
	var rTime = $("#timepicker1").val();
	
	var [time, modifier] = rTime.split(' ');

	var [hours, minutes] = time.split(':');

	if (hours === '12') {
		hours = '00';
	}

	if (modifier === 'PM') {
		hours = parseInt(hours, 10) + 12;
	}
	
	rTime = hours + ":" + minutes;
	
	
	var addr1 = $("#sample4_roadAddress").val();
	var addr2 = $("#sample4_jibunAddress").val();
	
	//예약 날짜
	var reservDateStr = rDate + " " + rTime +":00.0";
	
	//Timestamp type으로 변환
	var reservDate = moment(reservDateStr);
	
	//디자이너 아이디
	var designerId = $("#designerIdDiv").text();
	//예약 주소
	var reservLoc = addr1 + " " + addr2;
	
	//예약 메시지
	var reservMsg = $("#msgTag").val();
	

	$("#reservDateStr").val(reservDateStr);
	$("#designerId").val(designerId);
	$("#reservLoc").val(reservLoc);
	$("#reservMsg").val(reservMsg);
	
	var submitForm = document.submitForm;
	submitForm.submit();
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

//숫자만 입력 가능하도록 하기 위한 함수
function ageChkNumber(event,type) {
	  if(type == "numbers") {
		  if(event.keyCode < 48 || event.keyCode > 57) return false;
           //onKeyDown일 경우 좌, 우, tab, backspace, delete키 허용 정의 필요
       }
} 

</script>