<%@page import="util.TransEmpInfo"%>
<%@page import="vo.ReviewVO"%>
<%@page import="vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>인사관리-근무태도평가</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<%
	List<EmpVO> empList = (List<EmpVO>) request.getAttribute("empList");
	EmpVO empVO = (EmpVO)request.getAttribute("empVO");
	SessionEmpInfo info = SessionEmpInfo.getInstance();
	String empNo = (String)request.getAttribute("empNo");
%>
</head>

<body id="page-top">

	<!-- 페이지 Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 include -->
		<%@ include file="./aside.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 Content -->
			<div id="content">

				<!-- 헤더 include -->
				<%@ include file="./header.jsp"%>

				<!-- 페이지 Content 시작 -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h3 class="h3 mb-2 text-gray-800" style="width: 80%; margin: auto; text-align: center;">&nbsp;&nbsp;인사관리</h3>
					
					<hr style="width: 80%; margin: auto; text-align: center;" >

					<!-- DataTales Example -->
					<div class="card shadow mb-4" style="width: 80%; margin: auto; margin-top: 25px;">
						<div class="card-body" style="padding-top: 40px; padding-bottom: 40px;">

							<div class="row" style="border-right: 1px solid #858796;">
								<div class="col-lg-2">

									<button type="button" class="btn btn-light btn-icon-split"
										style="border: none; background-color: transparent; color: #858796; margin-bottom: 15px; width: 150px; font-size: 1.3rem;">
										<b>근무태도평가</b>
									</button>


<!-- 									<button type="button" onClick="window.location.href='reviewCheck.jsp'" class="btn btn-light btn-icon-split" -->
									<button type="button" onClick="window.location.href='../review/list.do'" class="btn btn-light btn-icon-split"
										style="border: none; background-color: transparent; color: #858796; width: 150px; font-size: 1.3rem;">
										<b>평가결과조회</b>
									</button>

								</div>

								<div class="col-lg-10" style="border-left: 1px solid #858796;">

									<h4 class="h4 mb-2 text-gray-800">근무태도평가</h4>
									<hr>


									<div style="margin-bottom: 10px;">
										<b>평가자 :</b> <%=empVO.getEmpName() %>
									</div>

									<div style="margin-bottom: 10px;">
										<b>피평가자정보</b>
									</div>

									<form onsubmit="insertEmpInfo(event)">
									<div style="margin-bottom: 10px;">
												<select id="selectEmp">
													<option value = '' selected>사원 선택</option>
													<%
														for(EmpVO evo : empList){
													%>
														<option value=<%=evo.getEmpNo() %>><%=evo.getEmpNo()%>&nbsp;&nbsp;<%=evo.getEmpName()%></option>
													<%		
														}
													%>
												</select>
										<button type="submit" id="check" class="btn btn-Light" style="margin-bottom: 5px;">&nbsp;확인&nbsp;</button></div>
										<div class="table-responsive">
											<div class="table-wrapper">

												<table class="table table-bordered" style="width: 70%; text-align: center;">
													<tr>
														<th>성명</th>
														<th>직위</th>
														<th>부서</th>
													</tr>
													<tr>
														<td id="empName"></td>
														<td id="empPosit"></td>
														<td id="empDept"></td>
													</tr>

												</table>

											</div>

										</div>

										<hr>

									</form>

									<div style="margin-bottom: 10px;">
										<b>평가 항목 체크</b>
									</div>

									<form action="" style="width: 100%; text-align: right;">
									
										<div class="table-responsive">
                                 <div class="table-wrapper" style="text-align: right;">

                                    <table class="table table-bordered" style="width: 100%; text-align: center;">
                                       <tr>
                                          <th rowspan="2" style="vertical-align: middle;">근무태도</th>

                                          <th>책임감</th>
                                          <th>주도성</th>
                                          <th>협동심</th>
                                          <th>창의성</th>
                                       </tr>
                                       <tr>
                                          <td style="padding: 0">
                                          <select class="form-select" id="resScore" aria-label="Default select example" style="width: 100%; height:48px; border: none; text-align: center;">
                                                <option value="5">5</option>
                                                <option value="4">4</option>
                                                <option value="3">3</option>
                                                <option value="2">2</option>
                                                <option value="1">1</option>
                                          </select>
                                          </td>
                                          <td style="padding: 0">
                                          <select class="form-select" id="scrScore" aria-label="Default select example" style="width: 100%; height:48px; border: none; text-align: center;">
                                               <option value="5">5</option>
                                               <option value="4">4</option>
                                               <option value="3">3</option>
                                               <option value="2">2</option>
                                               <option value="1">1</option>
                                          </select>
                                          
                                          </td>
                                          <td style="padding: 0">
                                          <select class="form-select" id="copScore" aria-label="Default select example" style="width: 100%; height:48px; border: none; text-align: center;">
                                               <option value="5">5</option>
                                               <option value="4">4</option>
                                               <option value="3">3</option>
                                               <option value="2">2</option>
                                               <option value="1">1</option>
                                          </select>                                          
                                          </td>
                                          <td style="padding: 0">
                                          <select class="form-select" id="creScore" aria-label="Default select example" style="width: 100%; height:48px; border: none; text-align: center;">
                                               <option value="5">5</option>
                                               <option value="4">4</option>
                                               <option value="3">3</option>
                                               <option value="2">2</option>
                                               <option value="1">1</option>
                                          </select>
                                          
                                          </td>
                                       </tr>

                                    </table>

                                 </div>

                              </div>
										<button type="button" id="score" class="btn btn-primary">완료</button>
									</form>

								</div>


							</div>



						</div>

					</div>

				</div>

				<!-- 페이지 Content 끝 -->

			</div>
			<!-- 메인 Content 끝 -->

		</div>
		<!-- Content Wrapper 끝 -->

	</div>
	<!-- 페이지 Wrapper 끝 -->

	<!-- 공통속성 설정 include -->

	<%@ include file="./common.jsp"%>

	<!-- 페이지 검색/조회 플러그인 -->
</body>
<script>
<%
	EmpVO selectedEmpVo = info.getEmpVO(empNo);
%>

function insertEmpInfo(event){
	
	event.preventDefault();

	var empNo = $('#selectEmp').val().split("  ")[0];
	    
    $.ajax({

    	url: "../emp/detail.do", // Java 변수 값을 반환하는 JSP 페이지
        type: "post",
        data: {"empNo" : empNo},
        success: function(res) {
            $('#empName').text(res.empName);
            $('#empDept').text(res.empDept);
            $('#empPosit').text(res.empPosit);
        },
        error: function(xhr, status, msg) {
        	console.log("상태값: " + status + " Http 에러 메시지: " + msg);
        },
        dataType : 'json'
    });
    
	$('#check').on('click', function(){
	
		$('#empName').text("<%=selectedEmpVo.getEmpName()%>");
		$('#empPosit').text("<%=selectedEmpVo.getEmpPosit()%>");
		$('#deptCode').text("<%=TransEmpInfo.getInstance().transformDeptCode(selectedEmpVo.getDeptCode())%>");
	
	});
    
	
}


$(function(){
	
	$('#score').on('click', function(){
		
		const empNo = $('#selectEmp').val().split("  ")[0];
		
		let resScore = $('[id="resScore"]').val();
		let scrScore = $('[id="scrScore"]').val();
		let copScore = $('[id="copScore"]').val();
		let creScore = $('[id="creScore"]').val();
		
		$.ajax({
			url: 'insert.do',
			type: 'post',
			data: {"resScore": resScore,
				   "scrScore": scrScore,
				   "copScore": copScore,
				   "creScore": creScore,
				   "empNo" : empNo
			},
			success: function(res){
				
				console.log('res', res);
				
				if(res.isSuccess == 'ok'){
					alert("평가 완료");
					location.reload();
				}
			},
			error: function(xhr, status, msg) {
				console.log("상태값: " + status + " Http 에러 메시지: " + msg);
			},
			dataType : 'json'
		});
	});
	
})






</script>
</html>