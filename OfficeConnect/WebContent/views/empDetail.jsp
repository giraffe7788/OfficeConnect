<%@page import="util.TransEmpInfo"%>
<%@page import="vo.ImageVO"%>
<%@page import="vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	EmpVO empVO = (EmpVO) request.getAttribute("ev");
	ImageVO imageVO = (ImageVO) request.getAttribute("imageVO");
	TransEmpInfo transform = TransEmpInfo.getInstance();
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

<title>관리자페이지</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../script/empDetail.js?ver=2"></script>
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
				<div class="container-fluid" style="margin-top: 5%">

					<!-- Page Heading -->
					<p class="mb-4"></p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4" style="width: 60%; margin: auto">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">사원정보조회</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive"
								style="position: relative; display: flex; height: 100%; margin-top: 20px;">
								<div class="table-wrapper" style="width: 60%;">
									<table class="table table-bordered" id="dataTable" width="60%"
										cellspacing="0">
										<tr>
											<th>이름</th>
											<td><%=empVO.getEmpName()%></td>
										</tr>
										<tr>
											<th>사원번호</th>
											<td><%=empVO.getEmpNo()%></td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td><%=empVO.getEmpPw()%></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><%=empVO.getEmpEmail()%></td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td><%=empVO.getEmpTel()%></td>
										</tr>
										<tr>
											<th>주소</th>
											<td><%=empVO.getEmpAddr()%></td>
										</tr>
										<tr>
											<th>부서</th>
											<td><%=transform.transformDeptCode(empVO.getDeptCode())%></td>
										</tr>
										<tr>
											<th>직급</th>
											<td><%=empVO.getEmpPosit()%></td>
										</tr>
										<tr>
											<th>상태</th>
											<td><%=transform.transformStateCode(empVO.getStateCode())%></td>
										</tr>
									</table>
								</div>
								<div class="image-wrapper"
									style="width: 30%; text-align: center; margin-left: 60px">
									<img src="<%=imageVO.getImgPath() + imageVO.getImgName()%>" alt="<%=imageVO.getImgPath() + imageVO.getImgName()%>"
										id="imageView" style="max-width: 51%; height: auto; margin-top: 20%"> <form enctype="multipart/form-data"><input type="file"
										href="#" class="btn btn-primary btn-icon-split" id="fileInput"
										style="margin-top: 10%;"></form>
									<a
										href="#" class="btn btn-primary btn-icon-split"
										style="margin-top: 45px;" onclick="deleteEmp()"> <span class="text"
										style="color: #fff">사원삭제</span>
									</a>
									<a
										href="../emp/list.do" class="btn btn-primary btn-icon-split"
										style="margin-top: 45px;" > <span class="text"
										style="color: #fff">목록으로</span>
									</a>

								</div>

							</div>


							<!-- 모달 시작 -->
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModal" style="margin-left: 25%">정보수정</button>

							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">정보수정</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<form onsubmit="updateEmp()">
												<div class="form-group">
													<label for="recipient-name" class="col-form-label">사번:</label>
													<span id = "empNo"><%=empVO.getEmpNo()%></span>
												</div>
												<div class="form-group">
													<label for="recipient-name" class="col-form-label">비밀번호:</label>
													<input type="text" class="form-control" id="empPw" data-default="<%=empVO.getEmpPw()%>" placeholder="<%=empVO.getEmpPw()%>">
												</div>
												<div class="form-group">
													<label for="recipient-name" class="col-form-label">이름:</label>
													<input type="text" class="form-control" id="empName" data-default="<%=empVO.getEmpName()%>" placeholder="<%=empVO.getEmpName()%>">
												</div>
												<div class="form-group">
													<label for="recipient-name" class="col-form-label">이메일:</label>
													<input type="email" class="form-control" id="empEmail" data-default="<%=empVO.getEmpEmail()%>" placeholder="<%=empVO.getEmpEmail()%>">
												</div>
												<div clm-group">
													<label for="recipient-name" class="col-form-label">전화번호:</label>
													<input type="textass="for" class="form-control" id="empTel" data-default="<%=empVO.getEmpTel()%>" placeholder="<%=empVO.getEmpTel()%>">
												</div>
												<div class="form-group">
													<label for="recipient-name" class="col-form-label">주소:</label>
													<button type="button" class="btn btn-primary btn-sm" >주소찾기</button>
													<input type="text" class="form-control" id="empAddr" data-default="<%=empVO.getEmpAddr()%>" placeholder="<%=empVO.getEmpAddr()%>">
												</div>
												<div class="form-group">
													<nav
														class="navbar navbar-expand navbar-light bg-light mb-4">
														<a class="navbar-brand" href="#" style="font-size: 1em"
															id="empPosit" name="empPosit"><%=empVO.getEmpPosit()%></a>
														<ul class="navbar-nav ml-auto">
															<li class="nav-item dropdown"><a
																class="nav-link dropdown-toggle" href="#"
																id="navbarDropdown" role="button" data-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false"> </a>
																<div
																	class="dropdown-menu dropdown-menu-right animated--grow-in"
																	aria-labelledby="navbarDropdown" id="dropdown-position"
																	style="text-align: center">
																	<a class="dropdown-item" href="#" name="empPosit">사원</a> <a
																		class="dropdown-item" href="#">대리</a> <a
																		class="dropdown-item" href="#">과장</a> <a
																		class="dropdown-item" href="#">차장</a> <a
																		class="dropdown-item" href="#">부장</a> <a
																		class="dropdown-item" href="#">대표</a>
																</div></li>
														</ul>
													</nav>
												</div>
												<div class="form-group">
													<nav
														class="navbar navbar-expand navbar-light bg-light mb-4">
														<a class="navbar-brand" href="#" style="font-size: 1em"
															id="empDept"><%=transform.transformDeptCode(empVO.getDeptCode())%></a>
														<ul class="navbar-nav ml-auto">
															<li class="nav-item dropdown"><a
																class="nav-link dropdown-toggle" href="#"
																id="navbarDropdown" role="button" data-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false"> </a>
																<div
																	class="dropdown-menu dropdown-menu-right animated--grow-in"
																	aria-labelledby="navbarDropdown"
																	id="dropdown-department" style="text-align: center">
																	<a class="dropdown-item" href="#" id="100">개발부</a> <a
																		class="dropdown-item" href="#" id="200">디자인부</a> <a
																		class="dropdown-item" href="#" id="300">인사부</a> <a
																		class="dropdown-item" href="#" id="400">총무부</a> <a
																		class="dropdown-item" href="#" id="500">기획부</a> <a
																		class="dropdown-item" href="#" id="600">사업부</a>
																</div></li>
														</ul>
													</nav>
												</div>
												<div class="form-group">
													<nav class="navbar navbar-expand navbar-light bg-light mb-4">
                                        <a class="navbar-brand" href="#" id="empState"><%=transform.transformStateCode(empVO.getStateCode())%></a>
                                        <ul class="navbar-nav ml-auto">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false" style="font-size: 1em">
                                                    	
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right animated--grow-in"
                                                    aria-labelledby="navbarDropdown" id="dropdown-statement" style = "text-align : center">
                                                    <a class="dropdown-item" href="#" id="0">근무중</a>
                                                    <a class="dropdown-item" href="#" id="1">외근중</a>
                                                    <a class="dropdown-item" href="#" id="2">결근중</a>
                                                    <a class="dropdown-item" href="#" id="3">외출중</a>
                                                    <a class="dropdown-item" href="#" id="4">휴가중</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </nav>
												</div>
												<div class="form-group">
													<label for="isAdmin"><b>관리자여부&nbsp;<b></b></label> <input
														type="checkbox" id="isAdmin" <%if(empVO.getAdminCode()==1){%>checked="checked"<%}%>>
												</div>
											<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-primary">수정</button>
										</div>
										</form>
										</div>
										
										
										
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
		<script src="../vendor/jquery/jquery.min.js"></script>
		<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script>
			$('#exampleModal').on('show.bs.modal', function(event) {
				// 아래 템플릿 코드인데 수정해서 db연동하고 회원정보 수정되도록 ㄱㄱ
				var button = $(event.relatedTarget)
				var recipient = button.data('whatever')

				var modal = $(this)
				modal.find('.modal-title').text('정보수정')
				modal.find('.modal-body input').val(recipient)
			})
			$('#dropdown-position a').click(function() {
				var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기

				// 업무상태 수정 해야함
				$('#empPosit').text(selectedText); // navbar-brand의 텍스트 변경
			});
			$('#dropdown-department a').click(function() {
				var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기

				// 업무상태 수정 해야함
				$('#empDept').text(selectedText); // navbar-brand의 텍스트 변경
			});
			$('#dropdown-statement a').click(function() {
				var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기

				// 업무상태 수정 해야함
				$('#empState').text(selectedText); // navbar-brand의 텍스트 변경
			});
		</script>
</body>
</html>