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

    <title>관리자페이지</title>

    <!-- 아이콘 설정 -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- css 설정 -->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../script/empRegister.js?ver=1"></script>
<style>
#dataTable_wrapper {
	overflow-x : hidden;
}
</style>
</head>

<body id="page-top">

    <!-- 페이지 Wrapper -->
    <div id="wrapper">

        <!-- 사이드바 include -->
        <%@ include file="./aside.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 메인 Content -->
            <div id="content">

                <!-- 헤더 include -->
                <%@ include file="./header.jsp" %>

                <!-- 페이지 Content 시작 -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800" style = "text-align : center">신규사원추가</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" style="margin-top : 1%; width:50%; margin-left : 25%">
                        <div class="card-body">
                            <form class="user" enctype="multipart/form-data">
                            	<img src="../images/defaultProfile.png" alt="기본프로필" id="imageView" style="width:20%; margin-left:40%; margin-bottom:2%">
                        		<input type="file" class="btn btn-primary btn-user btn-block" id="fileInput" style="width:30%; margin-left:35%; margin-bottom:2%">
                                    &nbsp;
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="empNo"
                                            placeholder="사번">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="empName"
                                            placeholder="이름">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="empEmail"
                                            placeholder="이메일">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="empTel"
                                        placeholder="전화번호">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="empAddr"
                                        placeholder="주소" style="width : 88%; display:inline-block">
                                    <a href="#" id="addressSearchButton" class="btn btn-primary btn-icon-split btn-sm" style="margin-left : 1%;">
                                        <span class="text">주소찾기</span>
                                    </a>
                                </div>
                                <div class="form-group">
                                    <nav class="navbar navbar-expand navbar-light bg-light mb-4">
                                        <a class="navbar-brand" href="#" style="font-size : 1em" id="empPosit">직급</a>
                                        <ul class="navbar-nav ml-auto">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    	
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right animated--grow-in"
                                                    aria-labelledby="navbarDropdown" id="dropdown-position" style = "text-align : center">
                                                    <a class="dropdown-item" href="#">사원</a>
                                                    <a class="dropdown-item" href="#">대리</a>
                                                    <a class="dropdown-item" href="#">과장</a>
                                                    <a class="dropdown-item" href="#">차장</a>
                                                    <a class="dropdown-item" href="#">부장</a>
                                                    <a class="dropdown-item" href="#">대표</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <div class="form-group">
                                    <nav class="navbar navbar-expand navbar-light bg-light mb-4">
                                        <a class="navbar-brand" href="#" style="font-size : 1em" id="empDept">부서</a>
                                        <ul class="navbar-nav ml-auto">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    	
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right animated--grow-in"
                                                    aria-labelledby="navbarDropdown" id="dropdown-department" style = "text-align : center">
                                                    <a class="dropdown-item" href="#">개발부</a>
                                                    <a class="dropdown-item" href="#">디자인부</a>
                                                    <a class="dropdown-item" href="#">인사부</a>
                                                    <a class="dropdown-item" href="#">총무부</a>
                                                    <a class="dropdown-item" href="#">기획부</a>
                                                    <a class="dropdown-item" href="#">사업부</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <div class="form-group">
                                	<label for="isAdmin"><b>관리자여부&nbsp;<b></b></label>
                                    <input type="checkbox" id="isAdmin">
                                </div>
                                <a href="#" class="btn btn-primary btn-user btn-block" onclick="registerEmp()">
                                    사원 추가
                                </a>
                            </form>
                            
                            
                        </div>
                        
                    </div>

                </div>

                <!-- 페이지 Content 끝 -->

            </div>
            <!-- 메인 Content 끝 -->

        </div>
        <!-- Content Wrapper 끝 -->

    </div>
    <!-- 페이지 Wrapper 끝 -->

	<!-- 공통속성 설정 include -->
    <%@ include file="./common.jsp" %>
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
   	$('#dropdown-position a').click(function () {
    	var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기
    	
    	    // 업무상태 수정 해야함
    		$('#empPosit').text(selectedText); // navbar-brand의 텍스트 변경
	});
   	$('#dropdown-department a').click(function () {
    	var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기
    	
    	    // 업무상태 수정 해야함
    		$('#empDept').text(selectedText); // navbar-brand의 텍스트 변경
	});
    </script>
    
    
    <!-- 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	// 주소 찾기 버튼 클릭 시 실행되는 함수
	function openAddressSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
			var selectedAddress = data.address; //선택한 주소 가져오기
			setAddress(selectedAddress); // 주소를 입력 필드에 채우는 함수 호출
		
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수
		
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
			extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
			extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
		
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample4_postcode').value = data.zonecode;
			document.getElementById("sample4_roadAddress").value = roadAddr;
			document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		
			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			if(roadAddr !== ''){
			document.getElementById("sample4_extraAddress").value = extraRoadAddr;
		
			} else {
			document.getElementById("sample4_extraAddress").value = '';
			}
		
			var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if(data.autoRoadAddress) {
			var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
			guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
			guideTextBox.style.display = 'block';
		
			} else if(data.autoJibunAddress) {
			var expJibunAddr = data.autoJibunAddress;
			guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
			guideTextBox.style.display = 'block';
			} else {
			guideTextBox.innerHTML = '';
			guideTextBox.style.display = 'none';
			}
		
			// 모달 종료
			$('#infoChangeModal').modal('hide');
			}
		}).open();
	}
	function setAddress(address) {
		document.getElementById('empAddr').value = address;
	}
		// 주소 찾기 버튼에 이벤트 리스너 추가
		document.getElementById('addressSearchButton').addEventListener('click', openAddressSearch);
	</script>
</body>

</html>