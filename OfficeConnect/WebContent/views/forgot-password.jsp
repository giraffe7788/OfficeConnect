
<%@page import="vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String empNo = (String)request.getAttribute("empNo");
	String empTel = (String)request.getAttribute("empTel");
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
                                        <h1 class="h4 text-gray-900 mb-2">Office Connection</h1>
                                        <p class="mb-4">비밀번호 찾기</p>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" name="eNo" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="사번을 입력하세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="eTel" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="전화번호를 입력하세요.">
                                        </div>
<!--                                         <a href="login.jsp" class="btn btn-primary btn-user btn-block" id="newPw">  -->
                                           	<button type="button" id="newPw">비밀번호 새로 만들기</button>
<!--                                         </a> -->
                                    </form>
                                    <hr>

                                    <div class="text-center">
                                        <a class="small" href="login.jsp">로그인</a>
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
	alert();
	
	let eNo = $('[name="eNo"]').val();
	let eTel = $('[name="eTel"]').val();
	
	console.log(<%=empNo %>);
	
	if(<%=empNo %> == eNo){
        alert('사원 번호가 일치합니다.');
    }else{
        alert('사원 번호가 일치하지 않습니다.');
    }
	
});

</script>


</body>

</html>