<%@page import="java.text.SimpleDateFormat"%>
<%@page import="util.TransEmpInfo"%>
<%@page import="vo.ApprovalVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ApprovalVO> apprList = (List<ApprovalVO>) request.getAttribute("apprList");
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
TransEmpInfo transfer = TransEmpInfo.getInstance();
SessionEmpInfo info = SessionEmpInfo.getInstance();
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

<title>결재함</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- 드롭다운 자바스크립트  -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

					<!-- 컨텐츠 헤더부분 -->
					<div class="d-sm-flex align-items-center mb-4">

						<a href="sendList.do" class="btn btn-primary btn-icon-split">
							<span class="icon text-white-50"> <i
								class="fa-solid fa-clipboard-list"></i>
						</span> <span class="text">보낸결재함</span>
						</a> <a href="send.do" class="btn btn-primary btn-icon-split"
							style="margin-left: 2%"> <span class="icon text-white-50">
								<i class="fa-solid fa-pen"></i>
						</span> <span class="text">결재작성</span>
						</a>
					</div>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<!-- 결재 본문 -->
							<div class="col-lg-12">
								<div
									style="display: inline-block; margin-right: 10px; font-size: 1.5rem;">받은
									결재함</div>
								<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
								<hr>
								<form>
									<%
										if (apprList.size() != 0) {
									%>
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr role="row">
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 10%;">결재종류</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 13.5%;">결재자1</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 13.5%;">결재자2</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 13.5%;">결재자3</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 12.5%;">기안날짜</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 10%;">결재상태</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 10%;">확인</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 10%;">결재</th>

											</tr>
										</thead>
										<tbody>
											<%
												for (ApprovalVO apprVO : apprList) {
											%>
											<tr>
												<td>
													<%
														switch (apprVO.getApprType()) {
														case 1 :
													%>기안서<%
														break;
													case 2 :
													%>연차휴가신청서<%
														break;
													case 3 :
													%>사직서<%
														break;
													}
													%>
												</td>
												<td><%=info.getApprlSeq(apprVO.getApprlNo(), 1)%></td>

												<%
													if (info.getApprlSeq(apprVO.getApprlNo(), 2) != null) {
												%>
												<td><%=info.getApprlSeq(apprVO.getApprlNo(), 2)%></td>
												<%
													} else {
												%><td>없음</td>
												<%
													}
												%>

												<%
													if (info.getApprlSeq(apprVO.getApprlNo(), 3) != null) {
												%>
												<td><%=info.getApprlSeq(apprVO.getApprlNo(), 3)%></td>
												<%
													} else {
												%><td>없음</td>
												<%
													}
												%>
												<td><%=simpleDateFormat.format(apprVO.getApprDate())%></td>
												<td><%=transfer.transferApprsCode(apprVO.getApprsCode())%></td>
												<td style="text-align: center;"><button type="button"
														onclick="openDetail(<%=apprVO.getApprNo()%>)"
														class="btn btn-primary btn-sm">확인</button></td>
												<td style="text-align: center;"><button type="button"
														onclick="doApproval(<%=apprVO.getApprNo()%>)"
														class="btn btn-primary btn-sm">결재</button></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
									<%
										} else {
									%><div>수신한 결재가 없습니다</div>
									<%
										}
									%>
								</form>
							</div>
							<!-- 받은결재 함 종료  -->

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

	<!-- 페이지 Wrapper 끝 -->

	<!-- 공통속성 설정 include -->

	<div class="modal fade" id="approvalModal" tabindex="-1" role="dialog"
		aria-labelledby="approvalModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<p style="font-size: 1.3em">결재를 진행하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="approveButton">결재
						승인</button>
					<button type="button" class="btn btn-danger" id="rejectButton">결재
						반려</button>
					<button type="button" class="btn btn-secondary" id="cancleButton"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="./common.jsp"%>
	<!-- 페이지 검색/조회 플러그인 -->
	<script src="../vendor/datatables/jquery.dataTables.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
	<script src="../js/demo/datatables-demo.js"></script>
	<!-- 페이지 검색/조회 플러그인 -->

	<script>
	
	var currentApprNo = "";
	
	function openDetail(apprNo){
		window.open("detail.do?apprNo="+apprNo, "결재상세보기", "width=650,height=1100");
	}
	
	function doApproval(apprNo){
		currentApprNo = apprNo;
        $("#approvalModal").modal("show");
	}
	
	// 결재 승인 버튼 클릭
    $("#approveButton").click(function() {
    	
    	var isFail = 'false';
    	
    	// 1. 내가 결재 가능한지 확인 -> ajax로
    	$.ajax({
		url : 'check.do',
		type : 'post',
		data : { 'apprNo' : currentApprNo },
		async: false,
		success : function(res){
			
			if(res.result == 'fail'){
				isFail = 'true';
				alert("이전 결재자의 결재가 진행되지 않았거나 이미 승인된 결재입니다");
			} else if( res.result == 'deny' ){
				isFail = 'true';
				alert("반려된 결재입니다.");
			} else if( res.result == 'done'){
				isFail = 'true';
				alert("이미 완료된 결재입니다");
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
    	})
    	
    	
		if(isFail == 'true') {
			return;
		}
		
    	// 2. 결재 진행(결재로)
    	$.ajax({
    		url : 'progress.do',
    		type : 'post',
    		data : { 'apprNo' : currentApprNo, 
    				 'approvalState' : '승인'},
    		success : function(res){
    			if(res.isSuccess == 'fail'){
    				alert("결재 승인중 오류가 발생했습니다");
    			} else if( res.isSuccess == 'ok' ){
    				alert("결재가 승인되었습니다");
    			}
    		},
    		error : function(xhr){
    			alert("상태 : " + xhr.status);
    		},
    		dataType : 'json'
        	})
        	
    	
    	// 모달창 닫기
        $("#approvalModal").modal("hide");
    });

    // 결재 반려 버튼 클릭
    $("#rejectButton").click(function() {

		var isFail = false;
    	
    	// 1. 내가 결재 가능한지 확인 -> ajax로
    	$.ajax({
		url : 'check.do',
		type : 'post',
		data : { 'apprNo' : currentApprNo },
		async: false,
		success : function(res){
			
			if(res.result == 'fail'){
				isFail = 'true';
				alert("이전 결재자의 결재가 진행되지 않았거나 이미 승인된 결재입니다");
			} else if( res.result == 'deny' ){
				isFail = 'true';
				alert("반려된 결재입니다.");
			} else if( res.result == 'done'){
				isFail = 'true';
				alert("이미 완료된 결재입니다");
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
    	})
    	
		if(isFail){
			return;
		}
    	
    	// 2. 결재 진행(결재로)
    	$.ajax({
    		url : 'progress.do',
    		type : 'post',
    		data : { 'apprNo' : currentApprNo,
    				 'approvalState' : '반려'},
    		success : function(res){
    			if(res.isSuccess == 'fail'){
    				alert("결재 반려중 오류가 발생했습니다");
    			} else if( res.isSuccess == 'ok' ){
    				alert("결재가 반려되었습니다");
    			}
    		},
    		error : function(xhr){
    			alert("상태 : " + xhr.status);
    		},
    		dataType : 'json'
        	})
        	
    	
    	// 모달창 닫기
    	$("#approvalModal").modal("hide");
    });
    
    
    $("#cancleButton").click(function() {
        $("#approvalModal").modal("hide");
    });
	</script>
</body>

</html>