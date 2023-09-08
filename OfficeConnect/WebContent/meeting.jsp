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
			<button type="button" class="btn">회의실1</button>
			<button type="button" class="btn">회의실2</button>
			<button type="button" class="btn">회의실3</button>
			<button type="button" class="btn">회의실4</button>
			<button type="button" class="btn">회의실5</button>
			
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
	        			<input type="text" id="mtroom">
	        		</div>
	        		
	        		<form class="reservation">
	        			<div class="form-group">
					      <label class="control-label">회의 내용</label>
					        <textarea name="content" rows="5" cols="50"></textarea>
					    </div>
					    
					    <div class="form-group">
					      <label class="control-label">예약 시간</label>
					        <select name="time">
						        
							</select>
					    </div>

					    <div class="form-group">
					      <label class="control-label">회의 인원</label>
					        <select name="person">
						        <option value="1">1
						        <option value="2">2
						        <option value="3">3
							</select>
					    </div>
					    
	        		</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button">예약</button>
	      		</div>
	    	    </div>
			  </div>
		    </div>
		</div>
		
		<div id="reservation">
			<h3 id="mtrh3">예약현황</h3>
			<button type="button" id="res">나의 예약</button>
			
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
<%
	if(mtrList.size() == 0) {
%>
						<td></td>
<%
	}else {
		
		for(MeetingVO mv : mtrList) {
%>
						<td><%=mv.getEmpNo() %></td>
<%
		}
	}
%>
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
					</tr>
				</table>
			</div>
		</div>
	</div>

<script>

$('.btn').on('click', function(){
	$('#modal').modal({
		backdrop : 'static'
	});
});

$('.modal-footer button').on('click', function(){

});

</script>
</body>
</html>



