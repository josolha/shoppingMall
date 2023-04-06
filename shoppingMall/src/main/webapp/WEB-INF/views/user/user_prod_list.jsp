,.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%@ include file ="inc/user_header.jsp"%>

<%@ include file ="inc/user_sidebar.jsp"%>

	
				
				<h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Product List</h3>
					<c:forEach var="spec" items="${map}"> 		
						<h4 class="mt-4">[${spec.key}] Product.</h4><hr/>
						<!-- 카드를 감싸는 태그를 시작 -->  
						<div class="d-flex mt-3">  
							<c:set var="cnt" value="0"/>
							<c:forEach var="pDto" items="${spec.value}">				
							  <%@ include file="inc/prod_card.jsp" %>
							 </c:forEach>
						</div> 
					</c:forEach>
				
	

<%@ include file ="inc/user_footer.jsp"%>