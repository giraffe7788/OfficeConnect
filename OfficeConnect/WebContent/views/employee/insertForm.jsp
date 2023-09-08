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

	<!-- 비밀번호 확인 -->
	<script>
	function JoinForm_submit(form) {
		if (form.empPw.value != form.empPwConfirm.value) {
			alert('비밀번호가 일치하지 않습니다.');
			form.empPwConfirm.focus();
			return;
		}
		form.submit();
	}
	</script>
	
	<!-- 폼 태그 -->
	<form action="join.do" method="post" onsubmit="JoinForm_submit(this); return false;" enctype="multipart/form-data">
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
				<td>비밀번호 확인 :</td>
				<td><input type="text" name="empPwConfirm" value=""></td>
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
				<td>전화번호 :</td>
				<td><input type="text" name="empTel" value=""></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" name="empEmail" value=""></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><textarea name="empAddr"></textarea></td>
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
		<button type="submit">저장</button>
		<button>
			<a href='http://localhost/OfficeConnect'>돌아가기</a>
		</button>
	</form>
</body>
</html>