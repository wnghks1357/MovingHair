<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Event</title>
<!-- 부트스트랩 cdn-->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- 부트스트랩 local-->
<link rel='stylesheet' href='resources/stylesheets/bootstrap/bootstrap.min.css' />

<script src="resources/javascripts/bootstrap/jquery-3.2.1.min.js" charset="utf-8"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>

$(function () {

}

</script>
</head>
<body>
  <table border="1" style="margin-top: 30px;" id="eventListTb" class="table table-striped" >
		<colgroup>
			<col width="15%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th>등록 날짜</th>
				<th style="text-align: center;">이벤트</th>
				<th>종료 날짜</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<fmt:formatDate value="${eventVo.eventStartDt }" pattern="yyyy.MM.dd"/>
				</td>
				<td class="titleTd">${eventVo.eventTitle }</td>
				<td>
					<fmt:formatDate value="${eventVo.eventEndDt }" pattern="yyyy.MM.dd"/>
				</td>
				<td>${eventVo.userName }</td>
			</tr>
		</tbody>
	</table>
</body>
</html>