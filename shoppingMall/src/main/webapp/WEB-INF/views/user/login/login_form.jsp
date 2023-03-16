<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/user_header.jsp" %>  
<div class="container w-25 shadow rounded border p-5 mt-5">

   <form action="${ctxPath}/userLogin.do" method="post">
   	<input type="hidden" name="moveUrl" value="${moveUrl}"/>
      <h3 class="text-center mb-4">Login</h3>      
		
		 <c:if test = "${result ==0}">
		 	<p class="text-center text-danger">사용자 아이디 또는 비밀번호를 다시 확인하세요.</p>
  		 </c:if>
  		 
  		 <c:if test = "${sessionScope.loginMsg != null}">
				<p class="text-center text-danger my-3">${sessionScope.loginMsg}</p>
		 </c:if>
		 
		 <c:remove var="loginMsg" scope="session"/>
  		 
         <input class="form-control mb-2" type="text" id ="id" name="id" placeholder="아이디"/>
         <input class="form-control mb-2" type="password" id ="pw" name="pw" placeholder="비밀번호"/>
            
         
         <div class="text-center pt-4">
            <input type="submit" class="btn btn w-100 text-white"style="background-color: black;" value="로그인"/>
         </div>   
   </form>
   <div class= "mt-3 w-100 findIdPw">
   		<div class = "d-flex justify-content-between">
   			<div><i class="fa fa-lock"></i> <a href="${ctxPath}/idPwFind2.do?find=id">아이디</a> <a href="${ctxPath}/idPwFind2.do?find=pw">비밀번호 찾기</a></div>
   			<div><i class="fa fa-user-plus"></i> <a href="${ctxPath}/userRegister.do">회원가입</a></div>
   		</div>
   </div>
</div>
<!-- 유호성 검사  -->

<script>
function inputChk(){
   if(document.joinForm.id.value.length == 0){
      alert("아이디를 입력하세요!!");
      joinForm.id.focus();
      return;
   }
   if(document.joinForm.pw.value.length == 0){
      alert("비밀번호를 입력하세요!!");
      joinForm.pw.focus();
      return;
   }
   if(document.joinForm.pw.value != document.joinForm.pwConfirm.value){
      alert("비밀번호가 일치하지 않습니다!!");
      joinForm.pwConfirm.focus();
      return;
   }
   
}
 </script>

<%@ include file="../inc/user_footer.jsp" %>