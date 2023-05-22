<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%
	if(session.getAttribute("isLogin") == null){
		response.sendRedirect("admin/ad_login.jsp");
	}
%> --%>

<%@include file ="inc/ad_header.jsp" %>

<%@include file ="inc/ad_sidebar.jsp" %>
<!-- 마이페이지 자리 -->

<div class="container mt-5  col-md-8 mx-auto">
   <div class="border shadow-sm p-5 mb-3 w-100 mx-auto"> 
   
<div class= mt-5>
	<p class=text-center"><b>반갑습니다. ${sessionScope.loginDto.name}님</b><p>
</div>
	
	</div>
	</div>
<%@include file ="inc/ad_footer.jsp" %>



      

	
