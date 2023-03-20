<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ include file ="../user/inc/user_header.jsp"%>

<%@ include file ="../user/inc/user_sidebar.jsp"%>

	
		<h3 class ="text-center" style="text-decoration: underline; text-underline-position : under;" >Write Board</h3>
		
		<form action="<c:url value="register.do"/>" method="post"> 
		
		 <div class="col-md-1">	 
			<div class="mt-3">
			<label for ="writer">writer. </label>
				<input type="text" class ="form-control" id="writer" value="${sessionScope.loginDto.name}"
					 name="writer" readonly/>
			</div>
		 </div>
		
			<div class="mt-3">
				<label for ="subject">Subject. </label>
				<input type="text" class ="form-control" id="subject"
					placeholder="글제목을 입력하세요" name="subject"/>
			</div>
	
			<div class="my-3">
				<label for ="contents">Contents. </label>
				<textarea class="form-control mt-2" rows="5" name="contents" id="contents" placeholder="내용을 입력하세요"></textarea>
			</div>
			
			<div class="text-center mt-3">
			<button class="btn btn bg-dark text-white">Register</button>	
			</div>
		</form>
	

<%@ include file ="../user/inc/user_footer.jsp"%>