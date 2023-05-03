function pwCheck() {
	if (document.updateForm.pw.value == "") {
		alert("암호는 필수 입력");
		document.updateForm.pw.focus();
		return false;
	}
}