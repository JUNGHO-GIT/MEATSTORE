
// ------------------------------------------------------------------------------------------------>
function delPwCheck ()  {
  if (document.delForm.pw.value == null) {
    alert("암호는 필수입력");
    document.delForm.pw.focus();
    return false;
  }
  return true;
}

// ------------------------------------------------------------------------------------------------>
function upPwCheck ()  {
  if (document.updateForm.pw.value == null) {
    alert("암호는 필수입력");
    document.updateForm.pw.focus();
    return false;
  }
  return true;
}

// ------------------------------------------------------------------------------------------------>
function boardCheck ()  {
  if ($("#writer").val() == "") {
    alert("이름을 입력 하세요");
    $("#writer").focus();
    return false;
  }
  if ($("#subject").val() == "") {
    alert("글제목을 입력 하세요");
    $("#subject").focus();
    return false;
  }
  if ($("#content").val() == "") {
    alert("내용을 입력 하세요");
    $("#content").focus();
    return false;
  }
  if ($("#pw").val() == "") {
    alert("암호를 입력하세요");
    $("#pw").focus();
    return false;
  }
  return true;
}

// ------------------------------------------------------------------------------------------------>
function setThumbnail (event)  {
  let reader = new FileReader();
  reader.onload = function  (event)  {
    let img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.setAttribute("width", "300px");
    img.setAttribute("height", "300px");
    img.setAttribute("style", "border: 1px solid #e9ecef; border-radius: 5px;");
    img.setAttribute("style", "box-shadow: 1px 1px 1px 1px #e9ecef;");
    let imageContainer = document.querySelector("div#image_container");
    while (imageContainer.firstChild) {
      imageContainer.removeChild(imageContainer.firstChild);
    }
    imageContainer.appendChild(img);
  };
  reader.readAsDataURL(event.target.files[0]);
}
