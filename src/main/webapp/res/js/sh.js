function cartUpdate(form) {
	form.flag.value = "update";
	if (quantity.value == 0) {
		alert("수량 1개 이상 입력해주세요");
		return false;
	}
	form.submit();
}

function cartDelete(form) {
	form.flag.value = "del";
	form.submit();
}