<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%
	if(session.getAttribute("isLogin") == null){
		response.sendRedirect("admin/ad_login.jsp");
	}
%> --%>

<%@include file ="inc/ad_header.jsp" %>

	<div class="container mt-5">
		<h5>Menu</h5>
		<ul>
			<li><a href="categoryInput.do" style="text-decoration:none">카테고리 등록</a></li>
			<li><a href="categoryList.do" style="text-decoration:none">카테고리 리스트</a></li>
			<li><a href="productInput.do" style="text-decoration:none">상품 등록</a></li>
			<li><a href="prodList.do"style="text-decoration:none">상품 리스트</a></li>			
		</ul>
	</div>
<%@include file ="inc/ad_footer.jsp" %>



      

	
