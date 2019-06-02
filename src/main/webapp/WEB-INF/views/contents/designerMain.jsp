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
		
		dateClick: function(){
			alert("joohwan");
		},
		
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    defaultView: 'dayGridMonth',
	    selectable: true,
	    defaultDate: '2019-05-07',
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	    },
	    events: [
	      {
	        title: 'All Day Event',
	        start: '2019-05-01'
	      },
	      {
	        title: 'Long Event',
	        start: '2019-05-07',
	        end: '2019-05-10'
	      },
	      {
	        groupId: '999',
	        title: 'Repeating Event',
	        start: '2019-05-09T16:00:00'
	      },
	      {
	        groupId: '999',
	        title: 'Repeating Event',
	        start: '2019-05-16T16:00:00'
	      },
	      {
	        title: 'Conference',
	        start: '2019-05-11',
	        end: '2019-05-13'
	      },
	      {
	        title: 'Meeting',
	        start: '2019-05-12T10:30:00',
	        end: '2019-05-12T12:30:00'
	      },
	      {
	        title: 'Lunch',
	        start: '2019-05-12T12:00:00'
	      },
	      {
	        title: 'Meeting',
	        start: '2019-05-12T14:30:00'
	      },
	      {
	        title: 'Birthday Party',
	        start: '2019-05-13T07:00:00'
	      },
	      {
	        title: 'Click for Google',
	        url: 'http://google.com/',
	        start: '2019-05-28'
	      }
	    ]
	  });

	calendar.render();
});

</script>