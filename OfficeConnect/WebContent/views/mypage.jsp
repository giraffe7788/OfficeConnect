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

<title>마이페이지</title>

    <!-- 아이콘 설정 -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- css 설정 -->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

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
				<div class="container-fluid" style="margin-top : 5%">

					<!-- Page Heading -->
					<p class="mb-4">
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4" style="width: 60%; margin: auto">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">마이페이지</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive"
								style="position: relative; display: flex; height: 100%; margin-top: 20px;">
								<div class="table-wrapper" style="width: 60%;">
									<table class="table table-bordered" id="dataTable" width="60%"
										cellspacing="0">
										<tr>
											<th>이름</th>
											<td>김태영</td>
										</tr>
										<tr>
											<th>사원번호</th>
											<td>111111</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td>111111@?????????</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td>1111-1111</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>대전</td>
										</tr>
										<tr>
											<th>부서</th>
											<td>개발부</td>
										</tr>
										<tr>
											<th>직급</th>
											<td>부장</td>
										</tr>
									</table>
								</div>
								<div class="image-wrapper"
									style="width: 30%; text-align: center; margin-left: 60px">
									<img src="../img/profileTest.jpg" alt="증명사진"
										style="max-width: 51%; height: auto; margin-top : 4%"> <a href="모달로 프로필사진 편집"
										class="btn btn-primary btn-icon-split" style="margin-top: 45px;">
										<span class="text" style="color: #fff">프로필 사진 편집</span>
									</a>

								</div>

							</div>
							<div
								style="display: flex; justify-content: center; align-items: center; margin-bottom: 50px">
								<a href="모달로 수정페이지 띄우기" class="btn btn-primary btn-icon-split"
									style="margin-top: 45px;"> <span class="text" id="myPageEditButton"
									style="color: #fff">마이페이지 수정</span>
								</a>
							</div>

									<!-- Single button -->
									<nav class="navbar navbar-expand navbar-light bg-light mb-4" style="width : 20%; height:4vh; position:absolute; margin-left:68%; margin-top:-17%">
                                        <a class="navbar-brand" href="#">업무중</a>
                                        <ul class="navbar-nav ml-auto">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    	변경
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right animated--grow-in"
                                                    aria-labelledby="navbarDropdown" style = "text-align : center">
                                                    <a class="dropdown-item" href="#">외출중</a>
                                                    <a class="dropdown-item" href="#">업무중</a>
                                                    <a class="dropdown-item" href="#">부재중</a>
                                                    <a class="dropdown-item" href="#">출장중</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </nav>
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
    <%@ include file="./common.jsp" %>
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
	$('#dropdown-menu dropdown-menu-right animated--grow-in > a').on('click', function() {
	    // 버튼에 선택된 항목 텍스트 넣기 
	    $('#navbar-brand').text($(this).text());
	        
	    // 선택된 항목 값(value) 얻기
	    alert($(this).attr('value'));
	});
	</script>

</body>
</html>