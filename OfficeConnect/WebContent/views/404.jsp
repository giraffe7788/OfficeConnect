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

<title>404Error</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./css/sb-admin-2.min.css" rel="stylesheet">

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
						<h1 class="h3 mb-0 text-gray-800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항의 제목이 들어갈 영역입니다</h1>
					</div>



					<div class="row" style="justify-content: center">

						<div class="col-lg-8">

							<!-- Default Card Example -->
							<div class="card mb-4">
								<div class="card-header">
									작성자이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성시간 2023-09-07</div>
								<div class="card-body" style="height: 60vh">
									공지사항의내용이들어갈영역입니다여기는 아무튼 이렇게 글을 한번 길게 써 보려고 하는데 이상한 사람 아니고요 내용을
									일단 길게 넣어야 테스트가 되잖아요? 그래서 쓰는겁니다 아시겠나요? 아시~나~요</div>

							</div>

							<!-- Basic Card Example -->

						</div>

					</div>
					
										<div class="row" style="justify-content: center">
											<a href="#" class="btn btn-primary btn-icon-split btn-lg"> <span
							class="icon text-white-50"> <i
								class="fa-solid fa-pen-to-square"></i>
						</span> <span class="text">목록으로</span>
						</a>
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
</body>

</html>