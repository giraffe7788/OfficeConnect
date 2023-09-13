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
							
							
		    <!-- 모달 시작 -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="margin-left : 25%">정보수정</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" >정보수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
                <div class="form-group">
            <label for="recipient-name" class="col-form-label">이름:</label>
            <input type="text" class="form-control" id="empName">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">이메일:</label>
            <input type="text" class="form-control" id="empEmail">
          </div>
          <div class="form-group">
                      <label for="recipient-name" class="col-form-label">전화번호:</label>
            <input type="text" class="form-control" id="empTel">
          </div>
          <div class="form-group">
                      <label for="recipient-name" class="col-form-label">주소:</label>
                      <button type="button" class="btn btn-primary btn-sm">주소찾기</button>
            <input type="text" class="form-control" id="empAddr">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">수정</button>
      </div>
    </div>
  </div>
</div>
		    <!-- 모달 시작 -->
									
						</div>
						<!-- 드롭다운 -->
									<nav class="navbar navbar-expand navbar-light bg-light mb-4" style="width : 14%; height:4vh; position:absolute; margin-left:68%; margin-top:45%">
                                        <a class="navbar-brand" href="#">업무중</a>
                                        <ul class="navbar-nav ml-auto">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    	
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right animated--grow-in"
                                                    aria-labelledby="navbarDropdown" style = "text-align : center">
                                                    <a class="dropdown-item" href="#">근무중</a>
                                                    <a class="dropdown-item" href="#">외근중</a>
                                                    <a class="dropdown-item" href="#">결근중</a>
                                                    <a class="dropdown-item" href="#">외출중</a>
                                                    <a class="dropdown-item" href="#">휴가중</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </nav>
                                    
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
	$('#exampleModal').on('show.bs.modal', function (event) {
		  // 아래 템플릿 코드인데 수정해서 db연동하고 회원정보 수정되도록 ㄱㄱ
		  var button = $(event.relatedTarget) 
		  var recipient = button.data('whatever') 

		  var modal = $(this)
		  modal.find('.modal-title').text('정보수정')
		  modal.find('.modal-body input').val(recipient)
		})
	$('.dropdown-menu a').click(function () {
    	var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기
    	
    	var userResponse = window.confirm("업무 상태를 수정하시겠습니까?");
    	if (userResponse) {
    	    // 사용자가 "확인"을 선택한 경우
    	    // 업무상태 수정 해야함
    		$('.navbar-brand').text(selectedText); // navbar-brand의 텍스트 변경
    	} else {
    	    // 사용자가 "취소"를 선택한 경우 또는 경고창을 닫은 경우
    	}
	});
	</script>

</body>
</html>