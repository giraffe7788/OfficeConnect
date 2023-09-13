<%@page import="img.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	EmpVO ev = (EmpVO) request.getAttribute("ev");

	List<AtchFileVO> fileList = (List<AtchFileVO>) request.getAttribute("fileList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 상세정보</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>사번</td>
			<td><%=ev.getEmpNo() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=ev.getEmpName() %></td>
		</tr>
		<tr>
			<td>직급</td>
			<td><%=ev.getEmpPosit() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=ev.getEmpTel() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=ev.getEmpEmail() %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=ev.getEmpAddr() %></td>
		</tr>
		<tr>
			<td>상태코드</td>
			<td><%=ev.getEmpState() %></td>
		</tr>
		<tr>
			<td>관리자여부코드</td>
			<td><%=ev.getAdminCode() %></td>
		</tr>
		<tr>
			<td>부서코드</td>
			<td><%=ev.getDeptCode() %></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
			<%
				if(fileList != null) {
					for(AtchFileVO fileVO : fileList){
			%>
				<div>
					<a href="<%=request.getContextPath() %>/join/download.do?empNo=<%=fileVO.getEmpNo() %>"><%=fileVO.getImgName() %></a>
				</div>			
			<%
					}
				}
			%>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<a href="../join/list.do">[목록]</a>
			<a href="../join/update.do?empNo=<%=ev.getEmpNo() %>">[사원정보 수정]</a>
			<a href="../join/delete.do?empNo=<%=ev.getEmpNo() %>">[사원정보 삭제]</a>
			</td>
		</tr>
	</table>
</body>
</html>