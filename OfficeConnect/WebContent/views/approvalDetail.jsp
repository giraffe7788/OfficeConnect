<%@page import="vo.ApprovalLineVO"%>
<%@page import="vo.ApprovalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ApprovalVO apprVO = (ApprovalVO) request.getAttribute("apprVO");
	ApprovalLineVO apprlVO = (ApprovalLineVO) request.getAttribute("apprlVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재상세보기</title>
</head>
<body>

	<iframe src="../views/form/form<%=apprVO.getApprType()%>Origin.html"
		width="100%" height="100%" style="width: 100%; height: 100vh;"
		frameborder="0" scrolling="no" id="form"></iframe>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		// iframe 내부의 함수를 호출합니다.
		$("#form").on("load", function() {

			var iframe = this;
			var iframeWindow = iframe.contentWindow;

			// iframe 내부의 함수 호출
			iframeWindow.setData("<%=apprVO.getApprCont()%>");
			iframeWindow.setMark(<%=apprlVO.getApprlProg()%>);
		});
	</script>
</body>
</html>