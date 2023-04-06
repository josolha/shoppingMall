<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/user_header.jsp"%>

<%@ include file ="inc/user_sidebar.jsp"%>    

<div class="container w-50 shadow rounded border p-5 mt-5">
   
        <h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Change PassWord</h3>
         <input type="text" id="memberId" value="${sessionScope.loginDto.id}" style="display:none"/> 
         
         <p id="pwChkMsg" class="my-3" style="height : 30px"></p>      	
         <input class="form-control mb-2" type="password" id="pw" name="pw" placeholder="현재 비밀번호"/>
         <input class="form-control mb-2" type="password" id="newPw" name="newPw" placeholder="새로운 비밀번호"/>
         <input class="form-control mb-2" type="password" id="newPwConfirm" name="newPwConfirm" placeholder="비밀번호 확인"/>
                
         <div class="text-center pt-4">
            <button type="button" id="pwChangeBtn" class="btn btn-sm text-white" style="background-color: black;">Change</button>
         </div>
         
         <div class="mt-3" >
        	 <a href="${ctxPath}/user/idpwFind.do?find=pw" style="font-size:13px">forgot password?</a>
         </div>	
</div>


<script>
   var pw = "";
   var currentPwChk = "";
   var newPwChk = "";
   var newPwConfirmChk = "";
   
   
 
   // 현재 비밀번호가 데이터베이스에 있는 비밀번호 인지 체크하기
   
   function pwCheck(){
	   pw = $('#pw').val();
	   console.log("pw :"+ pw);
	   
	   $.ajax({
		  url : "${ctxPath}/pwCheck.do",
		  type : "post",
		  data : {"pw": pw},
		  async : false,
		  success: function(result){
			  console.log("result :" +result);
			  if(result=="ok"){
				  alert("현재 비밀번호 확인완료");
				  currentPwChk = true;
			  }else{
				  alert("현재 비밀번호 다시 확인 요망");
				  currentPwChk = false;
			  }
			  console.log("currentPwChk :" +currentPwChk);
		  },
		  error : function(){alert("사용중인 비밀번호가 틀렸습니다.");}
	   });
	   
   }
   // 새비밀번호 유효성 검사
   $("#newPw").on("keyup",function(){
	  var npValue = $("#newPw").val(); 
	  if(npValue ==""){
		  $("#pwChkMsg").text("새 비밀번호를 입력하세요.");
		  newPwChk =false;
	  }else if(npValue.length<4){
		  $("#pwChkMsg").text("4자리 이상 입력하세요.");
		  newPwChk =false;
	  }else{
		  $("#pwChkMsg").text("");
		  newPwChk =true;
	  }
   });
   
   // 새 비밀번호 확인 체크
   $("#newPwConfirm").on("keyup",function(){
		  var npcValue = $("#newPwConfirm").val(); 
		  if(npcValue ==""){
			  $("#pwChkMsg").text("새 확인 비밀번호를 입력하세요.");
			  newPwConfirmChk = false;
		  }else if($("#newPw").val() != npcValue){
			  $("#pwChkMsg").text("비밀번호가 일치하지 않습니다.");
			  newPwConfirmChk = false;
		  }else{
			  $("#pwChkMsg").text("");
			  newPwConfirmChk = true;
		  }
	   });
   
   $("#pwChangeBtn").on("click",function(){
	   
	   pwCheck();
	   
	   //console.log("currentPwChk :" +currentPwChk); 
	   
	   if(currentPwChk ==false){
		   alert("현재 비밀번호를 다시 확인하세요");
	   }else if(newPwChk == false){
		   alert("새 비밀번호를 다시 확인하세요");
	   }else if(newPwConfirmChk ==false){
		   alert("새 비밀번호가 일치하지 않습니다");
	   }else if(currentPwChk && newPwChk && newPwConfirmChk ){
		   var id = $("#memberId").val();
		   var pw = $("#newPw").val();
		   
		   var member = {
				"id" : id,
				"pw" : pw
		   };
		   
		   $.ajax({
			   url : "${ctxPath}/pwChange.do",
			   type : "post",
			   data : JSON.stringify(member),
			   contentType : "application/json; charset=utf-8",
			   success : function(result){
				   if(result > 0){
						alert("비밀번호 변경처리 되었습니다. 새로운 비밀번호로 로그인 하세요.");
						location.href="${ctxPath}/user/logout.do?mode=change";
						/* location.href="${ctxPath}/memberLogout.do?mode=change"; */
				   }
			   },
			   error :function(){alert("비밀번호 변경 요청 실패")} 
		   });
	   }// if문
   });
   
</script>


<%@ include file ="inc/user_footer.jsp"%>