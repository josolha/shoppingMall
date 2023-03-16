<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file ="inc/ad_header.jsp" %>

	<div class="container mt-5 border w-25 shadow-sm p-5">
	
		<h3 class="text-center">Admin Login</h3>
		
		<form action="${ctxPath}/adminLogin.do" method="post">
		
			<div class="my-3">
				<label>ID : </label>
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디" value=""/>
				
				<c:if test="${loginErr == 'idErr'}"> 
				<p class="text-danger">관리자 아이디를 확인하세요</p>
				</c:if>
				
			</div>			
			
			<div class="my-3">
				<label>PW :</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" value=""/>
				
				<c:if test="${loginErr == 'pwErr'}">
					<p class="text-danger">비밀번호를 확인하세요</p>
				</c:if>
				
				
			</div>
			
			<div class="text-center">
				<button type="submit" class="btn btn text-white" style="background-color: black;">로그인</button>				
			</div>
			
		</form>
			
	</div>
	
	
<%@ include file="inc/ad_footer.jsp" %>