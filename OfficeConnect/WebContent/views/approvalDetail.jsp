<%@page import="vo.ApprovalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ApprovalVO apprVO = (ApprovalVO)request.getAttribute("apprVO");
	System.out.println(apprVO.getApprNo());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재상세보기</title>
</head>
<body>

<iframe src="../views/form/form<%= apprVO.getApprType()%>.html" width="100%" height="100%" style="width:55%; height:100vh;" frameborder="0" scrolling="no" id="form"></iframe>
		
</body>
</html>