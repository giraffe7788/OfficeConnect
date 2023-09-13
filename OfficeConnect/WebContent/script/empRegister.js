function registerEmp() {
	
	event.preventDefault(); // submit버튼의 고유기능 방지

	let empNo = $('#empNo').val();
	let empPw = temp_pw_issuance();
	let empName = $('#empName').val();
	let empEmail = $('#empEmail').val();
	let empTel = $('#empTel').val();
	let empAddr = $('#empAddr').val();
	let empPosit = $('#empPosit').text();
	let empDept = $('#empDept').text();
	let isAdmin = $('#isAdmin').prop("checked");
	
	if(!empNo || !empName || !empEmail || !empTel || !empAddr || empPosit == "직급" || empDept == "부서"){
		alert("모든 값을 입력해주세요");
		return;
	}

	$.ajax({
		url: 'http://localhost:8888/OfficeConnect/emp/join.do',
		type: 'post',
		data: {
			'empNo': empNo,
			'empPw': empPw,
			'empName': empName,
			'empEmail': empEmail,
			'empTel': empTel,
			'empAddr': empAddr,
			'empPosit': empPosit,
			'empDept': empDept,
			'isAdmin': isAdmin,
		},
		success: function(res) {

			if (res.isSuccess == 'fail') {
				alert("사원 추가중 오류가 발생했습니다");
			} else if(res.isSuccess == 'ok'){
				alert("사원 추가가 성공적으로 되었습니다");
				location.href = "./list.do";
			}
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

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
		
	    return temp_pw;
}