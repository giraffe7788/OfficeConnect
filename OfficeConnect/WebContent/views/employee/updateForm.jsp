<%@page import="img.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	EmpVO ev = (EmpVO) request.getAttribute("ev");

	List<EmpVO> empList = (List<EmpVO>)request.getAttribute("empList");
	
	List<AtchFileVO> fileList = (List<AtchFileVO>)request.getAttribute("fileList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 변경</title>
</head>
<body>
<h3>사원 정보 변경</h3>
	<form action="../join/update.do" method="post" enctype="multipart/form-data">
		    <!-- 히든으로 회원 아이디 숨겨놓음 -->
		<input type="hidden" name="empNo" value="<%=ev.getEmpNo()%>">
		<table>
			<tr>
				<td>접속중인 사번 : <%=ev.getEmpNo() %></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="text" name="empPw" value="<%=ev.getEmpPw() %>"></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><input type="text" name="empName" value="<%=ev.getEmpName() %>"></td>
			</tr>
			<tr>
				<td>직급 :</td>
				<td><input type="text" name="empPosit" value="<%=ev.getEmpPosit() %>"></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><input type="text" name="empTel" value="<%=ev.getEmpTel() %>"></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" name="empEmail" value="<%=ev.getEmpEmail() %>"></td>
			</tr>
			<tr>
				<td>주소 :</td>				
				<td><input type="text" name="empAddr" value="<%=ev.getEmpAddr() %>"></td>
			</tr>
			<tr>
				<td>상태코드 :</td>
				<td><input type="number" name="empState" value="<%=ev.getEmpState() %>"></td>
			</tr>
			<tr>
				<td>관리자여부코드 :</td>
				<td><input type="number" name="adminCode" value="<%=ev.getAdminCode() %>"></td>
			</tr>
			<tr>
				<td>부서코드 :</td>
				<td><input type="number" name="deptCode" value="<%=ev.getDeptCode() %>"></td>
			</tr>
			<tr>
				<td>기존 첨부파일 :</td>
				<td>
				<%
					if(fileList != null) {
						for(AtchFileVO fileVO : fileList){
				%>
					<div>
					<a href="<%=request.getContextPath() %>/join/download.do?empNo=<%=fileVO.getEmpNo()%>"><%=fileVO.getOrignFileName() %></a>
					</div>			
				<%
						}
					}
				%>

				</td>
			</tr>
			<tr>
				<td>새로고침 첨부파일 :</td>
				<td><input type="file" name="atchFile" multiple="multiple"></td>
			</tr>
		</table>
		<input type="submit" value="수정완료">
	</form>
</body>
</html>