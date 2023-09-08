<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 사용자 등록</title>
</head>
<body>
<h3>사원 등록</h3>
	<form action="join.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>사번 :</td>
				<td><input type="text" name="empNo" value=""></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="text" name="empPw" value=""></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><textarea name="empAddr"></textarea></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><input type="text" name="empTel" value=""></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><input type="text" name="empName" value=""></td>
			</tr>
			<tr>
				<td>직급 :</td>
				<td><input type="text" name="empPosit" value=""></td>
			</tr>
			<tr>
				<td>상태코드 :</td>
				<td><input type="text" name="empState" value=""></td>
			</tr>
			<tr>
				<td>관리자여부코드 :</td>
				<td><input type="text" name="adminCode" value=""></td>
			</tr>
			<tr>
				<td>부서코드 :</td>
				<td><input type="text" name="deptCode" value=""></td>
			</tr>
		</table>
		<input type="submit" value="저장">
	</form>
</body>
</html>