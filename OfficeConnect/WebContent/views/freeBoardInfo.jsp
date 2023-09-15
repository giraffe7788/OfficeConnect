<%@page import="util.SessionEmpInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<%
	BoardVO boardVO = (BoardVO) request.getAttribute("boardVO");
System.out.println("boardVO : " + boardVO);
String empNo = (String) session.getAttribute("empNo");
System.out.println("empNo : " + empNo);
EmpVO sessionVO = SessionEmpInfo.getInstance().getEmpVO(empNo);
System.out.println("sessionVO : " + sessionVO);
// 이거는 아래 VO는 현재 게시글 쓴 사람의 VO (직급or부서or작성자이름 등등 떙겨오려고)
/* EmpVO empVO = (EmpVO) request.getAttribute("empVO"); */
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
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

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
					<input type="hidden" name="brdNo" value="<%=boardVO.getBrdNo()%>">
					<!-- 보드 번호 넘겨줌-->
					<!-- 페이지 내 헤더 -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4"
						id="mainbutton">
						<!-- 게시판 수정 삭제 버튼 숨기기 -->
						<h1 class="h3 mb-0 text-gray-800">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=boardVO.getBrdTitle()%></h1>
						<a
							href='<%=request.getContextPath()%>/board/delete.do?brdNo=<%=boardVO.getBrdNo()%>'
							class="btn btn-danger btn-circle"
							style="position: absolute; margin-left: 68%"> <i
							class="fas fa-trash"></i>
						</a> <a
							href='<%=request.getContextPath()%>/board/update.do?brdNo=<%=boardVO.getBrdNo()%>'
							class="btn btn-info btn-circle"
							style="position: absolute; margin-left: 64%"> <i
							class="fa-solid fa-pen-to-square"></i>
						</a>
					</div>


					<div class="row" style="justify-content: center">

						<div class="col-lg-8">

							<!-- 공지사항 내용 -->
							<div class="card mb-4">
								<div class="card-header">
									<%=boardVO.getEmpNo()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=boardVO.getBrdMod()%></div>
								<div class="card-body" style="height: 60vh">
									<%=boardVO.getBrdCont()%></div>

							</div>
						</div>
				
						
						<div class="col-lg-8" >					
								<div id="commentList"></div>
								<div class="card mb-4">
								<span><strong>Comments</strong></span> <span id="cCnt"></span>
									<div class="card-header">
										<input type="hidden" id="empNo" value="<%=empNo%>">
										<input type="hidden" id="brdNo"value="<%=boardVO.getBrdNo()%>"> 
										이름 날짜
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"
											class="btn btn-danger btn-circle btn-sm"
											style="position: absolute; margin-left: 71%; margin-top: -0.2%">
											<i class="fas fa-trash"></i>
										</a> <a href="#" class="btn btn-info btn-circle btn-sm"
											style="position: absolute; margin-left: 67%; margin-top: -0.2%">
											<i class="fa-solid fa-pen-to-square"></i>
										</a>
									</div>
									<div class="card-body">
										<input type="text" placeholder="댓글을 입력해주세요" id="commCont" name="commCont">
									</div>

								</div>
							
						</div>
					</div>

					<div class="row" style="justify-content: center; margin-bottom: 2%">
						<a href="#" class="btn btn-primary btn-icon-split btn-lg"> <span
							class="icon text-white-50"> <i
								class="fa-solid fa-right-to-bracket"></i>
						</span> <span class="text"
							onclick="location.href='<%=request.getContextPath()%>/board/list.do'">목록으로</span>
						</a> <a href="#" class="btn btn-primary btn-icon-split btn-lg"
							style="margin-left: 3%"> <span class="icon text-white-50">
								<i class="fa-solid fa-pen"></i>
						</span> <span class="text" id="add" onclick="fn_comment()">댓글작성</span>
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
	<script>
		// 자기가 작성한 글이 아니면서 + 본인이 관리자도 아니면 display : none 적용
	<%if (sessionVO.getEmpNo() != empNo && sessionVO.getAdminCode() != 1) {%>
		$('#mainbutton').css('display', 'none');
	<%}%>
	
		function fn_comment() {
		
			var sendData = { "empNo":<%=empNo%>, "brdNo":<%=boardVO.getBrdNo()%>, "commCont" : $("#commCont").val()}
			$.ajax({
				
			 	url : "../comment/insert.do",
				type : "post",
				data : sendData,
				success : function(cnt){
					
		            if(cnt!==0){
 		            	getcommentList();
		                $("#commCont").val("");		           
		             }
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				} 
			});
		}

 		$(function() {
			getcommentList()
		}); 

		function getcommentList() {

			$.ajax({
				url : "../comment/list.do", // 서버로 요청
				type : "get",
				data : { "brdNo" :	<%=boardVO.getBrdNo()%>},
				dataType : "json",
				success : function(data) {
					
					  var html = "";
			            var cCnt = data.length;
			            
			            if(data.length > 0){
			         
			            	
			                html+= "<div class='row' style='justify-content: center'>";
			            	 $.each(data, function(index, obj){
			            		   html += "<div class='col-lg-12'>";
			                       html += "<div class='card mb-4'>";
			                       html += "<div class='card-header'>" + obj.empNo; 
			                       html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + obj.commDate;			                  
			                       html += "<a href='#' class='btn btn-danger btn-circle btn-sm' style='position:absolute; margin-left:71%; margin-top:-0.2%'>";
			                       html += "<i class='fas fa-trash'></i></a>";
			                       html += "<a href='#' class='btn btn-info btn-circle btn-sm' style='position:absolute; margin-left:67%; margin-top:-0.2%'>";
			                       html += "<i class='fa-solid fa-pen-to-square'></i></a></div>";
			                       html += "<div class='card-body'>" + obj.commCont;		           
			                       html += "</div>";
			                       html += "</div>";
			                       html += "</div>";
			                       
			                   
			            	 })
			            	html +="<div>";
			            } else {
			                
			                html += "<div>";
			                html += "<div><table><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
			                html += "</table></div>";
			                html += "</div>";
			            }
			            
			            $("#cCnt").html(cCnt);
			            $("#commentList").html(html);
			            
			            },
			            error : function(xhr) {
							alert("상태 : " + xhr.status);} 
				
			});
		}
	</script>
</body>

</html>