$(document).ready(function  ()  {
  if (screen.width > 1024) {
    AOS.init({
      easing: "ease-in-out-sine",
      once: true,
    });
  }
});
new IntersectionObserver(function  (e, o)  {
  if (e[0].intersectionRatio > 0) {
    document.documentElement.removeAttribute("class");
  }
  else {
    document.documentElement.setAttribute("class", "stuck");
  }
});

// ------------------------------------------------------------------------------------------------>
function pwCheck ()  {
  if (document.updateForm.pw.value == "") {
    alert("암호는 필수 입력");
    document.updateForm.pw.focus();
    return false;
  }
}

// ------------------------------------------------------------------------------------------------>
function textHover ()  {
  const textHovers = document.querySelectorAll(".text-hover");
  textHovers.forEach((textHover) => {
    textHover.style.transition = "font-size 0.1s ease-in-out";
    textHover.style.display = "inline-block";
    textHover.style.cursor = "pointer";
    textHover.style.caretColor = "transparent";
    textHover.addEventListener("mouseenter", function  ()  {
      this.style.fontSize = `calc(\${getComputedStyle(this).fontSize} + 3px)`;
    });
    textHover.addEventListener("mouseleave", function  ()  {
      this.style.fontSize = "";
    });
  });
}

// ------------------------------------------------------------------------------------------------>
var sessionId = "${sessionScope.id}";
function sessionAlert (event)  {
  if (!sessionId) {
    event.preventDefault();
    alert("로그인 후 이용해주세요.");
    window.location.href = "${ctxPath}/member/loginForm.do";
    return false;
  }
  else {
    return true;
  }
}

// ------------------------------------------------------------------------------------------------>
const deprecated = (event) => {
  event.preventDefault();
  alert("점검중 입니다.");
  window.location.reload();
  return false;
};