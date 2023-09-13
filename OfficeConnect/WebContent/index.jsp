 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>로그인</title>

    <!-- 아이콘 설정 -->
    <link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- css 설정 -->
    <link href="./css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="./script/index.js?ver=1"></script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <img src="./images/loginLogo.png" style="width : 50%">
                            <div class="col-lg-6">
                                <div class="p-5" style="height: 50vh; margin-top:25%">
                                    <div class="text-center" style="margin-top : -12.5%">
                                        <img src = "./images/icon.PNG">
                                    </div>
                                    <form class="user" style="margin-top : 17.5%" onsubmit="loginCheck()" id = "login">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="idCheck" aria-describedby="emailHelp"
                                                placeholder="사번을 입력하세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="pwCheck" placeholder="비밀번호를 입력하세요.">
                                        </div>
                                        <div id="checkbox" style="text-align: center;">
                                        <div class="form-group" style="display: inline-block;">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group" style="display: inline-block;">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="adminCheck custom-control-input" id="adminLogin">
                                                <label class="custom-control-label" for="adminLogin">관리자 로그인</label>
                                            </div>
                                         </div>
                                         </div>
                                        <button type="submit" id = "signIn" class="btn btn-primary btn-user btn-block">
                                            	로그인
                                        </button>                                        
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.jsp">비밀번호 찾기!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>