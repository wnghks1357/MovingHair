<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <head>
<script type="text/javascript" src="<c:url value='/js/md5.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/sha256.js'/>"></script>
</head> --%>

<body class="loginPage">

<div class="header">
	<h1>서울우유 파트너센터</h1>
</div> <!-- header :: end -->

<div class="container">

	<div class="section">
		<h2>로그인</h2>
		<p class="txt">요청하신 서비스는 판매자 회원만 이용하실 수 있습니다.</p>

		<div class="loginBox">
			
			<div class="txtBox">
				<p>아이디/비밀번호를 입력해주세요.</p>
				<a href="/" target="_blank">서울우유 쇼핑몰 바로가기</a>
			</div>
			
			<c:url value="/j_spring_security_check" var="loginUrl" />
			<form:form name='loginForm' id='loginForm' action="${loginUrl}"  method='POST'>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" id="authmode" name="authmode" value="admin" /> 
				<input type="hidden" id="snstype" name="snstype" value="Z">
				<input type="hidden" name="spring-security-redirect" value="/admin/orderList1">
				<input type="hidden" id="receive" name="receive" value="0">
					
<!-- <c:choose>
<c:when test="${getRemoteAddr_ip == '1.214.214.50' || getRemoteAddr_ip == '210.181.60.141' || getRemoteAddr_ip == '210.181.60.142' || getRemoteAddr_ip == '19.254.35.152'}">
	<input type="hidden" id="receive" name="receive" value="1">	
</c:when>
<c:otherwise>
	<input type="hidden" id="receive" name="receive" value="0">
</c:otherwise>
</c:choose> -->
				<input type="hidden" id="username" name="username" value="">
				<input type="hidden" id="password" name="password" value="">
			</form:form>
				
		
			<form:form name='theForm' id='theForm'   method='POST'>
				<input type="hidden" id="mb_usertype" name="mb_usertype" value="admin">
				<input type="hidden" name="spring-security-redirect" value="/">
		
				<input type="text" class="text" placeholder="파트너 아이디(이메일)" id="userid" name="userid"/>
				<input type="password" class="password" placeholder="비밀번호"  id="pwd" name="pwd"/>
				<input type="text" class="text" placeholder="파트너 인증(-포함 연락처 )" id="userhp" name="userhp"/>
				
				<div class="confirmNumber">
					<input type="text" class="text" placeholder="인증번호 입력" id="smsnumber" name="smsnumber"/>
					<a href="javascript:;" class="receive">인증번호 받기</a>
					<a href="javascript:;" class="confirm">인증번호 확인</a>
				</div>
				
				<p class="notice">
					계정 정보를 확인해 주세요. 허가된 관리자만 로그인 가능합니다.
					<c:if test="${not empty error}">
						<span class="noticeIcon">파트너 아이디와 비밀번호를 확인해주세요.</span>
					</c:if>
				</p>
					
				<!-- 기능 미개발로 주석 -->
				<div class="checkBox">
					<input type="checkbox" id="idSave" name="idSave"/>
					<label for="idSave">아이디저장</label>
				</div>

				<!-- <a href="javascript:formSubmit()" class="loginBtn">로그인</a> -->
				<a href="javascript:;" class="loginBtn">로그인</a>
			</form:form>
	
			<div class="linkBox">
				<a href="/login" target="_blank">아이디/비밀번호 찾기</a>
				<a href="/join.do" target="_blank">파트너 가입하기</a>
			</div> <!-- linkBox :: end -->

		</div> <!-- loginBox :: end -->

		<ul class="list_01">
			<li>판매자 로그인과 관련된 문의는 <a href="mailto:psj9959@seoulmilk.co.kr">psj9959@seoulmilk.co.kr</a>로 보내주시길 바랍니다.</li>
			<li>회원정보와 관련하여 문의가 있으신 경우 ☏ 판매자 상담센터(02-3445-3183)를 이용하시기 바랍니다.</li>
		</ul>
	</div> <!-- section :: end -->

</div> <!-- container :: end -->

<script>
$(document).ready(function(){
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	
	var userInputId = getCookie("userInputId");
	var userInputEmail = getCookie("userInputEmail");
	
	$("input[name='userid']").val(userInputId);
	
	console.log(">>" + $("input[name='userid']").val());
	if($("input[name='userid']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		$("#idSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	}

	$("#idSave").change(function(){ // 체크박스에 변화가 있다면,
		if($("#idSave").is(":checked")){ // ID 저장하기 체크했을 때,
			var userInputId = $("input[name='userid']").val();
			setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		}else{ // ID 저장하기 체크 해제 시,
			deleteCookie("userInputId");
		}
	});

	// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	$("input[name='userid']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		if($("#idSave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
			var userInputId = $("input[name='userid']").val();
			setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		}
	});
	
	//로그인 클릭
	$('body').on('click', '.loginBtn', function(){
		if($('#receive').val() =='0'){
			alert("인증 해주시기 바랍니다.");
			return false;
		}
		
//		$('#password').val(calcMD5($('#pwd').val()));
		
//		document.getElementById("loginForm").submit();
//		return false;
		var theForm = $("#theForm").serialize(); 
		$("#theForm").ajaxSubmit({
			type: 'post',
			url: getContextPath+'/siteLogin.do',
			data: theForm,
			dataType: 'json',
			success: function(data){
				console.log(data.result); //return false;
				var result = data.result.split('^^');
				console.log(result[0]);
				console.log(result[1]);
				if (result[0].trim() == "SUCCESS"){
					
					$('#password').val(sha256(calcMD5($('#pwd').val())));
//					$('#password').val($('#pwd').val());
					$('#username').val($('#userid').val());
					document.getElementById("loginForm").submit();
					
				}else if(result[0].trim() == "NO_NUM"){
					alert("인증번호가 유효하지 않습니다.");
					return false;
				}else if(result[0].trim() == "FAILURE_ID"){
					alert("아이디를 확인해 주세요.");
				}else if(result[0].trim() == "FAILURE_PWD"){
					alert("비밀번호를 " + result[1] +"회 이상 잘못 입력 하셨습니다. ");
				}else{
					if($('#mb_usertype').val()=="partner"){
						alert("서울우유 조합원이 아닙니다. \n 아이디 또는 비밀번호를 확인해 주세요.");
					}else{
						//alert("일반회원이 또는 사업자판매회원이 아닙니다. \n 아이디 또는 비밀번호를 확인해 주세요.");
						alert("비밀번호를 5회 이상 잘못 입력 하셨습니다. 관리자에게 문의하여 주시기 바랍니다.");
					}
				
					return false;
				}
			}, error:function(response){alert('error\n\n' + response.responseText);}
		});
		return false; 
	});
	
	// enter키 입력
	$('body').on('keypress, keydown, keyup', '#pwd, #userid', function(key){
		if (key.keyCode==13){
//			if($('#receive').val() =='0'){
//				alert("인증 해주시기 바랍니다.");
//				return false;
//			}
			
//			$('#password').val(calcMD5($('#pwd').val()));
			
//			document.getElementById("loginForm").submit();
//			return false;
			var theForm = $("#theForm").serialize(); 
			$("#theForm").ajaxSubmit({
				type: 'post',
				url: getContextPath+'/siteLogin.do',
				data: theForm,
				dataType: 'json',
				success: function(data){
					console.log(data.result); //return false;
					var result = data.result.split('^^');
					console.log(result[0]);
					console.log(result[1]);
					if (result[0].trim() == "SUCCESS"){
						
						$('#password').val(sha256(calcMD5($('#pwd').val())));
//						$('#password').val($('#pwd').val());
						$('#username').val($('#userid').val());
						document.getElementById("loginForm").submit();
						
					}else if(result[0].trim() == "NO_NUM"){
						alert("인증번호가 유효하지 않습니다.");
						return false;
					}else if(result[0].trim() == "FAILURE_ID"){
						alert("아이디를 확인해 주세요.");
						return false;
					}else if(result[0].trim() == "FAILURE_PWD"){
						alert("비밀번호를 " + result[1] +"회 이상 잘못 입력 하셨습니다. ");
						return false;
					}else{
						if($('#mb_usertype').val()=="partner"){
							alert("서울우유 조합원이 아닙니다. \n 아이디 또는 비밀번호를 확인해 주세요.");
						}else{
							//alert("일반회원이 또는 사업자판매회원이 아닙니다. \n 아이디 또는 비밀번호를 확인해 주세요.");
							alert("비밀번호를 5회 이상 잘못 입력 하셨습니다. 관리자에게 문의하여 주시기 바랍니다.");
						}
					
						return false;
					}
				}, error:function(response){alert('error\n\n' + response.responseText);}
			});
			return false; 
		}
	});
	
	// 인증번호 받기
	$('body').on('click', '.receive', function(){
		if ($('#userid').val().replace(/\s/g, "").length == 0){ alert('관리자 아이디를 입력해주세요.'); $('#userid').focus(); return false; }
		if ($('#userhp').val().replace(/\s/g, "").length == 0){ alert('인증 받을 연락처를 입력해주세요.'); $('#userhp').focus(); return false; }
		
		var theForm = $("#theForm").serialize(); 
		$("#theForm").ajaxSubmit({
			success: function(responseText){
				console.log(responseText); //return false;
				if (responseText.trim() == "SUCCESS"){
					alert("문자 발송이 되었습니다.");
				}else if(responseText.trim() == "ERROR01"){
					alert("인증번호 발송 에러. 다시 시도 해주시기 바랍니다.");
					return false;
				}else{
					alert("관리자에 등록 되지 않은 계정 이거나 \n 등록 되지 않은 연락처 입니다.");
					return false;
				}
			}, error:function(response){alert('error\n\n' + response.responseText);}, 
			type: 'post', url: getContextPath+'/SmsSend.do', data: theForm, dataType: 'html'});
		return false; 
	});
	
	// 인증하기
	$('body').on('click', '.confirm', function(){
		if ($('#userid').val().replace(/\s/g, "").length == 0){ alert('관리자 아이디를 입력해주세요.'); $('#userid').focus(); return false; }
		
		var theForm = $("#theForm").serialize(); 
		$("#theForm").ajaxSubmit({
			success: function(responseText){
				console.log(responseText); //return false;
				if (responseText.trim() == "SUCCESS"){
					alert("인증이 되었습니다.");
					$('#receive').val('1');
				}else{
					alert("인증번호를 확인 해주세요.");
					$('#smsnumber').val('');
					return false;
				}
			}, error:function(response){alert('error\n\n' + response.responseText);}, 
			type: 'post', url: getContextPath+'/SmsConfirm.do', data: theForm, dataType: 'html'});
		return false; 
	});
	
});
 
function setCookie(cookieName, value, exdays){
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}

//숫자만 입력 처리 
$("input[evname*='onlynum']").keyup(function(event){
	if( !((event.keyCode>=48 && event.keyCode<=57) || (event.keyCode>=96 && event.keyCode<=105) || event.keyCode==8 || event.keyCode==110 || event.keyCode==9) ){
		event.returnValue=false;
		$(this).val($(this).val().replace(/[^0-9]/gi, ""));
	}
});
</script>

<script>
function formSubmit() {
	document.getElementById("loginForm").submit();
}
</script>

</body>
