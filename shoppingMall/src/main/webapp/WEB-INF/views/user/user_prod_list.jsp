<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%@ include file ="inc/user_header.jsp"%>

<%@ include file ="inc/user_sidebar.jsp"%>

	
				
				
				
<%-- 				<a href="${ctxPath}/user/products.do?spec=NEW"> New Products.</a>
				<a href="${ctxPath}/user/products.do?spec=RECOMMAND"> Recommend Products.</a>
				<a href="${ctxPath}/user/products.do?spec=HIT"> HIT Products.</a>
				<a href="${ctxPath}/user/products.do"> All Products.</a> --%>
				
<%-- 					<c:forEach var="spec" items="${map}"> 		
						<h4 class="mt-4">[${spec.key}] Product.</h4><hr/>
						<!-- 카드를 감싸는 태그를 시작 -->  
						<div class="d-flex mt-3">  
							<c:set var="cnt" value="0"/>
							<c:forEach var="pDto" items="${spec.value}">				
							  <%@ include file="inc/prod_card.jsp" %>
							 </c:forEach>
						</div> 
					</c:forEach> --%>
					<c:forEach var="cate_name" items="${map}">
					<h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">${cate_name.key}</h3> 		
							<a href="${ctxPath}/products/${cate_code}/new"> New.</a>
							<a href="${ctxPath}/products/${cate_code}/recommend"> Recommend.</a>
							<a href="${ctxPath}/products/${cate_code}/hit"> Hit.</a>
							<a href="${ctxPath}/products/${cate_code}/all"> All.</a>
						<h4 class="mt-4">[${map[cate_name.key][0].PSpec}]</h4><hr/>
						<!-- 카드를 감싸는 태그를 시작 -->  
						<div class="d-flex mt-3">  
							<c:set var="cnt" value="0"/>
							<c:forEach var="pDto" items="${cate_name.value}">				
							  <%@ include file="inc/prod_card.jsp" %>
							 </c:forEach>
						</div> 
					</c:forEach>
				
	

<%@ include file ="inc/user_footer.jsp"%>