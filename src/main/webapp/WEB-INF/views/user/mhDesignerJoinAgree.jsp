<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>이용약관</title>
<!-- 부트스트랩 cdn-->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- 부트스트랩 local-->
<link rel='stylesheet' href='resources/stylesheets/bootstrap/bootstrap.min.css' />
<!-- custom css -->
<link rel='stylesheet' href='resources/stylesheets/bootstrap/login_boot.css' />

<script src="resources/javascripts/bootstrap/jquery-3.2.1.min.js" charset="utf-8"></script>


</head>
<script>
	$(function(){
		
		$("#agreeBtn").click(function(){
			
			if(!$("#chk_moving_agree").is(":checked") || !$("#chk_private_info_agree").is(":checked")){
				alert("필수 동의 항목을 체크해 주세요.");
				return;
			}
			
			var agreeArr = [];
			
			
			
			agreeArr[0] = $("#chk_moving_agree").is(":checked");
			agreeArr[1] = $("#chk_private_info_agree").is(":checked");
			agreeArr[2] = $("#chk_location_info_agree").is(":checked"); 
			agreeArr[3] = $("#chk_promotion_agree").is(":checked");
			
			for(var i=0; i < agreeArr.length; i++){
				if(agreeArr[i] == true){
					agreeArr[i] = 'Y';
				}else{
					agreeArr[i] = 'N';
				}
			}
			
			$("#movingAgree").val(agreeArr[0]);
			$("#privateInfoAgree").val(agreeArr[1]);
			$("#locationAgree").val(agreeArr[2]);
			$("#promotionAgree").val(agreeArr[3]);
			
			var f = document.form2;
			f.submit();
			
		});
		
		$("#noAgreeBtn").click(function () {
			history.back();
		});
		
		$("#chk_all").click(function(){
			var chk = $(this).is(":checked");//.attr('checked'); class="input_chk"
			if(chk) $(".input_chk").prop('checked', true);
			else  $(".input_chk").prop('checked', false);
	    });		
	})
</script>
<body>
  <div class="container">
    <div class="row">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">MovingHair</h5>
            
            <form class="form-signin" id="form1" name="form1" method="POST">

              
              <div class="form-label-group">
              	<input type="checkbox" id="chk_all">
				<label for="chk_all" style="font-weight: bold; color: black;">이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택) 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</label>
              </div>
              
			<div class="form-label-group">
              	<input type="checkbox" id="chk_moving_agree" class="input_chk">
				<label for="chk_moving_agree" style="font-weight: bold; color: black;">무빙 헤어 이용약관 동의(필수)</label>
				
				<div style="margin-top: 10px;">
					<textarea cols="140" rows="10" style="font-size: 12px; line-height: 16px; color: #666;">무빙헤어 이용약관
여러분을 환영합니다.
무빙헤어 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 무빙헤어 서비스의 이용과 관련하여 무빙헤어 서비스를 제공하는 윈앤드컴퍼니(이하 ‘무빙헤어’)와 이를 이용하는 무빙헤어 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 무빙헤어 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 
무빙헤어 서비스를 이용하시거나 무빙헤어 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 
유용한 무빙헤어 서비스를 즐겨보세요.
무빙헤어는 www.movinghair.co.kr 을 통해 여러분의 생활에 편리함을 더할 수 있는 방문 헤어 서비스를 제공하고 있습니다.
여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 서비스를 자유롭게 이용하실 수 있으며, 서비스의 구체적인 내용은 공지사항, 고객센터 도움말 등에서 쉽게 확인하실 수 있습니다. 
회원으로 가입하시면 무빙헤어 서비스를 보다 편리하게 이용할 수 있습니다.
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 무빙헤어는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 무빙헤어 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 무빙헤어 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 무빙헤어 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 에서 확인해 주세요. 
여러분의 개인정보를 소중히 보호합니다.
무빙헤어는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 무빙헤어가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 공지사항에서 확인하실 수 있습니다. 
무빙헤어는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다. 
무빙헤어에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.
무빙헤어는 여러분이 무빙헤어 서비스를 할인혜택과 더불어, 서비스를 효율적으로 이용할 수 있도록 포인트를 부여하고 있습니다. 포인트는 여러분의 일정한 무빙헤어 서비스 이용과 연동하여 무빙헤어가 임의로 책정하거나 조정하여 지급하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다. 포인트는 금전으로 환불 또는 전환할 수 없지만, 1포인트당 1원의 재산적 가치가 있어 포인트에 따라 여러분의 무빙헤어 서비스 이용에 영향(할인가능)을 주는 경우가 있으므로 경우에 따라 적절히 활용해 보세요. 단, 탈퇴하는 경우 포인트가 소멸될 수 있다는 점 양지하시길 바랍니다.
 
무빙헤어의 잘못은 무빙헤어가 책임집니다.
무빙헤어는 여러분이 무빙헤어 서비스를 이용함에 있어 무빙헤어의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 무빙헤어가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 무빙헤어는 책임을 부담하지 않습니다. 
그리고 무빙헤어가 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다. 
한편, 무빙헤어 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 무빙헤어는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다. 
언제든지 무빙헤어 서비스 이용계약을 해지하실 수 있습니다.
무빙헤어에게는 참 안타까운 일입니다만, 회원은 언제든지 무빙헤어 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 무빙헤어는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다. 
무빙헤어 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 무빙헤어가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 
일부 무빙헤어 서비스에는 광고가 포함되어 있습니다.
여러분이 무빙헤어 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다. 무빙헤어 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다. 
무빙헤어 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 무빙헤어 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 무빙헤어가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다. 
무빙헤어는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다. 
서비스 중단 또는 변경 시 꼭 알려드리겠습니다.
무빙헤어는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다. 
한편, 무빙헤어는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다. 
이 경우 무빙헤어는 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다. 
주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.
무빙헤어는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.movinghair.co.kr 의 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다. 
무빙헤어는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 무빙헤어는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다. 
여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.
무빙헤어는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다. 
무빙헤어는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다. 
무빙헤어는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 무빙헤어에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 무빙헤어로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다. 
무빙헤어 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다. 
본 약관은 한국어를 정본으로 합니다. 본 약관 또는 무빙헤어 서비스와 관련된 여러분과 무빙헤어와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 무빙헤어 서비스와 관련하여 여러분과 무빙헤어 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다. 
공지 일자: 2019년 3월 14일
적용 일자: 2018년 6월 1일
무빙헤어 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 010-3435-3952/ 평일 09:00~18:00)로 문의 주시기 바랍니다. 			
					</textarea>
				</div>
			</div>
			
			<div class="form-label-group">
              	<input type="checkbox" id="chk_private_info_agree" class="input_chk">
				<label for="chk_private_info_agree" style="font-weight: bold; color: black;">개인정보 수집 및 이용에 대한 안내(필수)</label>
				
				<div style="margin-top: 10px;">
					<textarea cols="140" rows="10" style="font-size: 12px; line-height: 16px; color: #666;">
개인정보 수집 및 이용에 대한 안내
					</textarea>
				</div>
			</div>
			
			<div class="form-label-group">
              	<input type="checkbox" id="chk_location_info_agree" class="input_chk">
				<label for="chk_location_info_agree" style="font-weight: bold; color: black;">위치정보 이용약관 동의(선택)</label>
				
				<div style="margin-top: 10px;">
					<textarea cols="140" rows="10" style="font-size: 12px; line-height: 16px; color: #666;">
위치정보 이용약관 동의
					</textarea>
				</div>
			</div>
			
			<div class="form-label-group">
              	<input type="checkbox" id="chk_promotion_agree" class="input_chk">
				<label for="chk_promotion_agree" style="font-weight: bold; color: black;">이벤트 등 프로모션 알림 메일 수신(선택)</label>
				
				<div style="margin-top: 10px;">
					<textarea cols="140" rows="10" style="font-size: 12px; line-height: 16px; color: #666;">
이벤트 등 프로모션 알림 메일 수신
					</textarea>
				</div>
			</div>

           
              
              
              
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" id="agreeBtn">동의</button>
              <button id="noAgreeBtn" class="btn btn-lg btn-primary btn-block text-uppercase" type="button">비동의</button>
            </form>
            
            <form action="mhDesignerJoin" method="post" name="form2">
            	<input type="hidden" id="movingAgree" name="movingAgree">
            	<input type="hidden" id="privateInfoAgree" name="privateInfoAgree">
            	<input type="hidden" id="locationAgree" name="locationAgree">
            	<input type="hidden" id="promotionAgree" name="promotionAgree">
            </form>
          </div>
        </div>
      </div>
    </div>



            

</body>
</html>