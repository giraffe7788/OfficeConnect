<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
String empNo = (String) session.getAttribute("empNo");
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

<title>게시판 입력</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
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
				<div class="container-fluid">
					<form atcion="<%=request.getContextPath()%>/board/insert.do"
						method="post">
						<!-- 페이지 내 헤더 -->
						<div class="row" style="justify-content: center">
							<div class="col-lg-8">
								<div class="card mb-4">
									<div class="card-header">제목 작성</div>
								
							
									<input type="text" name="brdTitle" id="brdTitle"
										style="margin: 1%; height: 5vh; width: 98% "
										placeholder="제목을 입력해주세요"> 
										<input type="hidden" name="empNo" value="<%=empNo%>">
								</div>
							</div>

						</div>


						<div class="row" style="justify-content: center">

							<div class="col-lg-8">

								<!-- 공지사항 내용 -->
								<div class="card mb-4">
									<div class="card-header">내용 작성</div>
									<textarea name="brdCont" id="brdCont" rows="" cols=""
										style="margin: 2%; height: 60vh; width: 96%"
										placeholder="내용을 입력해주세요"></textarea>
								</div>
							</div>



						</div>

						<div class="row"
							style="justify-content: center; margin-bottom: 2%">
							<a href="#" class="btn btn-primary btn-icon-split btn-lg"> <span
								class="icon text-white-50"> <i
									class="fa-solid fa-right-to-bracket"></i>
							</span> <span class="text"
								onclick="location.href='<%=request.getContextPath()%>/board/list.do'">목록으로</span></a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" href="#" id="submitBtn" 
								class="btn btn-primary btn-icon-split btn-lg">
								<span class="icon text-white-50"> <i
									class="fa-solid fa-right-to-bracket"></i>
								</span> <span class="text">글 작성</span>
							</button>

						</div>

					</form>
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
	<script>
		$('#submitBtn').click(function(){
			
			var title = $("#brdTitle").val().trim();
			var cont = $("#brdCont").val().trim();
			
			if(title == ""){
				alert("제목이 입력되지 않았습니다");
				return false;
			} else if(cont == ""){
				alert("내용이 입력되지 않았습니다");
				return false;
			}
			
			location.href = "insert.do";
		});		

			
// 			alert("일단됨?");
// 			$("brdTitle").focus();
		
/* 			if(title.replace(/\s| /gi, "").length == 0 && cont.replace(/\s| /gi, "").length == 0){
				alert("제목 과 내용을 입력하세요.");
				
				$("#brdTitle").focus();
				return;
		} else if(title.replace(/\s| /gi, "").length == 0){
			alert("제목을 입력하세요.");
			$("#brdTitle").focus();
			return;
		} else if(cont.replace(/\s| /gi, "").length == 0){
			alert("내용을 입력하세요");
			$("#brdCont").focus();
			return;
		} */
// 			}
	</script>
</body>

</html>