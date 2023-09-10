<%@page import="vo.MeetingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page contentType="text/html; charset=UTF-8"%> --%>
<%@ include file="./frame.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 예약</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/frame.css">
<link rel="stylesheet" href="css/meeting.css">

<link href='fullcalendar/main.css' rel='stylesheet' />
<script src='fullcalendar/main.js'></script>
    
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<%
 		List<MeetingVO> mtrList = (List<MeetingVO>)request.getAttribute("mtrList");
	%>
	
</head>
<body>
	<div id="meetingroom">
		<h6 id="mtrh">회의실 예약</h6>
		<div id="room">
			<h3 id="mtrh2">회의실</h3>
			<button type="button" class="btn" value="105">회의실1</button>
			<button type="button" class="btn" value="106">회의실2</button>
			<button type="button" class="btn" value="201">회의실3</button>
			<button type="button" class="btn" value="203">회의실4</button>
			<button type="button" class="btn" value="304">회의실5</button>
			
			<div id="modal" class="modal fade" role="dialog">
	  		  <div class="modal-dialog">
			    <div class="modal-content">
	      		  <div class="modal-header">
	        	    <button type="button" class="close" data-dismiss="modal">&times;</button>
	        		<h4 class="modal-title">회의실 예약</h4>
	      		  </div>
	      		
	      		<div class="modal-body">
	        		<div>
	        			<label class="control-label">회의실</label>
	        		</div>
	        		
	        		<form class="reservation">
	        			<div class="form-group">
					      <label class="control-label">회의 내용</label>
					        <textarea name="mtrB_Cont" rows="5" cols="50"></textarea>
					    </div>
					    
					    <div class="form-group">
					      <label class="control-label">예약 시간</label>
					        <select name="mtrB_Rent1">
						        <option value="9">9
						        <option value="10">10
						        <option value="11">11
						        <option value="12">12
						        <option value="13">13
						        <option value="14">14
						        <option value="15">15
						        <option value="16">16
						        <option value="17">17
							</select>
							<span>: 00 ~ </span>
							<select name="mtrB_Rent2">
						        <option value="1">9
						        <option value="10">10
						        <option value="11">11
						        <option value="12">12
						        <option value="13">13
						        <option value="14">14
						        <option value="15">15
						        <option value="16">16
						        <option value="17">17
							</select>
							<span>: 00</span>
					    </div>

					    <div class="form-group">
					      <label class="control-label">회의 인원</label>
					        <select name="mtrB_Per">
						        <option value="1">1
						        <option value="2">2
						        <option value="3">3
							</select>
					    </div>
					    
	        		</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button class="btn_book_out" type="button">예약</button>
	      		</div>
	    	    </div>
			  </div>
		    </div>
		</div>
		
		<div id="reservation">
			<h3 id="mtrh3">예약현황</h3>
			<button class="btn_book_in" type="button" id="res">나의 예약</button>
			
<!--     <div id='calendar'></div> -->
    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div id="calendar" class="app-fullcalendar"></div>
                            </div>
                        </div>
                    </div>
    <script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "dc4641f860664c6e824b093274f50291"}'></script>

		</div>
	</div>

<script>

document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
		locale: 'ko',
        lang: 'ko',
	    timeZone: 'UTC',
	    initialView: 'timeGridWeek',
	    headerToolbar: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'timeGridWeek,timeGridDay'
	    },
	    hiddenDays: [0, 6],
	    slotDuration: '00:30',
	    slotMinTime: '09:00',
	    slotMaxTime: '18:00',
// 	    events: '/api/demo-feeds/events.json'
		  events: [
// 		    {
// 		      title  : '회의1',
// 		      start  : '2023-09-14T09:00:00',
// 		      end  	 : '2023-09-14T11:00:00'
// 		    },
// 		    {
// 		      title  : '회의2',
// 		      start  : '2023-09-11T13:00:00',
// 		      end    : '2023-09-11T14:00:00'
// 		    },
// 		    {
// 		      title  : '회의3',
// 		      start  : '2023-09-15T12:00:00',
// 		      end    : '2023-09-15T14:00:00'
// // 		      allDay : false // will make the time show
// 		    }
		  ]
	  });

	  calendar.render();
	});
// 	$('#calendar').fullCalendar('render');

/*  */

let rmNm = "";
/*
	나의예약 클릭 시 모달창 팝업-배경색 설정
 */	

$('.btn').on('click', function(){
	rmNm = $(this).val();
	$('#modal').modal({
		backdrop : 'static'
	});
});

/* 
	모달창-X버튼 클릭 시 
 	: 입력한 회의실 정보 예약창으로 보내기
*/
$('.btn_book_out').on('click', function(){
	bookUrl = $(this).val();
	//console.log(bookUrl);
	$.ajax({
		url: bookUrl + ".json",
		type: "GET",
		contentType: 'application/json; charset=utf-8',
		dataType: 'json',
		success: function(res){
			showList(res);
		},
		error: function(xhr, status, msg){
			console.log("상태값: " + status + " Http 에러 메시지: " + msg);
		}
	});	
	
	function showList(data){
		let timeList = '';
		$('#modal').empty();
		let head = '<span>' + bookUrl + '</sapn>';
		$('modal-body').append(head);
		$.each(data, function(idx, item){
			timeList = '<tr>';
			timeList += '<td>' + item.idx + '</td>';
			timeList += '<td>' + item.time + '</td>';
			timeList += '</tr>';
			$(".modal-body").append(timeList);
		})
	}
});

</script>
</body>
</html>



