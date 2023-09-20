function updateEmp() {

	event.preventDefault(); // submit버튼의 고유기능 방지

	let empNo = $('#empNo').text();
	let empPw = $('#empPw').val();
	let empName = $('#empName').val();
	let empEmail = $('#empEmail').val();
	let empTel = $('#empTel').val();
	let empAddr = $('#empAddr').val();
	let empPosit = $('#empPosit').text();
	let empDept = $('#empDept').text();
	let empState = $('#empState').text();
	let isAdmin = $('#isAdmin').prop("checked");

	if (empPw == null || empPw == "") {
		empPw = $("#empPw").data("default");
	}
	if (empName == null || empName == "") {
		empName = $("#empName").data("default");
	}
	if (empEmail == null || empEmail == "") {
		empEmail = $("#empEmail").data("default");
	}
	if (empTel == null || empTel == "") {
		empTel = $("#empTel").data("default");
	}
	if (empAddr == null || empAddr == "") {
		empAddr = $("#empAddr").data("default");
	}

	if (empPosit == "직급" || empDept == "부서" || empState == "업무상태") {
		alert("직급 또는 부서 또는 업무상태 선택 해주세요");
		return;
	}

	$.ajax({
		url: 'update.do',
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
			'empState': empState,
			'isAdmin': isAdmin,
		},
		success: function(res) {

			if (res.isSuccess == 'fail') {
				alert("회원정보 수정중 오류가 발생했습니다");
			} else if (res.isSuccess == 'ok') {
				alert("회원정보가 성공적으로 수정되었습니다");
				location.href = "./detail.do?empNo=" + empNo;
			}
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

// 클릭 이벤트 핸들러 함수
function deleteEmp() {

	var isDelete = confirm("사원을 삭제하시겠습니까?");
	let empNo = $('#empNo').text();

	if (isDelete) {
		$.ajax({
			url: 'delete.do',
			type: 'post',
			data: {
				'empNo': empNo
			},
			success: function(res) {

				if (res.isSuccess == 'fail') {
					alert("회원정보삭제중 오류가 발생했습니다");
				} else if (res.isSuccess == 'ok') {
					alert("회원정보가 삭제되었습니다");
					location.href = "./list.do";
				}
			},
			error: function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType: 'json'
		})
	}
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

				// ajax로 정보 /img/update.do로 넘겨준다음
				// 정보 받아오고 alert띄운다음 다시 detail.do로 복귀
				let empNo = $('#empNo').text();
				var formData = new FormData();
				formData.append('empNo', empNo);

				// 이미지 파일 추가
				var imageInput = $('#fileInput')[0];
				var imageFile = imageInput.files[0];
				if (imageFile) {
					formData.append('image', imageFile);
				}

				$.ajax({
					url: '../img/update.do',
					type: 'post',
					data: formData,
					contentType: false,
					processData: false,
					success: function(res) {
						if (res.isSuccess == 'fail') {
							alert("사원 프로필사진 수정 중 오류가 발생했습니다");
						} else if (res.isSuccess == 'ok') {
							alert("사원 프로필사진 수정이 성공적으로 되었습니다");
						}
					},
					error: function(xhr) {
						alert("상태 : " + xhr.status);
					},
					dataType: 'json'
				});

			} else {
				alert("선택한 파일은 이미지가 아닙니다.");
			}
		}
	});
});