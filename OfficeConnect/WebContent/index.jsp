<%@ page contentType="text/html; charset=UTF-8"%>
<html lang="ko">
<head>

<meta charset="UTF-8" />
<jsp:include page="./preScript.jsp"></jsp:include>
<meta name="viewport" content="initial-scale=1, width=device-width" />
<meta name="author" content="playddit" />
<title>오피스커넥트</title>
<link href="favicon.ico" rel="icon shortcut" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link href="css/reset.css" rel="stylesheet" />
<link href="css/login.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="script/modal.js" defer></script>
<script src="script/index.js" defer></script>
</head>
<body>
	<div id="wrap" class="cen">
		<div id="loginLeft">
			<img src="images/index.png" alt="index" />
		</div>
		<div id="loginRight">
			<img src="images/logo.png" id="loginLogo" alt="logo" />
			<form onsubmit="loginCheck()" id="login">
				<div class="loginBox">
					<i disabled class="fas fa-user"></i> <input type="text"
						id="idCheck" name="mail" placeholder="사번" />
				</div>
				<div class="loginBox">
					<i disabled class="fas fa-lock"></i> <input type="password"
						id="pwCheck" name="pass" placeholder="비밀번호" />
				</div>

				<div id="loginBox2">
					<input type="checkbox" id="idchk" name="auto" value="remember" /><span>내
						정보 기억하기</span> <a href="#" id=adminLogin>관리자 로그인</a>
				</div>

				<button type="submit" id="signIn" class="purBtn">로그인</button>

			</form>

			<div id="joinBox">
				<p>비밀번호를 잊어버리셨나요?</p>
				<a href="conditions.jsp">비밀번호 찾기</a>
			</div>
		</div>
	</div>
</body>
</html>




















