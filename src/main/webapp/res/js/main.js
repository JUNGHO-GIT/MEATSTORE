$(document).ready(function  ()  {
  if (screen.width > 0) {
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
function applyHoverEffect() {
  const elements = document.getElementsByClassName("linkHover");

  for (let i = 0; i < elements.length; i++) {
    elements[i].addEventListener("mouseover", function(event) {
      // 기존의 사이즈, 두께, 색상을 저장
      event.target.dataset.originalFontSize
      = window.getComputedStyle(event.target, null).getPropertyValue('font-size');
      event.target.dataset.originalFontWeight
      = window.getComputedStyle(event.target, null).getPropertyValue('font-weight');
      event.target.dataset.originalColor
      = window.getComputedStyle(event.target, null).getPropertyValue('color');

      // 새로운 사이즈, 두께, 색상을 적용
      const newFontSize = parseInt(event.target.dataset.originalFontSize) + 3;
      const newFontWeight = event.target.style.fontWeight = "900";
      const newColor = event.target.style.color = "#872d35";

      event.target.style.fontSize = newFontSize + 'px';
      event.target.style.fontWeight = newFontWeight;
      event.target.style.color = newColor;
      event.target.style.cursor = "pointer";
    });

    elements[i].addEventListener("mouseout", function(event) {
      // 기존의 색상, 두ꨁ, 사이즈로 복구
      event.target.style.color = event.target.dataset.originalColor;
      event.target.style.fontWeight = event.target.dataset.originalFontWeight;
      event.target.style.fontSize = event.target.dataset.originalFontSize;
      event.target.style.cursor = "pointer";
    });
  }
}
document.addEventListener('DOMContentLoaded', (event) => {applyHoverEffect();});