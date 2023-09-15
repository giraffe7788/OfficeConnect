<%@page import="vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String empNo = (String)request.getAttribute("empNo");
	String empEmail = (String)request.getAttribute("empEmail");
	String empPw = (String)request.getAttribute("empPw");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>비밀번호 찾기</title>

    <!-- 아이콘 설정 -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- css 설정 -->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- 부트스트랩 코드, 플러그인 설정 -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../script/sb-admin-2.min.js"></script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row" style="height: 65vh;">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Office Connect</h1>
                                        <p class="mb-4">비밀번호 찾기</p>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" name="eNo" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="사번을 입력하세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="eEmail" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="이메일을 입력하세요.">
                                        </div>
                                        <a href="#" class="btn btn-primary btn-user btn-block" id="newPw"> 
                                        	비밀번호 전송
                                        </a>
                                    </form>
                                    <hr>

                                    <div class="text-center">
                                        <a class="small" href="../index.jsp">로그인</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    
<script>
$('#newPw').on('click', function(){
	
	let eNo = $('[name="eNo"]').val();
	let eEmail = $('[name="eEmail"]').val();

	$.ajax({
		  type: 'post', 
		  url: '../emp/forgotpw.do',
		  data: {
		    'empNo': eNo,
		    'empEmail': eEmail
		  },
		  success: function(res) {
		    if(res.isSuccess == "ok"){
		    	alert("이메일로 비밀번호를 전송했습니다");
		    }else{
		    	alert("확인되지 않는 회원정보입니다. 다시 입력해 주세요.");
		    }
		    console.log(res);
		  },
		  error: function(xhr) {
		    console.log(xhr);
		  },
		  dataType : 'json'
		});
});

</script>

</body>

</html>