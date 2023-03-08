/**
 *  유효성 검사
 */
 
function cateInputChk(){
   if(document.categoryForm.code.value.length == 0){
      alert("카테고리 코드를 입력하세요");
      categoryForm.code.focus();
      return;
   }
   if(document.categoryForm.cate_name.value.length == 0){
      alert("카테고리 명을 입력하세요");
      categoryForm.cate_name.focus();
      return;
   } 
   document.categoryForm.submit();
} /**
 * 
 */