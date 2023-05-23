<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
    String userType = (String)session.getAttribute("userType");

    if("admin".equals(userType)) {
%>
        <%@ include file ="../admin/inc/ad_header.jsp"%>
        <%@ include file ="../admin/inc/ad_sidebar.jsp"%>
<%
    } else { // 일반 유저인 경우 혹은 userType이 설정되지 않은 경우
%>
        <%@ include file ="../user/inc/user_header.jsp"%>
        <%@ include file ="../user/inc/user_sidebar.jsp"%>
<%
    }
%>

  <div class="container mt-5  col-md-8 mx-auto">
   		 <div class="border shadow-sm p-5 mb-3 w-100 mx-auto"> 


	
		<h3 class ="text-center" style="text-decoration: underline; text-underline-position : under;" >Write Board</h3>
		
		<form action="<c:url value="register.do"/>" method="post"> 
		
		 <div class="col-md-1">	 
			<div class="mt-3">
			<label for ="writer">writer. </label>
				<input type="text" class ="form-control" id="writer" value="${sessionScope.loginDto.id}"
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
		</div>
		</div>
	

<%@ include file ="../user/inc/user_footer.jsp"%>