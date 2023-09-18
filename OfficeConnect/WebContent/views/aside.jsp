<%@page import="util.SessionEmpInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SessionEmpInfo sessionEmpInfoAside = SessionEmpInfo.getInstance();
	String empNoAside = (String)session.getAttribute("empNo");
	int adminCode = sessionEmpInfoAside.getEmpVO(empNoAside).getAdminCode();
%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- 구분선 -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="../main/main.do">
					<i class="fa-solid fa-house"></i>
                    <span>메인화면</span>
                </a>
            </li>

            <!-- 구분선 -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
             	   co-operation
            </div>

            <li class="nav-item">
                <a class="nav-link" href="../approval/sendList.do">
                    <span>&nbsp;</span><i class="fa-solid fa-clipboard"></i>
                    <span>&nbsp;결재</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="../emp/chart.do">
                    <i class="fa-solid fa-network-wired"></i>
                    <span>사원조회</span>
                </a>
            </li>

            <!-- 구분선 -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                communication
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fa-solid fa-pen-to-square"></i>
                    <span>게시판</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">게시판종류</h6>
                        <a class="collapse-item" href="../notice/list.do">공지사항</a>
                        <a class="collapse-item" href="../board/list.do">자유게시판</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
            <!-- get 방식이라 쿼리스트링으로 파라미터(isSend)를 보내줌 .  -->
                <a class="nav-link" href="../mail/receiveList.do?isSend=1">
                    <i class="fa-solid fa-envelope"></i>
                    <span>메일</span></a>
            </li>
            
            <!-- 구분선 -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                support
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fa-solid fa-calendar-days"></i>
                    <span>예약</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">예약선택</h6>
                        <a class="collapse-item" href="../meeting/list.do">회의실예약</a>
                        <a class="collapse-item" href="../car/list.do">차량배차</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="../views/review.jsp">
                    <i class="fa-solid fa-list-check"></i>
                    <span>근무태도평가</span></a>
            </li>
            
            <!-- 구분선 -->
            <hr class="sidebar-divider">

            <%if(adminCode == 1) { %>
              <li class="nav-item" id="admin">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>관리자</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리자페이지</h6>
                        <a class="collapse-item" href="../emp/list.do">모든사원조회</a>
                        <a class="collapse-item" href="../emp/join.do">신규사원추가</a>
                    </div>
                </div>
            </li>

            <!-- 구분선 -->
            <hr class="sidebar-divider d-none" id="admin">
            
            <%} %>

        </ul>
        
<script src="../vendor/jquery/jquery.min.js"></script>