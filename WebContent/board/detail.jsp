<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.vo.*"%>
<%@ page import="java.util.*"%>
<
<%
	BoardVO vo = (BoardVO) request.getAttribute("bv");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>게시판</h3>

	<table>
		<tr>
			<td>제목 : </td>	
			<td><%=vo.getBrdTitle()%></td>
		</tr>
		<tr>
			<td>내용 : </td>
			<td><%=vo.getBrdCont()%></td>
		</tr>
	</table>
	<br>
	<input type="hidden" name="brdNo" value="<%=vo.getBrdNo()%>"> 
	<input type="button" value="수정"
		onclick="location.href='<%=request.getContextPath()%>/board/update.do?brdNo=<%=vo.getBrdNo()%>'" />
	<input type="button" value="삭제"
		onclick="location.href='<%=request.getContextPath()%>/board/delete.do?brdNo=<%=vo.getBrdNo()%>'" />


</body>
</html>