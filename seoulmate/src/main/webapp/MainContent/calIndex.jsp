<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet"> 
    
	<link rel="stylesheet" href="./calendar/fonts/icomoon/style.css">
    <link href='../calendar/fullcalendar/packages/core/main.css' rel='stylesheet' />
    <link href='../calendar/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="./calendar/css/bootstrap.min.css"> -->
    
    <!-- Style -->
    <link rel="stylesheet" href="../calendar/css/style.css">

    <title>행사 달력</title>
    
<%
// request에서 dto 객체를 가져옵니다.
seoulmate.board.BoardDTO dto = (seoulmate.board.BoardDTO) request.getAttribute("dto");
%>
    
  </head>
  <body>

	<div class="content" style="background-color:#EEF7FF;">
		<div id='calendar'></div>
	</div>

	<script src="../calendar/js/jquery-3.3.1.min.js"></script>
	<script src="../calendar/js/popper.min.js"></script>
	<script src="../calendar/js/bootstrap.min.js"></script>

	<script src='../calendar/fullcalendar/packages/core/main.js'></script>
	<script src='../calendar/fullcalendar/packages/interaction/main.js'></script>
	<script src='../calendar/fullcalendar/packages/daygrid/main.js'></script>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : [ 'interaction', 'dayGrid' ],
				defaultDate : '2024-06-12',
				editable : true,
				eventLimit : true, // allow "more" link when too many events are at the same day.
				events : [ {
					title : '오늘행사',
					start : '2024-06-18'
				}, {
					title : 'Long Event',
					start : '2024-06-17',
					end : '2024-06-20'
				}, {
					groupId : 999,
					title : 'Repeating Event',
					start : '2024-06-03T16:00:00'
				}, {
					groupId : 999,
					title : 'Repeating Event',
					start : '2024-06-03T16:00:00'
				}, {
					title : 'Conference',
					start : '2024-06-11',
					end : '2024-06-13'
				}, {
					title : 'Meeting',
					start : '2024-06-11T10:30:00',
					end : '2024-06-11T12:30:00'
				}, {
					title : 'Lunch',
					start : '2024-06-11T12:00:00'
				}, {
					title : 'Meeting',
					start : '2024-06-11T14:30:00'
				}, {
					title : 'Happy Hour',
					start : '2024-06-11T17:30:00'
				}, {
					title : 'Dinner',
					start : '2024-06-02T20:00:00'
				}, {
					title : 'Birthday Party',
					start : '2024-06-19T07:00:00'
				}, {
					title : 'Click for Google',
					url : 'http://google.com/',
					start : '2024-06-07'
				} ]
			});

			calendar.render();
		});
	</script>

	<script src="../calendar/js/main.js"></script>
</body>
</html>