<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){

	});
	

</script>

<div class="card card-signin my-5" style="width:1000px;">
	<div class="card-body">
		
		<div class="eventDetailContainer">
			<table class="table table-striped">
		        <caption>상세보기</caption>
		        <colgroup>
		            <col width="15%">
		            <col width="35%">
		            <col width="15%">
		            <col width="*">
		        </colgroup>
		         
		        <tbody>
		            <tr>
		                <th>제목</th>
		                <td>${map.TITLE}</td>
		                <th>조회수</th>
		                <td>${map.HIT_CNT }</td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>${map.CREA_ID }</td>
		                <th>작성시간</th>
		                <td>${map.CREA_DTM }</td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td colspan="3">
		                    ${map.CONTENTS }
		                </td>
		            </tr>
		        </tbody>
		    </table>
		    <a href="#this" id="list" class="btn">목록으로</a>
		    <a href="#this" id="modify" class="btn">수정하기</a>
		
		</div>
		
	</div>
</div>
