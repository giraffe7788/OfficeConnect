<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.vo.*"%>
<%@ page import="java.util.*"%>
<
<%
	BoardVO vo = (BoardVO) request.getAttribute("bv");
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

<title>제목넣어야함(j쿼리)</title>

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
				<div class="container-fluid">
				<input type="hidden" name="brdNo" value="<%=vo.getBrdNo()%>">  <!-- 보드 번호 넘겨줌-->
					<!-- 페이지 내 헤더 -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=vo.getBrdTitle()%></h1>
					<a href='<%=request.getContextPath()%>/board/delete.do?brdNo=<%=vo.getBrdNo()%>' class="btn btn-danger btn-circle" style="position:absolute; margin-left:68%">
                        <i class="fas fa-trash"></i>
                   </a>
                   <a href='<%=request.getContextPath()%>/board/update.do?brdNo=<%=vo.getBrdNo()%>' class="btn btn-info btn-circle" style="position:absolute; margin-left:64%">
                        <i class="fa-solid fa-pen-to-square"></i>
                   </a>
					</div>



					<div class="row" style="justify-content: center">

						<div class="col-lg-8">

							<!-- 공지사항 내용 -->
							<div class="card mb-4">
								<div class="card-header">
									<%=vo.getEmpNo()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=vo.getBrdMod()%></div>
								<div class="card-body" style="height: 60vh">
									<%=vo.getBrdCont()%></div>

							</div>
						</div>
						
						<div class="col-lg-8">
                            <!-- 아래 부분을 댓글의 개수만큼 반복시켜주면 댓글의 수만큼 댓글 생성 -->
                       <div class="card mb-4">
							<div class="card-header">
									댓글작성자이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;댓글작성시간 <a href="#" class="btn btn-danger btn-circle btn-sm" style="position:absolute; margin-left:71%; margin-top:-0.2%">
                        <i class="fas fa-trash"></i>
                   </a>
                   <a href="#" class="btn btn-info btn-circle btn-sm" style="position:absolute; margin-left:67%; margin-top:-0.2%">
                        <i class="fa-solid fa-pen-to-square"></i>
                   </a></div>
								<div class="card-body">
									                                        이거댓글내용인데 아무튼 댓글 개수만큼 for문으로 반복시켜준다음 댓글 페이지 여러개 찍어내면 됨 이거댓글내용인데 아무튼 댓글 개수만큼 for문으로 반복시켜준다음 댓글 페이지 여러개 찍어내면 됨 이거댓글내용인데 아무튼 댓글 개수만큼 for문으로 반복시켜준다음 댓글 페이지 여러개 찍어내면 됨 이거댓글내용인데 아무튼 댓글 개수만큼 for문으로 반복시켜준다음 댓글 페이지 여러개 찍어내면 됨</div>

							</div>

						</div>

					</div>
					
										<div class="row" style="justify-content: center; margin-bottom : 2%">
											<a href="#" class="btn btn-primary btn-icon-split btn-lg"> <span
							class="icon text-white-50"> 
							<i class="fa-solid fa-right-to-bracket"></i>
						</span> <span class="text" onclick="location.href='<%=request.getContextPath()%>/board/list.do'">목록으로</span>
						</a>
						<a href="#" class="btn btn-primary btn-icon-split btn-lg" style="margin-left : 3%">
                                        <span class="icon text-white-50">
                                            <i class="fa-solid fa-pen"></i>
                                        </span>
                                        <span class="text">댓글작성</span>
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