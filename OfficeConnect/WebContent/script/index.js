function loginCheck(){
	
	event.preventDefault(); // submit버튼의 고유기능 방지
	
	let idValue = $('#idCheck').val();
	let pwValue = $('#pwCheck').val();
	let isAdminLogin = $("#adminLogin").prop("checked");
	let isKeepId = $("#keepId").prop("checked");

	if(idValue.length <= 0 || pwValue.length <= 0){
		alert("아이디 또는 비밀번호를 입력해주세요");
		return;
	}
	
	// 체크박스 상태 확인하고 아이디 저장
	if(isKeepId){
		localStorage.setItem('keepId', idValue);
	}else{
		// 체크박스 해제된 경우 저장된 아이디 제거
		localStorage.removeItem('keepId');
	}
	
	$.ajax({
		url : 'login.do',
		type : 'post',
		data : { 'emp_no': idValue,
				 'emp_pw' : pwValue,
				 'adminLogin' : isAdminLogin},
		success : function(res){
			
			if(res.isSuccess == 'fail' && isAdminLogin == true){
				alert("관리자 권한이 없습니다");
			} else if( res.isSuccess == 'fail' ){
				alert("아이디 또는 비밀번호를 확인해주세요.");
			}else{
				alert("로그인성공");
				location.href="main/main.do";
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})	
}