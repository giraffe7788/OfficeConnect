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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<%
 		List<MeetingVO> mtrList = (List<MeetingVO>)request.getAttribute("mtrList");
		//Map<> roomMap = ()request.getAttribute("roomMap");
		String currentEmpNo = (String)request.getAttribute("empNo");
	%>
	
</head>
<body>
	<div id="meetingroom">
		<h6 id="mtrh">회의실 예약</h6>
		<div id="room">
			<h3 id="mtrh2">회의실</h3>
			<button type="button" class="btn" value="101">회의실1</button>
			<button type="button" class="btn" value="105">회의실2</button>
			<button type="button" class="btn" value="201">회의실3</button>
			<button type="button" class="btn" value="301">회의실4</button>
			<button type="button" class="btn" value="401">회의실5</button>
			
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
					        <select name="mtrbookPer">
					        	<option value="1">1
					        	<option value="2">2
					        	<option value="3">3
					        	<option value="4">4
					        	<option value="5">5
					        	<option value="6">6
					        	
					        <%-- <%
					        	for(int i = 0; i < roomMap.get("회의실번호"); i++){
					        %>
					        		<option value="<%=i%>"><%=i%>
					        <%
					        	}
					        %> --%>
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

		</div>
	</div>

<script>
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

	// 해당 회의실 제한 인원 적용
	// 서버에서 데이터를 가져옵니다. 여기에서는 AJAX를 사용합니다.
    /* $.ajax({
      url: '/book.do', // 데이터를 가져올 서버 측 스크립트 URL
      method: 'GET',
      dataType: 'json',
      success: function(data) {
        // 데이터를 성공적으로 가져왔을 때 처리
        if (data.length > 0) {
          // 옵션 항목을 동적으로 생성합니다.
          var select = $('#selectOptions');
          select.empty(); // 기존 옵션 항목 삭제

          $.each(data, function(index, item) {
            var option = $('<option>');
            option.val(item.value);
            option.text(item.label);
            option.appendTo(select);
          });
        } else {
          // 데이터가 없을 경우 처리
          $('#selectOptions').html('<option value="">데이터가 없습니다.</option>');
        }
      },
      error: function() {
        // 오류가 발생했을 경우 처리
        $('#selectOptions').html('<option value="">데이터를 가져오는 중 오류가 발생했습니다.</option>');
      }
    }); */
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
	
	let mtrbookCont = $('[name="mtrbookCont"]').val();
	let mtrbookRent = $('[name="mtrbookRent"]').val();
	let mtrbookRtn = $('[name="mtrbookRtn"]').val();
	let mtrbookPer = $('[name="mtrbookPer"]').val();
	
	$.ajax({
		url: "book.do",
		type: "post",
		data: { 'mtrNo': mtrNo,
			    'mtrbookPer' : mtrbookPer,
			    'mtrbookRent' : mtrbookRent, 
			    'mtrbookRtn' : mtrbookRtn, 
			    'mtrbookCont' : mtrbookCont},
			    
		success: function(res){		
			
			// 9시 이상 예약 가능하게
			if(parseInt(mtrbookRtn, 10) < parseInt(mtrbookRent, 10)){
				alert("시작 이전 시간은 예약 불가능합니다.");
				return;
			}
			
			// 회원당 예약은 한번만
			<%
			for(MeetingVO mvo : mtrList){
				//System.out.println(mvo.getEmpNo()+ "==" +currentEmpNo);
			%>
				if(<%=mvo.getEmpNo()%> == <%=currentEmpNo%>){
			
					alert("회의실은 인당 1번만 예약 가능합니다");
					return;
				}
			<%
			}
			%>
			
			// 예약된 시간엔 예약 안되게
			<%
			for(MeetingVO mvo : mtrList){
			%>
				if( <%=mvo.getMtrNo() %> == mtrNo ){
					if( <%=mvo.getMtrbookRent() %> == mtrbookRent
						&& <%=mvo.getMtrbookRtn() %> == mtrbookRtn){
						alert("이미 예약된 시간입니다.");
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



