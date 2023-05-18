<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%@ include file ="inc/user_header.jsp"%>

<%@ include file ="inc/user_sidebar.jsp"%>

					
						<h3 class="text-center text-decoration-underline">${pdView.cate_name}</h3> 		
							
							
						   <form id="searchForm" method="get" action="${ctxPath}/products/${cate_code}/${spec}">
			   
						      <div class="d-flex justify-content-center mt-5">
		
						         <input type="text" id="keyWord" name="keyWord" placeholder="상품 이름 찾기"
						            style="width:200px" class="form-control rounded-0 rounded-start" value="${pdView.keyWord}"/>
						            
						         <button class="btn btn-dark text white rounded-0 rounded-end"><i class="bi bi-search"></i></button>
						         
						      </div>
						      
						   </form>
						
		
					<h4 class="mt-2">[${pdView.spec}]</h4>
						
					 <div class="mt-2 d-flex justify-content-between">
						  <div>
						    <b>${pdView.viewPage}</b> / ${pdView.totalPage} pages 
						  </div>
						  
					     <div class="d-flex justify-content-end ">
					   		<a href="${ctxPath}/products/${cate_code}/all?keyWord=${pdView.keyWord}&cntPerPage=${pdView.cntPerPage}" class="link-btn me-3 mb-3">All.</a>
						    <a href="${ctxPath}/products/${cate_code}/new?keyWord=${pdView.keyWord}&cntPerPage=${pdView.cntPerPage}" class="link-btn me-3 mb-3">New.</a>
						    <a href="${ctxPath}/products/${cate_code}/recommend?keyWord=${pdView.keyWord}&cntPerPage=${pdView.cntPerPage}" class="link-btn me-3 mb-3">Recommend.</a>
						    <a href="${ctxPath}/products/${cate_code}/hit?keyWord=${pdView.keyWord}&cntPerPage=${pdView.cntPerPage}" class="link-btn me-3 mb-3">Hit.</a>
						</div>
						  
						  
						  <div>
						    <select class="form-select form-select-sm" id="cntPerPage">
						      <c:choose>
						        <c:when test = "${pdView.totalCnt <= 4}">
						          <option value="5" <c:out value="${pdView.cntPerPage == 4 ? 'selected':''}"/>>No Option</option>
						        </c:when>
						        <c:when test = "${pdView.totalCnt > 4 && pdView.totalCnt< 8}">            
						          <option value="4" <c:out value="${pdView.cntPerPage == 4 ? 'selected':''}"/>>View by 4</option>
						          <option value="8"<c:out value="${pdView.cntPerPage == 8 ? 'selected':''}"/>>View by 8</option>
						        </c:when>
						        <c:when test = "${pdView.totalCnt >= 8 && pdView.totalCnt < 12}">
						          <option value="4" <c:out value="${pdView.cntPerPage == 4 ? 'selected':''}"/>>View by 4</option>
						          <option value="8" <c:out value="${pdView.cntPerPage == 8 ? 'selected':''}"/>>View by 8</option>         
						        </c:when>
						        <c:otherwise>
						          <option value="4" <c:out value="${pdView.cntPerPage == 4 ? 'selected':''}"/>>View by 4</option>
						          <option value="8" <c:out value="${pdView.cntPerPage == 8 ? 'selected':''}"/>>View by 8</option>
						          <option value="12" <c:out value="${pdView.cntPerPage == 12 ? 'selected':''}"/>>View by 12</option>	
						        </c:otherwise>
						      </c:choose>
						    </select>
						  </div>
						</div>
					  <hr/>
						
					 
						<!-- 카드를 감싸는 태그를 시작 -->  
						<div class="d-flex mt-3">  
							<c:set var="cnt" value="0"/>
							<c:forEach var="pDto" items="${pdView.product}">				
								<%@ include file="inc/prod_card.jsp" %>
							</c:forEach>
						</div>
						
						<ul class="pagination justify-content-center mt-4">
						  <li class="page-item ${pdView.prevPage <= 0 ? 'd-none':''}">
						     <a class="page-link bg-dark text-light" href="${ctxPath}/products/${cate_code}/${spec}?viewPage=${pdView.prevPage}&cntPerPage=${pdView.cntPerPage}&keyWord=${pdView.keyWord}">Prev</a>
						  </li>
						  
						  <c:forEach var="i" begin="${pdView.blockStart}" end="${pdView.blockEnd}">
						     <li class="page-item ${pdView.viewPage == i ? 'active':''}">
						        <a class="page-link bg-secondary text-light ${pdView.viewPage == i ? 'border border-dark':''}" href="${ctxPath}/products/${cate_code}/${spec}?viewPage=${i}&cntPerPage=${pdView.cntPerPage}&keyWord=${pdView.keyWord}">${i}</a>
						     </li>
						  </c:forEach>
						  
						  <li class="page-item ${pdView.blockEnd >= pdView.totalPage ? 'd-none':''}">
						     <a class="page-link bg-dark text-light" href="${ctxPath}/products/${cate_code}/${spec}?viewPage=${pdView.nextPage}&cntPerPage=${pdView.cntPerPage}&keyWord=${pdView.keyWord}">Next</a>
						  </li>
						</ul>
						
					<script>	
					$("#cntPerPage").change(function(e){
					      let cntVal = $("#cntPerPage option:selected").val();
					      location.href="<c:url value='/products/${cate_code}/${spec}?viewPage=1&keyWord=${pdView.keyWord}&cntPerPage='/>"+cntVal;      
					   });
					</script>
				

<%@ include file ="inc/user_footer.jsp"%>