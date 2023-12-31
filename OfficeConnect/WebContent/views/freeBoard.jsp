<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="util.TransEmpInfo"%>
<%@page import="util.SessionEmpInfo"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<BoardVO> list = (ArrayList<BoardVO>) request.getAttribute("boardList");
	String empNo = (String)session.getAttribute("empNo");
	EmpVO sessionVO = SessionEmpInfo.getInstance().getEmpVO(empNo);
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

<title>자유게시판</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<style>
#dataTable_wrapper {
	overflow-x: hidden;
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
					<h1 class="h3 mb-2 text-gray-800">&nbsp;&nbsp;자유게시판</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">모든 등급의 인원이 작성
								가능합니다.</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr role="row">
											<th class="sorting sorting_asc" tabindex="0"
												aria-controls="dataTable" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="번호: activate to sort column descending"
												style="width: 100.203px;">번호</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="제목: activate to sort column ascending"
												style="width: 587.844px;">제목</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="작성자: activate to sort column ascending"
												style="width: 315.25px;">작성자</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="작성일: activate to sort column ascending"
												style="width: 305.703px;">작성일</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="조회수: activate to sort column ascending"
												style="width: 305.703px;">조회수</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (BoardVO vo : list) {
										%>

										<tr>
											<td><%=vo.getBrdNo()%></td>
											<td><a
												href="<%=request.getContextPath()%>/board/detail.do?brdNo=<%=vo.getBrdNo()%>"><%=vo.getBrdTitle()%></a></td>	
											<td>
											<a href="<%=request.getContextPath()%>/board/selectOne.do?empNo=<%=vo.getEmpNo()%>"><%=transfer.transformDeptCode(vo.getDeptCode())%>&nbsp;&nbsp;<%=vo.getEmpPosit()%>&nbsp;&nbsp;<%=vo.getEmpName()%></a>
											 
											</td>
											
											
											<td><%=vo.getBrdDateDisplay()%></td>
											<td><%=vo.getBrdViews()%></td>
									
										</tr>

										<%
											}
										%>
									</tbody>
								</table>
								<a href="#" class="btn btn-primary btn-icon-split"
									style="position: absolute; margin-left: 89%; margin-top: -3%">
									<span class="icon text-white-50"> <i
										class="fa-solid fa-pen"></i>
								</span> <span class="text"  onclick="location.href='<%=request.getContextPath()%>/board/insert.do'">글작성</span>
								</a>
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
	<script src="../vendor/datatables/jquery.dataTables.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
	<script src="../js/demo/datatables-demo.js"></script>
	<script>

	</script> 

</body>

</html>