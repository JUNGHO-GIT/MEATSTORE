// ------------------------------------------------------------------------------------------------>
const sessionId = document.getElementById("id").value;
const ctxPath = new URL(location.href).pathname.split("/")[1];
function sessionAlert (event)  {
  if (sessionId == null || sessionId == "") {
    event.preventDefault();
    alert("로그인 후 이용해주세요.");
    window.location.href = `/${ctxPath}/member/loginForm.do`;
    return false;
  }
  else {
    return true;
  }
}
// ------------------------------------------------------------------------------------------------>
function del (id)  {
  let tmp;
  tmp = confirm("탈퇴하시겠습니까?");
  if (tmp) {
    document.location = "MemberDelete.jsp?mem_id=" + id;
  }
}
// ------------------------------------------------------------------------------------------------>
function idCheck (id)  {
  if (id == "") {
    alert("아이디를 입력해 주세요.");
    document.regForm.mem_id.focus();
  }
  else {
    url = "IdCheck.jsp?mem_id=" + id;
    window.open(url, "post", "width=300,height=150");
  }
}