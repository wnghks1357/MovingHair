<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		
		$("#outReasonSelect").on("change", function(){
			
			$("#otherReasonDiv").empty();
			
			var reason = $(this).val();
			
			if(reason =="기타") {
				var textArea = $('<textarea id="otherReasonText" name="otherReasonText" cols="85" rows="10" placeholder="기타 사유를 적어주세요."></textarea>');
				$("#otherReasonDiv").append($(textArea));
			}
			
			$("#outReason").val(reason);
		});
		
		$("#userOutBtn").click(function(){
			var reason = $("#outReasonSelect option:selected").val();
			
			//기타인 경우 기타의 사유를 입력
			if(reason == "기타"){
				$("#outReason").val($("#otherReasonText").val());
			}
			
			alert("그 동안 이용해 주셔서 감사합니다.");
			
			//회원 탈퇴
			var f = document.form1;
			f.submit();	
		});
		
	});
</script>
<div class="card card-signin my-5" style="width:700px;">
	<div class="card-body">
		<h5 class="card-title text-center">회원 탈퇴</h5>
		
		<form action="outMemberProc.do" id="form1" name="form1" method="post">
		
			<div class="form-label-group" style="clear: both;">
				<div style="margin-bottom: 5px;">탈퇴 사유</div>
				<select id="outReasonSelect" required style="float: left; display: block; width: 28%; padding:  .75rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">
					<option value="비용">비용 문제</option>
					<option value="서비스 품질">서비스 품질 문제</option>
					<option value="편의성">편의성 문제</option>
					<option value="불친절">불친절 문제</option>
					<option value="기타">기타</option>
				</select>
			</div>
			
			<%-- 기타 사유 --%>
			<div id="otherReasonDiv" style="margin-top: 100px;">
			
			</div>
			
			<input type="hidden" value="${userId }" name="userId">
			<input type="hidden" id="outReason" name="outReason">
			
			<button type="button" id="userOutBtn" class="btn btn-warning" style="float: right; margin-top: 15px; margin-right: 35px;">회원 탈퇴</button>
			
		</form>
	</div>
</div>