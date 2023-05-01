/**
 * aa.js
 */
function updateCheck(){
   if($('#pw').val()==''){
      alert("암호를 입력 하세요");
      $('#pw').focus();
      return false;
   }
   
   if($('#pw2').val()==''){
      alert("암호확인를 입력 하세요");
      $('#pw2').focus();
      return false;
   }
   
   if($('#pw').val()!=$('#pw2').val()){
      alert("암호와 암호확인이 다릅니다");
      $('#pw').val('').focus();
      $('#pw2').val('');
      return false;
   }
   return true
}//updateCheck()---end

function loginCheck(){
   if($('#id').val()==''){
      alert("ID를 입럭하세요");
      $('#id').focus();
      return false;
   }
   if($('#pw').val()==''){
      alert("암호를 입력하세요");
      $('#pw').focus();
      return false;
   }
   
   return true;
}///////loginCheck()

//게시판
function check(){
   if($('#writer').val()==''){
      alert("이름을 입력 하세요");
      $('#writer').focus();
      return false;
   }
   
   if($('#subject').val()==''){
      alert("글제목을 입력 하세요");
      $('#subject').focus();
      return false;
   }
   
   if($('#content').val()==''){
      alert("글내용을 입력 하세요");
      $('#content').focus();
      return false;
   }
   
   if($('#pw').val()==''){
      alert("암호를 입력하세요");
      $('#pw').focus();
      return false;
   }
   return true;
}
//회원가입

function check2(){
   
   if($('#id').val()==''){
      alert("ID를 입력 하세요");
      $('#id').focus();
      return false;
   }
   if($('#pw').val()==''){
      alert("암호를 입력 하세요");
      $('#pw').focus();
      return false;
   }
   
   if($('#pw2').val()==''){
      alert("암호확인를 입력 하세요");
      $('#pw2').focus();
      return false;
   }
   
   if($('#pw').val()!=$('#pw2').val()){
      alert("암호와 암호확인이 다릅니다");
      $('#pw').val('').focus();
      $('#pw2').val('');
      return false;
   }
   
   if($('#name').val()==''){
      alert("이름을 입력 하세요");
      $('#name').focus();
      return false;
   }
   if($('#email').val()==''){
      alert("이메일을 입력 하세요");
      $('#email').focus();
      return false;
   }
   if($('#tel').val()==''){
      alert("전화을 입력 하세요");
      $('#tel').focus();
      return false;
   }
   return true;
}//check2() -end