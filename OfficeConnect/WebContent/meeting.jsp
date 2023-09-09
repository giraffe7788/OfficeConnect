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
						        <option value="10">10
						        <option value="11">11
						        <option value="12">12
						        <option value="13">13
						        <option value="14">14
						        <option value="15">15
						        <option value="16">16
						        <option value="17">17
						        <option value="18">18
							</select>
							<span>: 00</span>
					    </div>

					    <div class="form-group">
					      <label class="control-label">회의 인원</label>
					        <select name="mtrbookPer">
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
			
			<div id="tbl">
				<table border="1">
					<tr id="time">
						<td>9</td>
						<td>10</td>
						<td>11</td>
						<td>12</td>
						<td>13</td>
						<td>14</td>
						<td>15</td>
						<td>16</td>
						<td>17</td>
						
					</tr>
					
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>

					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

<script>
let mtrNo = "";
/*
	나의예약 클릭 시 모달창 팝업-배경색 설정, 회의실 번호 뜨게
 */	

$('.btn').on('click', function(){
	mtrNo = $(this).val();
	let mtrNoT = "<span>";
	mtrNoT += mtrNo;
	mtrNoT += "</span>";
	
	$('.mtrNO').append(mtrNoT);
		
	$('#modal').modal({
		backdrop : 'static'
	});
});

/* 
	모달창-X 버튼 클릭 시 
	: 회의실 번호 초기화
*/
$('.close').on('click', function(){
	mtrNoT = "<span></span>";
	$('.mtrNO').append(mtrNoT);
	//$('.mtrNO').remove(mtrNoT);
		
});

/* 
	모달창-예약 버튼 클릭 시 
 	: 입력한 회의실 정보 예약창으로 보내기
*/
$('.btn_book_out').on('click', function(){
	
	// 시간 이상하면 ㄴ
	// 회의 내용 입력 안되면 ㄴ
	
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
			
			console.log(res.isSuccess);
			
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



