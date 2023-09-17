function registerEmp() {
	
    event.preventDefault(); // submit 버튼의 고유 기능 방지

    let empNo = $('#empNo').val();

	$.ajax({
        url: 'check.do',
        type: 'post',
        data: {'empNo': empNo},
        contentType: false,
        
        success: function(res) {
            if (res.isExist == 'ok') {
                alert("중복된 사번입니다.");
				return;
            } else if (res.isExist == 'fail') {
				console.log("중복x");
            }
        },
        error: function(xhr) {
            alert("상태 : " + xhr.status);
        },
        dataType: 'json'
    });

    let empPw = temp_pw_issuance();
    let empName = $('#empName').val();
    let empEmail = $('#empEmail').val();
    let empTel = $('#empTel').val();
    let empAddr = $('#empAddr').val();
    let empPosit = $('#empPosit').text();
    let empDept = $('#empDept').text();
    let isAdmin = $('#isAdmin').prop("checked");

    if (!empNo || !empName || !empEmail || !empTel || !empAddr || empPosit == "직급" || empDept == "부서") {
        alert("모든 값을 입력해주세요");
        return;
    }

    var formData = new FormData();
    
    // 이미지 파일 추가
    var imageInput = $('#fileInput')[0];
    var imageFile = imageInput.files[0];
    if (imageFile) {
        formData.append('image', imageFile);
    }

    formData.append('empNo', empNo);
    formData.append('empPw', empPw);
    formData.append('empName', empName);
    formData.append('empEmail', empEmail);
    formData.append('empTel', empTel);
    formData.append('empAddr', empAddr);
    formData.append('empPosit', empPosit);
    formData.append('empDept', empDept);
    formData.append('isAdmin', isAdmin);

    $.ajax({
        url: 'join.do',
        type: 'post',
        data: formData,
        contentType: false,
        
        processData: false,
        success: function(res) {
            if (res.isSuccess == 'fail') {
                alert("사원 추가 중 오류가 발생했습니다");
            } else if (res.isSuccess == 'ok') {
                alert("사원 추가가 성공적으로 되었습니다");
                location.href = "./list.do";
            }
        },
        error: function(xhr) {
            alert("상태 : " + xhr.status);
        },
        dataType: 'json'
    });
}


function temp_pw_issuance() {
	let ranValue1 = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
	let ranValue2 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
	let ranValue3 = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
	let ranValue4 = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')'];

	var temp_pw = "";

	for (i = 0; i < 2; i++) {
		let ranPick1 = Math.floor(Math.random() * ranValue1.length);
		let ranPick2 = Math.floor(Math.random() * ranValue2.length);
		let ranPick3 = Math.floor(Math.random() * ranValue3.length);
		let ranPick4 = Math.floor(Math.random() * ranValue4.length);
		temp_pw = temp_pw + ranValue1[ranPick1] + ranValue2[ranPick2] + ranValue3[ranPick3] + ranValue4[ranPick4];
	}

	return temp_pw;
}

$(document).ready(function() {
	$('#fileInput').change(function() {
		// 파일이 선택되었을 때 호출되는 함수
		var selectedFile = $(this)[0].files[0]; // 선택된 파일 객체
		if (selectedFile) {

			// 이미지 파일인지 확인
			if (selectedFile.type.startsWith('image/')) {
				// 선택한 이미지 파일을 미리보기 이미지에 표시
				var selectedImage = $('#imageView');
				var objectURL = URL.createObjectURL(selectedFile);
				selectedImage.attr('src', objectURL);
			} else {
				alert("선택한 파일은 이미지가 아닙니다.");
			}
		}
	});
});
