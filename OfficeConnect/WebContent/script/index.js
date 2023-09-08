function loginCheck(){
	
	event.preventDefault(); // submit버튼의 고유기능 방지
	
	let idValue = $('#idCheck').val();
	let pwValue = $('#pwCheck').val();
	
	if(idValue.length <= 0 || pwValue.length <= 0){
		alert("아이디또는 비밀번호를 입력해주세요");
		return;
	}
	
	$.ajax({
		url : 'login.do',
		type : 'post',
		data : { 'emp_no': idValue,
				 'emp_pw' : pwValue },
		success : function(res){
			
			if( res.isSuccess == 'fail' ){
				alert("아이디나 비밀번호를 확인해주세요.");
			}else{
				alert("로그인성공");
				//쿠키에 접속자 아이디 저장 후 main.jsp로 보낸다.
//				setCookie("user_id", idValue, 1);
				location.href="./main.jsp";
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}