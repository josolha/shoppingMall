<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file ="inc/ad_header.jsp" %>

	<div class="container mt-5 border w-25 shadow-sm p-5">
	
		<h3>관리자 로그인</h3>
		
		<form action="${ctxPath}/adminLoginOk.do" method="post">
		
			<div class="my-3">
				<label>아이디 : </label>
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디" value=""/>
				
				<%-- <c:if test="${loginErr == 'idErr'}"> --%>
				<p class="text-danger">관리자 아이디를 확인하세요!!</p>
				<%-- </c:if> --%>
			</div>			
			
			<div class="my-3">
				<label>비밀번호</label>
				<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" value=""/>
				<%-- <c:if test="${loginErr == 'pwErr'}"> --%>
				<p class="text-danger">비밀번호를 확인하세요!!</p>
				<%-- </c:if> --%>
			</div>
			
			<div class="text-center">
				<input type="submit" class="btn btn-primary btn-sm" value="로그인"/>				
			</div>
			
		</form>
			
	</div>
<%@ include file="inc/ad_footer.jsp" %>