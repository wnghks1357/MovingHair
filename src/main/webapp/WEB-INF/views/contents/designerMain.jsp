<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="card card-signin my-5" style="width:1000px;">
	<div class="card-body">
		<h2>Designer</h2>
		
		<div id='calendar'></div>
		
	</div>
</div>

<script>

	document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: [ 'dayGrid' ]
	});

	calendar.render();
});

</script>