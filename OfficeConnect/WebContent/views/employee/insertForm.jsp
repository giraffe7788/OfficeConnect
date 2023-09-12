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
	<!-- 폼 태그 -->
	<form action="../join/join.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
<!-- 				<td>사번 :</td> -->
				<td><input type="hidden" name="empNo" value=""></td>
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
				<td>비밀번호 :</td>
				<td id="random_pw">
					<input type="text" name="empPw" id="empPw">
					<button type="button" onclick="temp_pw_issuance()">임시비밀번호 발급</button>
					<span id="temp_pw_display"></span>
				</td>
			</tr>
			<tr>
				<td>관리자여부코드 :</td>
				<td>
				<input type="radio" name="adminCode" value="1">관리자
				<input type="radio" name="adminCode" value="0">사원
				</td>
			</tr>
			<tr>
				<td>상태코드 :</td>
				<td><input type="text" name="empState" value=""></td>
			</tr>
			<tr>
				<td>부서코드 :</td>
				<td><input type="text" name="deptCode" value=""></td>
			</tr>
			<tr>
				<td>첨부파일 :</td>
				<td><input type="file" name="atchFile" multiple="multiple"></td>
			</tr>
		</table>
		<button type="submit">저장</button>
		<button>
			<a href='http://localhost:8888/OfficeConnect'>돌아가기</a>
		</button>
	</form>
	
	<!-- 임시 비밀번호 생성 --> 
	<script>
	function temp_pw_issuance() {
		let ranValue1 = ['1','2','3','4','5','6','7','8','9','0'];
		let ranValue2 = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
		let ranValue3 = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
		let ranValue4 = ['!','@','#','$','%','^','&','*','(',')'];
		
		var temp_pw = "";
		
		for(i=0; i<2; i++) {
			let ranPick1 = Math.floor(Math.random() * ranValue1.length);
			let ranPick2 = Math.floor(Math.random() * ranValue2.length);
			let ranPick3 = Math.floor(Math.random() * ranValue3.length);
			let ranPick4 = Math.floor(Math.random() * ranValue4.length);
			temp_pw = temp_pw + ranValue1[ranPick1] + ranValue2[ranPick2] + ranValue3[ranPick3] + ranValue4[ranPick4];
		}
		
		var temp_pw_display = document.getElementById("temp_pw_display");
	
		var empPwInput = document.getElementById("empPw");
	    empPwInput.value = temp_pw;
	}
	</script>
</body>
</html>