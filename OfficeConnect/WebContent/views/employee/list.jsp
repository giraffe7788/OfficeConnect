<%@page import="vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	List<EmpVO> empList = (List<EmpVO>)request.getAttribute("empList");

	String msg = (String)session.getAttribute("msg");
	
	if(msg != null){
		session.removeAttribute("msg");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
</head>
<h3>사원 조회</h3>
<body>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>직급</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>주소</th>
			<th>상태코드</th>
			<th>관리자여부코드</th>
			<th>부서코드</th>
		</tr>
<%
	if(empList.size() == 0){
%>
	<tr><td colspan="4">데이터가 존재하지 않습니다.</td></tr>
<%
	}else{
		
		for(EmpVO ev : empList){
%>
	<tr>
		<td><%=ev.getEmpNo() %></td>
		<td><a href="detail.do?empNo=<%=ev.getEmpNo() %>"><%=ev.getEmpName() %></a></td>
		<td><%=ev.getEmpPosit() %></td>
		<td><%=ev.getEmpTel() %></td>
		<td><%=ev.getEmpEmail() %></td>
		<td><%=ev.getEmpAddr() %></td>
		<td><%=ev.getEmpState() %></td>
		<td><%=ev.getAdminCode() %></td>
		<td><%=ev.getDeptCode() %></td>
	</tr>
<% 
		}
	}
%>
	<tr align="center">
		<td colspan="10"><a href=./join.do>새 사용자 등록</a>
		</td>
	</tr>
	</table>
<%
	if(msg !=null && msg.equals("성공")){
%>
<script>
	alert('정상적으로 처리되었습니다.');
</script>
<%
	}
%>
</body>
</html>