<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="vo.*"%>

<%@ page import="java.util.*"%>
<
<%
	BoardVO vo = (BoardVO) request.getAttribute("bv");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h3>게시판</h3>
<div>
	<table >
		<tr>
			<td>제목 : </td>	
			<td><%=vo.getBrdTitle()%></td>
		</tr>
		<tr>
			<td>내용 : </td>
			<td><%=vo.getBrdCont()%></td>
		</tr>
	</table>
</div>


<div>
	<input type="hidden" name="brdNo" value="<%=vo.getBrdNo()%>"> 
	<input type="button" value="수정"
		onclick="location.href='<%=request.getContextPath()%>/board/update.do?brdNo=<%=vo.getBrdNo()%>'" />
	<input type="button" value="삭제"
		onclick="location.href='<%=request.getContextPath()%>/board/delete.do?brdNo=<%=vo.getBrdNo()%>'" />
</div>

<div>
<h5>댓글</h5>
<form action="" method="post">
<div>
<input type="text" name="commCont"><br>
</div>
<input type="button" value="등록" onclick="location.href=''">

</form>

</div>
</body>
</html>