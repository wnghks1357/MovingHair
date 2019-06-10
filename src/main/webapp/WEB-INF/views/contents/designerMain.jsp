<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="card card-signin my-5" style="width:1000px;">
	<div class="card-body">
		<h2>Designer</h2>
		
		<div id='calendar'></div>
		
	</div>
	
</div>

<script>

document.addEventListener('DOMContentLoaded', function() {
	
 	var eventList = new Array();
	
	<c:forEach items="${reservList}" var="reserv">
		var json = new Object;
		
		json.groupId= "${reserv.reservId}";
		json.title="${reserv.userId}";
		
		//json.start='<fmt:formatDate value="${reserv.reservDate}" pattern="yyyy-MM-dd HH:mm"/>';
		
		var reservDate = "${reserv.reservDate}";
		//var reservDate = "${reserv.reservDateStr}";
		var dateObj = new Date(reservDate);
		var ISODate = dateObj.toISOString();
		
		json.start=ISODate;
		
		eventList.push(json);
	</c:forEach>
	
	 /* var eventList = [
	      {
		        title: 'userId',
		        start: '2019-05-01T16:00:00'
		      }
		    ]; 	 */
	
	//eventList = [{'title':'e4net','start':'2019-06-09T14:25:00.000Z'},{'title':'e4net','start':'2019-06-09T14:40:00.000Z'},{'title':"e4net","start":"2019-06-09T14:53:00.000Z"}];
	
	var today = new Date();
		    
	var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		
		eventClick: function(arg){
			
			//alert(arg.event.groupId);
			
			var reservId = arg.event.groupId;
			
			popupOpen(reservId);
			
			function popupOpen(reservId){
				
				var windowSize = {
					    width: 560,
					    height: 600,
				};
				
				var windowLocation = {
					    left:  (window.screen.availLeft + (window.screen.availWidth / 2)) - (windowSize.width / 2),
					    top: (window.screen.availTop + (window.screen.availHeight / 2)) - (windowSize.height / 2),
				};
	
				var popUrl = "desginerScPopup.do?reservId="+reservId;	//팝업창에 출력될 페이지 URL
	
				var popOption = "width="+windowSize.width+", height="+windowSize.height+", left="+windowLocation.left+", top="+windowLocation.top+", resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	
					window.open(popUrl,"",popOption);
	
			}
		},
		
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    defaultView: 'dayGridMonth',
	    selectable: true,
	    defaultDate: today,
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	    },
	    events: eventList
	  });

	calendar.render();
});

</script>