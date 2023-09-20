<%@page import="vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<EmpVO> empList = (List<EmpVO>) request.getAttribute("empList");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>사원조회</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<style>
table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

td {
	white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
	overflow: hidden; /* 셀 내부 넘치는 내용 숨김 */
	text-overflow: ellipsis; /* 셀 내용이 넘칠 때 "..."으로 표시 */
	max-width: 100px; /* 셀 내용의 최대 너비 설정 (원하는 너비로 조정) */
}
</style>

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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4"
						style="margin-top: 8%">
						<h1 class="h3 mb-0 text-gray-800" style="margin-left: 45%">사원조회</h1>
					</div>

					<!-- Content Row -->
					<div class="row" style="justify-content: center">

						<!-- Content Column -->
						<div class="col-lg-3 mb-4">

							<nav class="navbar navbar-expand navbar-light bg-primary mb-4"
								style="border-radius: 0.35rem">
								<a class="navbar-brand" href="#" style="font-size: 1em"><div
										class="text-white shadow" id="department">부서선택</div></a>
								<ul class="navbar-nav ml-auto">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> </a>
										<div
											class="dropdown-menu dropdown-menu-right animated--grow-in"
											aria-labelledby="navbarDropdown" id="dropdown-department"
											style="text-align: center">
											<a class="dropdown-item" href="#" id="dropdown-100"
												data-value="dept100">개발부</a> <a class="dropdown-item"
												href="#" id="dropdown-200" data-value="dept200">디자인부</a> <a
												class="dropdown-item" href="#" id="dropdown-300"
												data-value="dept300">인사부</a> <a class="dropdown-item"
												href="#" id="dropdown-400" data-value="dept400">총무부</a> <a
												class="dropdown-item" href="#" id="dropdown-500"
												data-value="dept500">기획부</a> <a class="dropdown-item"
												href="#" id="dropdown-600" data-value="dept600">사업부</a>
										</div></li>
								</ul>
							</nav>

							<!-- 사원 목록 출력부분 -->
							<!-- 							<span id="span">부서를 선택해주세요.</span> -->
							<div class="card shadow mb-4">
								<div class="card-body">
									<span id="emptyDept">부서를 선택해주세요</span>
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0" style="margin-top: 6%; display: none;">
										<thead>
											<tr role="row">
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 50%;">직급</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 50%;">이름</th>
											</tr>
										</thead>
										<%
											for (int j = 1; j <= 6; j++) {
										%>
										<tbody id=dept<%=j%>00>
											<%
												for (int i = 0; i < empList.size(); i++) {
												if (empList.get(i).getDeptCode() == 100 * j) {
											%>

											<tr>
												<td><%=empList.get(i).getEmpPosit()%></td>
												<td><a id="empName" href="#"
													onclick="empChart('<%=empList.get(i).getEmpNo()%>');"><%=empList.get(i).getEmpName()%></a></td>
											</tr>
											<%
												}
											}
											%>
										</tbody>
										<%
											}
										%>
									</table>
								</div>
							</div>

							<!-- 							<div>부서를 선택해 주세요.</div> -->

						</div>

						<div class="col-lg-6 mb-4">

							<!-- 사원 클릭시 오른쪽에 뜨는 정보 -->
							<!-- 아직 클릭되지 않았다면 이름을 클릭해서 정보를 조회하실 수 있습니다 출력 -->
							<div class="card shadow mb-4" id="empInfo">
								<div class="card-body" style="text-align: center;">
									<span id="emptyEmp">사원을 선택해주세요</span>
									<div class="table-responsive" id="empTable"
										style="position: relative; display: flex; height: 100%; margin-top: 20px; display: none;">

										<div class="image-wrapper"
											style="width: 60%; margin-left: 7%">
											<img src="../images/defaultProfile.PNG" alt="기본프로필"
												style="width: 40%; margin-left: 40%; margin-top: 2%"
												id="divEmpImg">
										</div>
										<div class="table-wrapper" style="width: 100%">
											<div
												style="text-align: center; font-size: 1.5em; margin-top:2%">
												<div id="divEmpDept">부서</div>
												<div id="divEmpPosit">직급</div>
												<div id="divEmpName">이름</div>
												<div id="divEmpTel">전화번호</div>
												<div id="divEmpState">업무상태</div>
											</div>
										</div>

									</div>
								</div>
								<div style="margin-left: 30%; margin-bottom: 5%">
									<a href="./views/mailWrite.jsp"
										class="btn btn-primary btn-icon-split"
										style="margin-right: 5%; width: 27%"> <span class="text"
										style="color: #fff">메일작성</span> <a href="#기안작성"
										class="btn btn-primary btn-icon-split" style="width: 27%">
											<span class="text" style="color: #fff">기안작성</span>
									</a>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!-- 메인 Content 끝 -->

			</div>
			<!-- Content Wrapper 끝 -->

		</div>
		<!-- 페이지 Wrapper 끝 -->

		<!-- 공통속성 설정 include -->
		<%@ include file="./common.jsp"%>
		<script src="../vendor/jquery/jquery.min.js"></script>
		<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script>
			$('#exampleModal').on('show.bs.modal', function(event) {
				// 드롭다운 값에 따라 부서별 회원들이 쫙 나와야함
				var button = $(event.relatedTarget)
				var recipient = button.data('whatever')

				var modal = $(this)
				modal.find('.modal-title').text('정보수정')
				modal.find('.modal-body input').val(recipient)
			})

			$('#dropdown-department a').click(function() {
				var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기

				// 업무상태 수정 해야함
				$('#department').text(selectedText); // navbar-brand의 텍스트 변경
			});
			
			// 드롭다운 요소와 표의 tbody 요소들을 가져옵니다.
		    const departmentDropdown = document.getElementById('dropdown-department');
		    const tbodyElements = document.querySelectorAll('tbody');

		    // 드롭다운에서 항목이 선택될 때 호출될 함수를 정의합니다.
		    function handleDropdownChange(event) {
		    	
		    	$('#emptyDept').css('display', 'none');
		    	
		    	
		        const selectedDepartmentId = event.target.id; // 선택한 항목의 ID를 가져옵니다.
		        
		        const tableId = document.getElementById(selectedDepartmentId);
		        const customData = tableId.getAttribute('data-value');
		        
		        // 모든 tbody 요소를 숨깁니다.
		        tbodyElements.forEach(tbody => {
		            tbody.style.display = 'none';
		        });

		        // 선택한 부서에 해당하는 tbody 요소를 보이게 합니다.
		        const selectedTbody = document.getElementById(customData);
		        console.log(selectedTbody);
		        selectedTbody.style.display = 'table-row-group';
		    }

		    // 드롭다운 선택 이벤트를 듣고 핸들러 함수를 호출합니다.
		    departmentDropdown.addEventListener('click', handleDropdownChange);
		    
		    let empNo;
		    function empChart(empNo){
		    	
		    	
		    	$('#emptyEmp').css('display', 'none')
		    	$('#empTable').css('display', 'block');
		    	
		    	$.ajax({
		    		
		    		url: '../emp/chart.do',
		    		type: 'post',
		    		data: {empNo: empNo},
		    		
		    		success:function(data){
		    			
		    			$("#divEmpName").text(data.empName);
		    			$('#divEmpPosit').text(data.empPosit);
		    			$('#divEmpTel').text(data.empTel);
		    			$('#divEmpDept').text(data.empDept);
		    			$('#divEmpState').text(data.empState);
		    			$('#divEmpImg').attr('src', data.imgPath+data.imgName);
		    		
		    		},
		    		error:function(xhr){
		    			
		    			alert("에러? " + xhr.status);
		    		},
		    		
		    		dataType: 'json'
		    		
		    	});
		    	
			}
		    
		    $(document).ready(function () {

		    	  // 버튼 클릭 이벤트를 처리합니다.
		    	  $("#dropdown-department").click(function () {
		    	    var table = $('#dataTable');
		    	    
		    	    // 테이블을 보이거나 숨기는 토글 기능을 수행합니다.
		    	    if (table.is(':hidden')) {
		    	      	table.show(); // 테이블을 보이게 설정합니다.
		    	    } 
		    	  });
		    	});

			$(document).ready(function() {
				
  			  $("#empName").click(function() {
  				  var table = $('#empTable')
  				  
  				  if(table.is(':hidden')){
  					  
  					$('#emptyEmp').css('display', 'none');
  					  
  					  table.show();
  				 	 }
  				  
 					});
				});
		    
		</script>
</body>
</html>