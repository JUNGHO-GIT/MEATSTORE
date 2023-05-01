
// delpwcheck()
function delpwcheck() {
	if(document.delForm.pw.value == null) {
		alert("암호는 필수입력");
		document.delForm.pw.focus();
		return false;
	}
	return true;
}

// uppwcheck()
function uppwcheck() {
	if(document.updateForm.pw.value == null) {
		alert("암호는 필수입력");
		document.updateForm.pw.focus();
		return false;
	}
	return true;
}

function check() {
	if($('#writer').val()=='') {
		alert("이름을 입력 하세요");
		$('#writer').focus();
		return false;
	}

	if($('#subject').val()=='') {
		alert("글제목을 입력 하세요");
		$('#subject').focus();
		return false;
	}

	if($('#content').val()=='') {
		alert("내용을 입력 하세요");
		$('#content').focus();
		return false;
	}

	if($('#pw').val()=='') {
		alert("암호를 입력하세요");
		$('#pw').focus();
		return false;
	}
	return true;
}
			