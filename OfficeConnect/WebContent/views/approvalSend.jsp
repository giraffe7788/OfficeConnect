<%@page import="util.TransEmpInfo"%>
<%@page import="vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<EmpVO> empList = (List<EmpVO>) request.getAttribute("empList");
TransEmpInfo transfer = TransEmpInfo.getInstance();
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

<title>기안서작성</title>

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
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						기안서작성</h1>
					</div>

					<!-- Content Row -->
					<div class="row" style="justify-content: center">

						<div class="col-lg-5 mb-4">

							<!-- 결재 양식 들어와야되는데 일단 실험용으로 다른거 넣어봄 -->
							<div class="card shadow mb-4" id="empInfo"">
								<div class="card-body" style="height: 110vh">
									<%-- 									<%@ include file = "../form/form1.html" %> --%>
									<iframe src="../views/form/form1.html" width="100%"
										height="100%" frameborder="0" scrolling="no" id="form"></iframe>
								</div>
							</div>
						</div>

						<!-- 결재양식선택 / 결재자지정 -->

						<div class="col-lg-3 mb-4" style="margin-top: 3%">

							<nav class="navbar navbar-expand navbar-light bg-info mb-4"
								style="border-radius: 0.35rem">
								<a class="navbar-brand" href="#" style="font-size: 1em"><div
										class="text-white shadow" id="department">양식선택</div></a>
								<ul class="navbar-nav ml-auto">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> </a>
										<div
											class="dropdown-menu dropdown-menu-right animated--grow-in"
											aria-labelledby="navbarDropdown" id="dropdown-department"
											style="text-align: center">
											<a class="dropdown-item" href="#">기안서</a> <a
												class="dropdown-item" href="#">연차휴가신청서</a> <a
												class="dropdown-item" href="#">사직서</a>
										</div></li>
								</ul>
							</nav>

							<div style="margin-top: 15%; display: inline-block; width: 100%">
								<nav class="navbar navbar-expand navbar-light bg-success mb-4"
									id="seqBtn1" style="border-radius: 0.35rem">
									<a class="navbar-brand" href="#" style="font-size: 1em"><div
											class="text-white shadow" id="seq1">결재자1 지정</div></a>
									<ul class="navbar-nav ml-auto">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> </a>
											<div
												class="dropdown-menu dropdown-menu-right animated--grow-in"
												aria-labelledby="navbarDropdown" id="dropdown-seq1"
												style="text-align: center">
												<%
												for (EmpVO empVO : empList) {
												%>
												<a class="dropdown-item" href="#"><%=transfer.transformDeptCode(empVO.getDeptCode())%>&nbsp;&nbsp;<%=empVO.getEmpName()%>&nbsp;&nbsp;<%=empVO.getEmpPosit()%>&nbsp;&nbsp;<span
													class="empNoSpan" style="display: none">|<%=empVO.getEmpNo()%></span></a>
												<%
												}
												%>
											</div></li>
									</ul>
								</nav>
								<nav class="navbar navbar-expand navbar-light bg-success mb-4"
									id="seqBtn2" style="border-radius: 0.35rem">
									<a class="navbar-brand" href="#" style="font-size: 1em"><div
											class="text-white shadow" id="seq2">결재자2 지정</div></a>
									<ul class="navbar-nav ml-auto">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> </a>
											<div
												class="dropdown-menu dropdown-menu-right animated--grow-in"
												aria-labelledby="navbarDropdown" id="dropdown-seq2"
												style="text-align: center">
												<%
												for (EmpVO empVO : empList) {
												%>
												<a class="dropdown-item" href="#"><%=transfer.transformDeptCode(empVO.getDeptCode())%>&nbsp;&nbsp;<%=empVO.getEmpName()%>&nbsp;&nbsp;<%=empVO.getEmpPosit()%>&nbsp;&nbsp;<span
													class="empNoSpan" style="display: none">|<%=empVO.getEmpNo()%></span></a>
												<%
												}
												%>
											</div></li>
									</ul>
								</nav>
								<nav class="navbar navbar-expand navbar-light bg-success mb-4"
									id="seqBtn3" style="border-radius: 0.35rem">
									<a class="navbar-brand" href="#" style="font-size: 1em"><div
											class="text-white shadow" id="seq3">결재자3 지정</div></a>
									<ul class="navbar-nav ml-auto">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> </a>
											<div
												class="dropdown-menu dropdown-menu-right animated--grow-in"
												aria-labelledby="navbarDropdown" id="dropdown-seq3"
												style="text-align: center">
												<%
												for (EmpVO empVO : empList) {
												%>
												<a class="dropdown-item" href="#"><%=transfer.transformDeptCode(empVO.getDeptCode())%>&nbsp;&nbsp;<%=empVO.getEmpName()%>&nbsp;&nbsp;<%=empVO.getEmpPosit()%>&nbsp;&nbsp;<span
													class="empNoSpan" style="display: none">|<%=empVO.getEmpNo()%></span></a>
												<%
												}
												%>
											</div></li>
									</ul>
								</nav>
							</div>

							<a href="#기안작성" class="btn btn-primary btn-icon-split"
								id="submitButton"
								style="width: 35%; margin-left: 34%; margin-top: 15%"> <span
								class="text" style="color: #fff">기안작성</span>
							</a>
						</div>

					</div>

				</div>
				<!-- 메인 Content 끝 -->

			</div>
			<!-- Content Wrapper 끝 -->

		</div>

		<div id="hidden1" style="display: none"></div>
		<div id="hidden2" style="display: none"></div>
		<div id="hidden3" style="display: none"></div>
		<!-- 페이지 Wrapper 끝 -->

		<!-- 공통속성 설정 include -->
		<%@ include file="./common.jsp"%>
		<script src="../vendor/jquery/jquery.min.js"></script>
		<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script>
			$('#exampleModal').on('show.bs.modal', function(event) {
				// 드롭다운 값에 따라 부서별 회원들이 쫙 나와야함
				var button = $(event.relatedTarget)
				var recipient = button.data('whatever')

				var modal = $(this)
				modal.find('.modal-title').text('정보수정')
				modal.find('.modal-body input').val(recipient)
			})

			// 결재 양식 선택시 양식 변경
			$('#dropdown-department a').click(function() {
				var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기

				// 선택된 값에 따라 결재양식 변경
				$('#department').text(selectedText); // navbar-brand의 텍스트 변경
				if (selectedText == '연차휴가신청서') {

					$('#seqBtn2').hide();
					$('#seqBtn3').hide();

					$('#form').attr('src', '../views/form/form2.html');
				} else if (selectedText == '기안서') {

					$('#seqBtn2').show();
					$('#seqBtn3').show();

					$('#form').attr('src', '../views/form/form1.html');
				} else if (selectedText == '사직서') {

					$('#seqBtn2').show();
					$('#seqBtn3').show();

					$('#form').attr('src', '../views/form/form3.html');
				}
			});

			// 결재자 지정시 결재자 변경되도록
			$('#dropdown-seq1 a').click(function() {
				var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기
				$('#hidden1').text(selectedText)
				$('#seq1').text(selectedText.split("|")[0]); // navbar-brand의 텍스트 변경
			});
			$('#dropdown-seq2 a').click(function() {
				var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기
				$('#hidden2').text(selectedText)
				$('#seq2').text(selectedText.split("|")[0]); // navbar-brand의 텍스트 변경
			});
			$('#dropdown-seq3 a').click(function() {
				var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기
				$('#hidden3').text(selectedText)
				$('#seq3').text(selectedText.split("|")[0]); // navbar-brand의 텍스트 변경
			});

			$(function() {
				// 전송 버튼을 누르면
				$('#submitButton').click(function() {

					// form 내부의 sendDataToParent() 함수 호출
					$("#form").get(0).contentWindow.sendDataToParent();
				});
			});

			function receiveDataFromIframe(data, type) {

				var seq1 = $('#hidden1').text().split("|")[1];
				var seq2 = $('#hidden2').text().split("|")[1];
				var seq3 = $('#hidden3').text().split("|")[1];
				console.log(seq1);
				console.log(seq2);
				console.log(seq3);

				if ((seq1 == null || seq1 == "") && type == 2) {
					alert("지정되지 않은 결재자가 있습니다");
					return;
				}
				
				if ((seq1 == null || seq1 == "" || seq2 == null || seq2 == "" || seq3 == null || seq3 == "") && (type == 1 || type == 3)) {
					alert("지정되지 않은 결재자가 있습니다");
					return;
				}

				console.log("receive호출 : " + type + data);
				
				$.ajax({
					url : 'send.do',
					type : 'post',
					data : { 'seq1': seq1,
							 'seq2': seq2,
							 'seq3': seq3,
							 'data' : data,
							 'type' : type },
					success : function(res){
						
						if(res.isSuccess == 'ok'){
							alert("결재 요청이 완료되었습니다");
							location.href="sendList.do";
						} else if( res.isSuccess == 'fail' ){
							alert("결재 요청이 실패하였습니다");
						}else{
							alert("예기치못한오류");
						}
					},
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					dataType : 'json'
				})	
			}
		</script>
</body>
</html>