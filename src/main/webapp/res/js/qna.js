
// ------------------------------------------------------------------------------------------------>
function qnaPwCheck ()  {
  if (document.updateForm.pw.value == "") {
    alert("암호는 필수 입력");
    document.updateForm.pw.focus();
    return false;
  }
}

// ------------------------------------------------------------------------------------------------>
function qnaCheck ()  {
  if ($("#writer").val() == "") {
    alert("이름을 입력 하세요");
    $("#writer").focus();
    return false;
  }

  if ($("#title").val() == "") {
    alert("글제목을 입력 하세요");
    $("#title").focus();
    return false;
  }

  if ($("#content").val() == "") {
    alert("글내용을 입력 하세요");
    $("#content").focus();
    return false;
  }

  if ($("#pw").val() == "") {
    alert("암호 를 입력하세요");
    $("#pw").focus();
    return false;
  }
  return true;
}