<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){

	});
	

</script>

<div class="card card-signin my-5" style="width:1000px;">
	<div class="card-body">
		
		<div>
			<table class="table table-striped">
		        <colgroup>
		            <col width="15%">
		            <col width="35%">
		            <col width="15%">
		            <col width="*">
		        </colgroup>
		         
		        <tbody>
		            <tr>
		                <th>제목</th>
		                <td colspan="3" style="text-align: center;">${eventVo.eventTitle}</td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>${eventVo.userId }</td>
		                <th>작성시간</th>
		                <td>${eventVo.writeDate }</td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td colspan="3">
		                    ${eventVo.eventContent }
		                </td>
		            </tr>
		        </tbody>
		    </table>
		    <a href="eventList.do" id="list" class="btn">목록으로</a>
		
		</div>
		
	</div>
</div>
