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

<title>사원조회</title>

    <!-- 아이콘 설정 -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4" style="margin-top : 8%">
                        <h1 class="h3 mb-0 text-gray-800" style="margin-left:45%">사원조회</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row" style="justify-content : center">

                        <!-- Content Column -->
                        <div class="col-lg-3 mb-4">

                            <nav class="navbar navbar-expand navbar-light bg-primary mb-4" style="border-radius : 0.35rem">
                                        <a class="navbar-brand" href="#" style="font-size : 1em"><div class="text-white shadow" id="department">부서선택</div></a>
                                        <ul class="navbar-nav ml-auto">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    	
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right animated--grow-in"
                                                    aria-labelledby="navbarDropdown" id="dropdown-department" style = "text-align : center">
                                                    <a class="dropdown-item" href="#">개발부</a>
                                                    <a class="dropdown-item" href="#">디자인부</a>
                                                    <a class="dropdown-item" href="#">인사부</a>
                                                    <a class="dropdown-item" href="#">총무부</a>
                                                    <a class="dropdown-item" href="#">기획부</a>
                                                    <a class="dropdown-item" href="#">사업부</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </nav>

                            <!-- 사원 목록 출력부분 -->
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="margin-top : 6%">
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
                                    <tbody>
                                        <tr>
                                            <td>부장</td>
                                            <td>김영남</td>
                                        </tr>
                                        <tr>
                                            <td>차장</td>
                                            <td>김태영</td>
                                        </tr>
                                        <tr>
                                            <td>대리</td>
                                            <td>윤하</td>
                                        </tr>
                                        <tr>
                                            <td>과장</td>
                                            <td>송찬중</td>
                                        </tr>
                                        <tr>
                                            <td>사원</td>
                                            <td>조영재</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-6 mb-4">

                            <!-- 사원 클릭시 오른쪽에 뜨는 정보 -->
                            <!-- 아직 클릭되지 않았다면 이름을 클릭해서 정보를 조회하실 수 있습니다 출력 -->
                            <div class="card shadow mb-4" id="empInfo">
                                <div class="card-body">
                            <div class="table-responsive"
								style="position: relative; display: flex; height: 100%; margin-top: 20px;">
								<div class="image-wrapper" style="width: 60%; margin-left:10%">
									<img src="../images/defaultProfile.PNG" alt="기본프로필" style="width:50%; margin-left:40%; margin-bottom:6%; margin-top:2%">
								</div>
								<div class="table-wrapper" style="width:60%">
									<div style="text-align : left; font-size:1.5em; margin-top:12%">
                                 	    <div style="margin : 2%">개발부</div>
                                	    <div style="margin : 2%">부장</div>
                                	    <div style="margin : 2%">김영남</div>
                                	    <div style="margin : 2%">010-5191-4987</div>
                                    </div>
								</div>

							</div>
	</div>
	<div style="margin-left:30%; margin-bottom : 5%">
										<a href="#메일작성"
										class="btn btn-primary btn-icon-split" style="margin-right : 5%; width:27%">
										<span class="text" style="color: #fff">메일작성</span>
										<a href="#기안작성"
										class="btn btn-primary btn-icon-split" style="width:27%">
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
    <%@ include file="./common.jsp" %>
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
    $('#exampleModal').on('show.bs.modal', function (event) {
		  // 드롭다운 값에 따라 부서별 회원들이 쫙 나와야함
		  var button = $(event.relatedTarget) 
		  var recipient = button.data('whatever') 

		  var modal = $(this)
		  modal.find('.modal-title').text('정보수정')
		  modal.find('.modal-body input').val(recipient)
		})
		
	$('#dropdown-department a').click(function () {
    	var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기
    	
    	    // 업무상태 수정 해야함
    		$('#department').text(selectedText); // navbar-brand의 텍스트 변경
	});
    </script>
</body>
</html>