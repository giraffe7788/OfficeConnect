<%@page import="util.TransEmpInfo"%>
<%@page import="vo.ImageVO"%>
<%@page import="vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
List<EmpVO> empList = (List<EmpVO>)request.getAttribute("empList"); 
TransEmpInfo transform = TransEmpInfo.getInstance();
%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자페이지</title>

    <!-- 아이콘 설정 -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- css 설정 -->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

<style>
#dataTable_wrapper {
	overflow-x : hidden;
}
</style>
</head>

<body id="page-top">

    <!-- 페이지 Wrapper -->
    <div id="wrapper">

        <!-- 사이드바 include -->
        <%@ include file="./aside.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 메인 Content -->
            <div id="content">

                <!-- 헤더 include -->
                <%@ include file="./header.jsp" %>

                <!-- 페이지 Content 시작 -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800" style = "text-align : center">사원목록</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" style="margin-top : 1%; width:80%; margin-left : 10%">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr role="row">
														<th class="sorting sorting_asc" tabindex="0"
															aria-controls="dataTable" rowspan="1" colspan="1"
															aria-sort="ascending"
															aria-label="번호: activate to sort column descending"
															style="width: 100px;">사번</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="제목: activate to sort column ascending"
															style="width: 100px;">이름</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성자: activate to sort column ascending"
															style="width: 100px;">부서</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 100px;">직급</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 100px;">상태</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 100px;">전화번호</th>
													</tr>
                                    </thead>
                                    <tbody>
                                        <%
											if(empList.size() == 0){
										%>
											<tr><td colspan="10">데이터가 존재하지 않습니다.</td></tr>
										<%
										}else{
		
												for(EmpVO ev : empList){
										%>
											<tr>
												<td><%=ev.getEmpNo() %></td>
												<td><a href="../emp/detail.do?empNo=<%=ev.getEmpNo() %>"><%=ev.getEmpName() %></a></td>
												<td><%=transform.transformDeptCode(ev.getDeptCode()) %></td>
												<td><%=ev.getEmpPosit() %></td>
												<td><%=transform.transformStateCode(ev.getStateCode()) %></td>
												<td><%=ev.getEmpTel() %></td>
											</tr>
										<% 
										}
													}
										%>
                                    </tbody>
                                </table>
                                
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
    <%@ include file="./common.jsp" %>
    
    <!-- 페이지 검색/조회 플러그인 -->
    <script src="../vendor/datatables/jquery.dataTables.js"></script>
    <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="../js/demo/datatables-demo.js"></script>
</body>

</html>