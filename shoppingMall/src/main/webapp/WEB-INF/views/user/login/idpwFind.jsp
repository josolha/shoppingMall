<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/user_header.jsp" %>  
<div class="container w-50 shadow rounded border p-5 mt-5">
	
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link <c:if test="${requestScope.find == 'id'}">active</c:if>" data-bs-toggle="tab" href="#menu1">Find ID</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link <c:if test="${requestScope.find == 'pw'}">active</c:if>" data-bs-toggle="tab" href="#menu2">Find PW</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="menu1" class="container tab-pane <c:if test="${requestScope.find == 'id'}">active show</c:if>"><br>
	    
	    <div id="findIdSuccess" style="display : none" class="px-4">
	    	<p class="text-center mt-4">The ID for sign-up is "<b><span id="resultId"></span></b>"</p>
				<a class="btn btn-dark text-light mt-3 w-50 mx-auto d-block" role="button" href="${ctxPath}/user/login.do">Login</a>
	    </div>
	    
	    
	    <div id="findIdBefore" class="px-4">	
	     	 <p>Please enter your <b>Name</b> and <b>Phone Number</b>.</p>
		      <input class="form-control mb-2 " type="text" id="name" name="name" placeholder="이름"/>
	         <input class="form-control mb-2" type="text" id="phone" name="phone" placeholder="전화번호"/>
	         <input class="btn btn bg-dark text-light mt-3 w-50 mx-auto d-block" type="button" value="Find ID" onclick="idFind()"/>
         </div>
         
	    </div>
	    
	    <div id="menu2" class="container tab-pane <c:if test="${requestScope.find == 'pw'}">active show</c:if>"><br>
	    
	    	<div id="findPwSuccess" style="display : none" class="px-4 text-center">
		    	<p class="text-center">
			    <small>A temporary password has been sent to your email.<br/>
				  Please login and change your password on the my page.</small>
		    	</p>
				<a class="btn btn-dark text-light mt-3 w-50 mx-auto d-block" role="button" href="${ctxPath}/user/login.do">Login</a>
	    	</div>
	    	
	    	<div id="findPwBefore" class="px-4">	
	      	  <p>Please enter your <b>ID</b>  and <b>Email</b> during the registration process.</p>
		      <input class="form-control mb-2" type="text" id="id" name="id" placeholder="아이디"/>
	         <input class="form-control mb-2" type="text" id="email" name="email" placeholder="이메일"/>
	         <input class="btn btn bg-dark text-light mt-3 w-50 mx-auto d-block" type="button" value="Find PW"  onclick="pwFind()"/>
	         </div>
	         
	    </div>
	  </div>
</div>


<script>

	function idFind(){
		var name = $('#name').val();
		var phone = $('#phone').val();
		
		$.ajax({
			url : "${ctxPath}/user/findId.do?name="+name+"&phone="+phone,
			type : "post",
			success: function(data){ //data는 찾기 실패시  0, 아이디 찾으면 해당 아이디 값
				if(data ==0){
					alert("이름 및 휴대폰 번호를 다시 확인하기 바랍니다.")
				}else{ //id 찾기 성공
					$("#findIdBefore").css("display","none");
					$("#findIdSuccess").css("display","block");
					$("#resultId").text(data);
				}
			},
			error : function(){alert("아이디 찾기 요청 실패")}
		});
	
	}

	function pwFind(){
		var id = $('#id').val();
		var email = $('#email').val();
		
		$.ajax({
			url : "${ctxPath}/user/findPw.do?id="+id+"&email="+email,
			type : "post",
			success:function(data){
				if(data==0){
					alert("아이디 및 이메일를 다시 확인하세요");
				}else{
					$("#findPwBefore").css("display","none");
					$("#findPwSuccess").css("display","block");
				}
			},
			error:function(){alert("비밀번호 찾기 요청 실패")}
			
			
		});
	
	}



</script>



<%@ include file="../inc/user_footer.jsp" %>  