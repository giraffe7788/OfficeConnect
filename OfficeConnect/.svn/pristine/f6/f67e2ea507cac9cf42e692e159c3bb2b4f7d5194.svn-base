<%@page import="vo.MeetingRoomVO"%>
<%@page import="vo.MeetingBookVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page contentType="text/html; charset=UTF-8"%> --%>
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
      List<MeetingBookVO> mtrList = (List<MeetingBookVO>)request.getAttribute("mtrList");
      List<MeetingRoomVO> roomList = (List<MeetingRoomVO>)request.getAttribute("roomList");
      String currentEmpNo = (String)request.getAttribute("empNo");
   %>
   
</head>
<body>
   <div id="meetingroom">
      <h6 id="mtrh">회의실 예약</h6>
      <div id="room">
         <h3 id="mtrh2">회의실</h3>
         <button type="button" class="btn" value="1">회의실1</button>
         <button type="button" class="btn" value="2">회의실2</button>
         <button type="button" class="btn" value="3">회의실3</button>
         <button type="button" class="btn" value="4">회의실4</button>
         <button type="button" class="btn" value="5">회의실5</button>
         
         <div id="modal" class="modal fade" role="dialog">
             <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">회의실 예약</h4>
                 </div>
               
               <div class="modal-body">
                 <div class="mtrNO">
                    <label class="control-label">회의실</label>
                 </div>
                 
                 <form class="reservation">
                    <div class="form-group">
                     <label class="control-label">회의 내용</label>
                       <textarea name="mtrbookCont" rows="5" cols="50"></textarea>
                   </div>
                   
                   <div class="form-group">
                     <label class="control-label">예약 시간</label>
                       <select name="mtrbookRent">
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
                     <select name="mtrbookRtn">
                          <option class="time" value="10">10
                          <option class="time" value="11">11
                          <option class="time" value="12">12
                          <option class="time" value="13">13
                          <option class="time" value="14">14
                          <option class="time" value="15">15
                          <option class="time" value="16">16
                          <option class="time" value="17">17
                          <option class="time" value="18">18
                     </select>
                     <span>: 00</span>                     
                   </div>

                   <div class="form-group">
                     <label class="control-label">회의 인원</label>
                      <select id="mtrbookPer">
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
       initialView: 'timeGridDay',
//        headerToolbar: {
//          left: 'prev,next today',
//          center: 'title',
//          right: 'timeGridWeek,timeGridDay'
//        },
       hiddenDays: [0, 6],
       slotDuration: '00:30',
       slotMinTime: '09:00',
       slotMaxTime: '18:00',
//        events: '/api/demo-feeds/events.json'
        events: [
//           {
//             title  : '회의1',
//             start  : '2023-09-14T09:00:00',
//             end      : '2023-09-14T11:00:00'
//           },
//           {
//             title  : '회의2',
//             start  : '2023-09-11T13:00:00',
//             end    : '2023-09-11T14:00:00'
//           },
//           {
//             title  : '회의3',
//             start  : '2023-09-15T12:00:00',
//             end    : '2023-09-15T14:00:00'
// //             allDay : false // will make the time show
//           }
        ]
     });

     calendar.render();
   });
//    $('#calendar').fullCalendar('render');

/*
   회의실 클릭 시 모달창 팝업
 */   
let mtrNo = "";
$('.btn').on('click', function(){
   // 해당 회의실 번호 적용
   mtrNo = $(this).val();
   let mtrNoT = "<span>";
   mtrNoT += mtrNo;
   mtrNoT += "</span>";
   $('.mtrNO').append(mtrNoT);
      
   // 배경색 설정
   $('#modal').modal({
      backdrop : 'static'
   });
   
   
   // select 엘리먼트에 대한 참조를 가져옵니다.
   var selectElement = document.getElementById("mtrbookPer");
   while (selectElement.options.length > 0) {
       selectElement.remove(0);
   }
   
   let index = 0;
   if(mtrNo == 1){
      index = <%=roomList.get(0).getMtrPer()%>;
   } else if(mtrNo == 2){
      index = <%=roomList.get(1).getMtrPer()%>;
   } else if(mtrNo == 3){
      index = <%=roomList.get(2).getMtrPer()%>;
   } else if(mtrNo == 4){
      index = <%=roomList.get(3).getMtrPer()%>;
   } else if(mtrNo == 5){
      index = <%=roomList.get(4).getMtrPer()%>;
   }
   
   // 해당 회의실 제한 인원 적용   
   for(let j = 1; j <= index; j++){
         
         // 새로운 option 엘리먼트를 생성합니다.
         var option = document.createElement("option");

         // option 엘리먼트의 속성을 설정합니다.
         option.value = j;
         option.text = j;

         // select 엘리먼트에 새 option 엘리먼트를 추가합니다.
         selectElement.appendChild(option);
      }
});


/* 
   모달창-'X' 버튼 클릭
*/
$('.close').on('click', function(){
   // 회의실 번호 초기화
   $('.mtrNO span').empty();
});

/* 
   모달창-'예약' 버튼 클릭
*/
$('.btn_book_out').on('click', function(){
   
   let mtrbookRent = $('[name="mtrbookRent"]').val();
   let mtrbookRtn = $('[name="mtrbookRtn"]').val();
   let mtrbookPer = $('[id="mtrbookPer"]').val();
   let mtrbookCont = $('[name="mtrbookCont"]').val();
   
   $.ajax({
      url: "book.do",
      type: "post",
      data: { 'mtrNo': mtrNo,
             'mtrbookPer' : mtrbookPer,
             'mtrbookRent' : mtrbookRent, 
             'mtrbookRtn' : mtrbookRtn, 
             'mtrbookCont' : mtrbookCont},
             
      success: function(res){   
         // 시간표 반영
         
         // 9시 이상 예약 가능하게
         if(parseInt(mtrbookRtn, 10) < parseInt(mtrbookRent, 10)){
            alert("시작 이전 시간은 예약 불가능합니다.");
            return;
         }
         
         // 회원당 예약  한번만
         <%for(MeetingBookVO mvo : mtrList){
            System.out.println(mvo.getEmpNo()+ "==" +currentEmpNo);%>
            if(<%=mvo.getEmpNo()%> == <%=currentEmpNo%>){
               alert("회의실은 인당 1번만 예약 가능합니다");
               return;
            }
         <%}%>
         
         // 예약된 시간엔 예약 안되게
         <%for(MeetingBookVO mvo : mtrList){%>
         // 같은 회의실이면 시작끝 시간 겹쳐도 안되고 시작 시간 겹쳐도 안되고 끝시간 겹쳐도 안되고 그 사이 시간도 겹치면 안됨
            if( <%=mvo.getMtrNo() %> == mtrNo ){
               if( <%=mvo.getMtrbookRent() %> == mtrbookRent && <%=mvo.getMtrbookRtn() %> == mtrbookRtn){
                  alert("이미 예약된 시간입니다.");
                  return;
               }else if(<%=mvo.getMtrbookRent()%> < mtrbookRent && <%=mvo.getMtrbookRtn() %> > mtrbookRtn ){
                  alert("이미 예약된 시간입니다.");
                  return;
               }else if(<%=mvo.getMtrbookRent() %> == mtrbookRent){
                  alert("이미 예약된 시작시간입니다.");
                  return;
               }else if(<%=mvo.getMtrbookRtn() %> == mtrbookRtn){
                  alert("이미 예약된 종료시간입니다.");
                  return;
               }
            }
         <%
         }
         %>
         
         if(res.isSuccess == "ok"){
            alert("회의실 예약이 완료되었습니다");
         } else {
            alert("회의실 예약이 실패하였습니다")
         }
         location.href = "/OfficeConnect/list.do";
      },
      error: function(xhr, status, msg){
         console.log("상태값: " + status + " Http 에러 메시지: " + msg);
      }
   });   
   
});


</script>
</body>
</html>

