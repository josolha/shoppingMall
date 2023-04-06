<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="inc/user_header.jsp" %>  
<div class="container w-25 shadow rounded border p-5 mt-5">

   <form action="${ctxPath}/user/insert.do" method="post">
      <h3 class="text-center mb-4" style="text-decoration: underline; text-underline-position : under;">User Register</h3>
            
         <div class="row">
         
         	<div>ID / PassWord.</div>
         	
            <div class="col-md-12 pe-0">
               <input class="form-control mb-2" type="text" id="id" name="id" placeholder="아이디"/>
               <a class="btn btn bg-dark text-light w-100 mb-2" onclick="idCheck()">ID Check.</a>
               <input class="form-control mb-2" type="password" name="pw" placeholder="비밀번호"/>
               <input class="form-control mb-2" type="password" name="pwCheck" placeholder="비밀번호 확인"/>
            </div>
            
            <div>Personal Info.</div>
            
            <div class="col-md-12 pe-0">
              <input class="form-control mb-2" type="text" name="name" placeholder="이름"/>
	         <input class="form-control mb-2" type="text" name="age" placeholder="나이"/>
	         <input class="form-control mb-2" type="text" name="email" placeholder="이메일"/>
	         <input class="form-control mb-2" type="text" name="phone" placeholder="전화번호"/>
	       	<div class="row">
            	<div class="col-md-6">
               		<input class="form-control mb-2" type="text" id="sample2_postcode" name="zipcode" placeholder="우편번호"/>
            	</div>
	            <div class="col-md-6">
	               <a class="btn btn bg-dark text-light w-100 mb-2" onclick="sample2_execDaumPostcode()">Search PostCode.</a>
	           	 </div>
         	</div>
	         <input class="form-control mb-2" type="text" id="sample2_address" placeholder="도로명주소" name="road_addr"/>
         	 <input class="form-control mb-2" type="text" id="sample2_extraAddress" placeholder="지번주소" name="jibun_addr"/>
        	 <input class="form-control" type="text" id="sample2_detailAddress" placeholder="상세주소" name="detail_addr"/>  
            </div>
         
         	<div class="text-center pt-4">
	            <input type="submit" class="btn btn-secondary" value="Sign Up"/>
	            <input type="reset" value="Cancle" class="btn btn bg-dark text-light"/>
         	</div>   
         	
         </div>
   </form>
   
   
   
   <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
   <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch; ">
      <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
   </div>
</div>

<!-- 아이디 중복체크 Modal -->
<div class="modal fade" id="chkModal" >
  <div class="modal-dialog modal-sm modal-dialog-centered mb-auto">
    <div class="modal-content" style="background : #fcf9ee">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title ms-auto ps-4 text-center">Duplicate Check.</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body text-center" id="chkMsg"></div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn bg-dark text-light" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>


<script>
   function idCheck(){
      var uid = $("#id").val();
      
      $.ajax({
         url:"<c:url value='/user/idCheck.do'/>",
         type:"get",
         data:{"uid":uid}, //서버에 전송할 데이터
         success : function(responseData){
        	 
            // responseData = "yes" : 사용가능, "no":사용불가
            // alert(responseData);
            if(responseData=="yes"){
               $("#chkMsg").html("사용가능한 아이디 입니다.");
            }else{
               $("#chkMsg").html("사용할 수 없는 아이디 입니다.");
            }
            $("#chkModal").modal("show");
         },
         error: function(){alert("error!!")}
      });
   }
   
   
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${ctxPath}/js/zipcode.js"></script>


<%@ include file="inc/user_footer.jsp" %>