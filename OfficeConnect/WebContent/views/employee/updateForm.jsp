<%@page import="java.util.List"%>
<%@page import="vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	EmpVO ev = (EmpVO) request.getAttribute("ev");

	List<EmpVO> empList = (List<EmpVO>)request.getAttribute("empList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 변경</title>
</head>
<body>
<h3>사원 정보 변경</h3>
	<form action="update.do" method="post" enctype="multipart/form-data">
		<!-- 히든으로 회원 아이디 숨겨놓음 -->
		<input type="hidden" name="empNo" value="<%=ev.getEmpNo() %>">
		<table>
			<tr>
				<td>사번 :</td>
				<td><%=ev.getEmpNo() %></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><%=ev.getEmpPw() %></td>
			</tr>
			<tr>
				<td>주소 :</td>				
				<td><textarea name="empAddr" ><%=ev.getEmpAddr() %></textarea></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><%=ev.getEmpTel() %></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><%=ev.getEmpName() %></td>
			</tr>
			<tr>
				<td>직급 :</td>
				<td><%=ev.getEmpPosit() %></td>
			</tr>
			<tr>
				<td>상태코드 :</td>
				<td><%=ev.getEmpState() %></td>
			</tr>
			<tr>
				<td>관리자여부코드 :</td>
				<td><%=ev.getAdminCode() %></td>
			</tr>
			<tr>
				<td>부서코드 :</td>
				<td><%=ev.getDeptCode() %></td>
			</tr>
		</table>
		<input type="submit" value="사원정보 수정">

	</form>
</body>
</html>