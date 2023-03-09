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
}


// --------------------adjax로 delete 활용-----------------------------

//$(function() {
//	  $(document).on("click", "#removeBtn", function(e) {
//	    e.preventDefault();
//	    var cnum = $(this).closest("tr").find("#cnum").text();
//	    deleteFunc.remove(cnum, function(result) {
//	      alert(result);
//	    });
//	  });
//	});
//
//	var deleteFunc = (function() {
//	  function remove(cnum, cb) {
//	    $.ajax({
//	      url: "categoryList?cnum=" + cnum,
//	      type: "get",
//	      dataType : "json", //응답 형식
//	      success: function(result) {
//	        if (cb) {
//	          cb(result);
//	        }
//	      },
//	      error: function() {
//	        alert("요청 실패!!");
//	      }
//	    });
//	  }
//	  return {
//	    remove: remove
//	  };
//	})();

/**
 * 
 */