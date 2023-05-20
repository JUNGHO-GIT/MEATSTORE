
// ------------------------------------------------------------------------------------------------>
function cartUpdate (form)  {
  form.flag.value = "update";
  if (quantity.value == 0) {
    alert("수량 1개 이상 입력해주세요");
    return false;
  }
  form.submit();
}

// ------------------------------------------------------------------------------------------------>
function cartDelete (form)  {
  form.flag.value = "del";
  form.submit();
}

// ------------------------------------------------------------------------------------------------>
function productDetail (code)  {
  document.detail.code.value = code;
  document.detail.submit();
}

// ------------------------------------------------------------------------------------------------>
function productUpdate (num)  {
  document.updateForm.num.value = num;
  document.updateForm.submit();
}

// ------------------------------------------------------------------------------------------------>
function productDelete (num)  {
  document.delForm.num.value = num;
  document.delForm.submit();
}

// ------------------------------------------------------------------------------------------------>
function del (id)  {
  var tmp;
  tmp = confirm("탈퇴하시겠습니까?");
  if (tmp) {
    document.location = "MemberDelete.jsp?mem_id=" + id;
  }
}
