<%@page import="vo.EmpVO"%>
<%@page import="vo.ReviewVO"%>
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

<title>인사관리-평가결과조회</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<%
	ReviewVO rvo = (ReviewVO) request.getAttribute("rvo");

	SessionEmpInfo info = SessionEmpInfo.getInstance();
	EmpVO empVO = (EmpVO)request.getAttribute("empVO");
%>
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
					<h3 class="h3 mb-2 text-gray-800" style="width: 80%; margin: auto; text-align: center;">&nbsp;&nbsp;인사관리</h3>
					
					<hr style="width: 80%; margin: auto; text-align: center;" >

					<!-- DataTales Example -->
					<div class="card shadow mb-4" style="width: 80%; margin: auto; margin-top: 25px;">
						<div class="card-body" style="padding-top: 40px; padding-bottom: 40px;">

							<div class="row" style="border-right: 1px solid #858796;">
								<div class="col-lg-2">

									<button id="review" type="button" class="btn btn-light btn-icon-split"
										style="border: none; background-color: transparent; color: #858796; margin-bottom: 15px; width: 150px; font-size: 1.3rem;">
										<b>근무태도평가</b>
									</button>


									<button type="button" class="btn btn-light btn-icon-split"
										style="border: none; background-color: transparent; color: #858796; width: 150px; font-size: 1.3rem;">
										<b>평가결과조회</b>
									</button>

								</div>

								<div class="col-lg-10" style="border-left: 1px solid #858796;">

									<h4 class="h4 mb-2 text-gray-800">평가결과조회</h4>
									<hr class="text-gray-800">
									
									
									<div style="margin-bottom: 10px;">
										<%if(empVO != null) { %>
										<b>평가자 : </b><%=empVO.getEmpName() %>
										<%
										} else{
											%><b>평가자 : 미진행</b><%
										}%>
									</div>
									
									<hr>

									<div style="margin-bottom: 10px;">
										<b>평가 항목 체크</b>
									</div>

										<div class="table-responsive">
                                 <div class="table-wrapper" style="text-align: right;">

									<% 
										if(rvo != null){
									%>
                                    <table class="table table-bordered" style="width: 100%; text-align: center;">
                                       <tr>
                                          <th rowspan="2" style="vertical-align: middle;">근무태도</th>

                                          <th>책임감</th>
                                          <th>주도성</th>
                                          <th>협동심</th>
                                          <th>창의성</th>
                                       </tr>
                                       <tr>
                                       
                                          <td id="score1">
                                       		<%=rvo.getResScore() %>	
                                          </td>
                                          
                                          <td id="score2">
                                       		<%=rvo.getScrScore() %>	
													
                                          </td>
                                          <td id="score3">
                                       		<%=rvo.getCopScore() %>	

                                          </td>
                                          <td id="score4">
                                       		<%=rvo.getCreScore() %>	
                                          
                                          </td>
                                       </tr>
                                    </table>
                                    <%
                                    } else {
                                    	%><div style="margin-right:35%; font-size:1.5em">평가가 진행되지 않았습니다</div><%
                                    }
                                    %>
                                    
                                    <hr style="margin-top: 50px;">
                                    


                                 </div>

                              </div>
                              
                             <pre class=".text-gray-800" style="font-size: 1.25rem;">
                             
  ※ 해당 결과는 개인만이 조회할 수 있으며 타인과의 공유를 금합니다.

    이견이 있는 경우 2023.09.20 ~ 2023.09.30 

    해당 기간 내에 인사팀(내선 8993)으로 연락 부탁드립니다.
                                    
                            </pre>

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

<script>
$('#review').on('click', function(){
	
	location.href = "../review/insert.do";
});
</script>
	<%@ include file="./common.jsp"%>

	<!-- 페이지 검색/조회 플러그인 -->
</body>

</html>