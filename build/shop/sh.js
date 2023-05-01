/**
 * 
 */
 //장바구니 업데이트
   function cartUpdate(form){//***********
      form.flag.value="update";
      if(quantity.value==0){
    	  alert("수량 1개 이상 입력해주세요");
    	  return false;
      }
      
      form.submit();
   }
   
   //장바구니 내용 삭제 
   function cartDelete(form) {//***************
      //alert("cartDelete"); 
      form.flag.value="del";
      form.submit();
   }
   