<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="util.SessionEmpInfo"%>
<%@page import="util.TransEmpInfo"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<%
NoticeVO noticeVO = (NoticeVO)request.getAttribute("noticeVO");
System.out.println("noticeVO : " + noticeVO);
String empNo = (String) session.getAttribute("empNo");
System.out.println("empNo : " + empNo);
System.out.println("noticeVO : " + noticeVO.getEmpNo());
EmpVO sessionVO = SessionEmpInfo.getInstance().getEmpVO(empNo);
System.out.println("sessionVO : " + sessionVO);
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

<title> <%=noticeVO.getNtcNo()%>번 공지사항</title>

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
				<input type="hidden" name="ntcNo" value="<%=noticeVO.getNtcNo()%>">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4" id="mainbutton">
						<h1 class="h3 mb-0 text-gray-800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=noticeVO.getNtcTitle()%></h1>
					<a 
						onclick="return confirm('삭제하시겠습니까?')"
						href='<%=request.getContextPath()%>/notice/delete.do?ntcNo=<%=noticeVO.getNtcNo()%>'
						class="btn btn-danger btn-circle" 
						style="position:absolute; margin-left:68%">
	                    <i class="fas fa-trash"></i>
                   </a>
                   <a 
	                   href='<%=request.getContextPath()%>/notice/update.do?ntcNo=<%=noticeVO.getNtcNo()%>'
	                   class="btn btn-info btn-circle" 
	                   style="position:absolute; margin-left:64%">
	                   <i class="fa-solid fa-pen-to-square"></i>
                   </a>
					</div>



					<div class="row" style="justify-content: center">

						<div class="col-lg-8">

							<!-- Default Card Example -->
							<div class="card mb-4">
								<div class="card-header">
									<%=noticeVO.getDeptName()%>&nbsp;&nbsp;<%=noticeVO.getEmpPosit()%>&nbsp;&nbsp;<%=noticeVO.getEmpName()%>&nbsp;&nbsp; <span style="float: right"><%=noticeVO.getNtcDateDisplay()%></span></div>
								<div class="card-body" style="height: 60vh">
									<%=noticeVO.getNtcCont()%>
									</div>

							</div>

							<!-- Basic Card Example -->

						</div>

					</div>
					
										<div class="row" style="justify-content: center; margin-bottom : 2%">
											<a href="#" class="btn btn-primary btn-icon-split btn-lg"> <span
							class="icon text-white-50"> 
							<i class="fa-solid fa-right-to-bracket"></i>
						</span> <span class="text" onclick="location.href='<%=request.getContextPath()%>/notice/list.do'">목록으로</span>
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
	<script type="text/javascript">
	if (<%=sessionVO.getAdminCode()%> !==1 ) {
		$('#mainbutton').find('a').css('display','none');	
	}
	</script>
</body>

</html>