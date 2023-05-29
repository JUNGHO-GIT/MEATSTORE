
// ------------------------------------------------------------------------------------------------>
function productCheck() {
  if ($("#name").val() == "") {
    alert("상품명을 입력하세요");
    $("#name").focus();
    return false;
  }
  if ($("#code").val() == "") {
    alert("코드명을 입력하세요");
    $("#code").focus();
    return false;
  }
  if ($("#price").val() == "") {
    alert("상품가격을 입력하세요");
    $("#price").focus();
    return false;
  }
  if ($("#content").val() == "") {
    alert("상품설명을 입력하세요");
    $("#content").focus();
    return false;
  }
  if ($("#stock").val() == "") {
    alert("상품명을 입력하세요");
    $("#stock").focus();
    return false;
  }
  if ($("#comp").val() == "") {
    alert("회사명을 입력하세요");
    $("#comp").focus();
    return false;
  }
  return true;
}

// ------------------------------------------------------------------------------------------------>
function loginCheck() {
  if ($("#memId").val() == "") {
    alert("아이디를 입력해 주세요.");
    $("#memId").focus();
    return ;
  }
  if ($("#pw").val() == "") {
    alert("비밀번호를 입력해 주세요.");
    $("#pw").focus();
    return ;
  }
  document.login.submit();
}

// ------------------------------------------------------------------------------------------------>
function insertCheck() {
  if ($("#mem_id").val() == "") {
    alert("아이디를 입력해 주세요.");
    $("#mem_id").focus();
    return ;
  }
  if ($("#mem_passwd").val() == "") {
    alert("비밀번호를 입력해 주세요.");
    $("#mem_passwd").focus();
    return ;
  }
  if ($("#mem_repasswd").val() == "") {
    alert("비밀번호를 확인해 주세요");
    $("#mem_repasswd").focus();
    return ;
  }
  if ($("#mem_name").val() == "") {
    alert("이름을 입력해 주세요.");
    $("#mem_name").focus();
    return ;
  }
  if ($("#mem_num1").val() == "") {
    alert("주민번호을 입력해 주세요.");
    $("#mem_num1").val().focus();
    return ;
  }
  if ($("#mem_num2").val() == "") {
    alert("주민번호을 입력해 주세요.");
    $("#mem_num2").focus();
    return ;
  }
  if ($("#mem_email").val() == "") {
    alert("이메일을 입력해 주세요.");
    $("#mem_email").focus();
    return ;
  }
  if ($("#mem_phone").val() == "") {
    alert("연락처를 입력해 주세요.");
    $("#mem_phone").focus();
    return ;
  }
  if ($("#mem_job").val() == "0") {
    alert("직업을 선택해 주세요.");
    $("#mem_job").focus();
    return ;
  }
  if ($("#mem_passwd").val() != $("#mem_repasswd").val()) {
    alert("비밀번호가 일치하지 않습니다.");
    $("#mem_passwd").focus();
    return ;
  }
  let jumin1 = regForm.mem_num1.value;
  let jumin2 = regForm.mem_num2.value;
  let jumin = jumin1 + jumin2;
  let index = "234567892345";
  let total = 0;
  for (let i = 0; i < 12; i++) total += parseInt(jumin.charAt(i) * index.charAt(i));
  total = 11 - (total % 11);
  if (total == 10) total = 0;
  else if (total == 11) total = 1;
  if (total != jumin.charAt(12)) {
    alert("주민번호를 다시 확인하세요.");
    document.regForm.mem_num1.value = "";
    document.regForm.mem_num2.value = "";
    document.regForm.mem_num1.focus();
    return ;
  }
  if (document.regForm.mem_email.value == "") {
    alert("이메일을 입력해 주세요.");
    document.regForm.mem_email.focus();
    return ;
  }
  let str = document.regForm.mem_email.value;
  let atPos = str.indexOf("@");
  let atLastPos = str.lastIndexOf ("@");
  let dotPos = str.indexOf (".");
  let spacePos = str.indexOf(" ");
  let commaPos = str.indexOf(",");
  let eMailSize = str.length;
  if (atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 && commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
  else {
    alert("E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!");
    document.regForm.mem_email.focus();
    return ;
  }
  document.regForm.submit();
}
// ------------------------------------------------------------------------------------------------>
function zipCheck() {
  url = "ZipCheck.jsp?check=y";
  window.open(url, "post", "toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");
}
// ------------------------------------------------------------------------------------------>
function deprecated(event) {
  event.preventDefault();
  alert("점검중 입니다.");
  window.location.reload();
};
