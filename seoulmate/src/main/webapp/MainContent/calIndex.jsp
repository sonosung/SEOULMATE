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
	
	    <!-- Your main.js for custom JavaScript -->
    <script src="../calendar/js/main.js"></script>
</head>
<body>
    <div class="content" style="background-color:#EEF7FF;">
        <div id='calendar'></div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        $.ajax({
            type: 'POST',
            url: 'calIndex.do',
            dataType: 'json',
            success: function(response) {
                var events = response; // 서버에서 받은 JSON 데이터

                var calendar = new FullCalendar.Calendar(calendarEl, {
                    plugins: ['interaction', 'dayGrid'],
                    editable: true,
                    eventLimit: true,
                    events: events.map(function(eventData) {
                        return {
                            title: eventData[0],   // 이벤트 제목
                            start: eventData[1],   // 시작 날짜
                            end: eventData[2],     // 종료 날짜
                            url: 'http://localhost:8081/seoulmate/fesview.do?idx=' + eventData[3]  // 이벤트 클릭 시 링크
                        };
                    })
                });

                calendar.render();  // 달력 렌더링
            },
            error: function(xhr, status, error) {
                console.error('AJAX 오류:', error);
            }
        });
    });

    </script>
		

</body>
</html>