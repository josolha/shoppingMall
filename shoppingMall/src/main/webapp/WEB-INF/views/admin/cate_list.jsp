<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file ="inc/ad_header.jsp"%>

<%@ include file ="inc/ad_sidebar.jsp"%>


	<div class="container mt-5 border shadow-sm p-5 mb-3 w-100">
		<h3 class ="text-center" style="text-decoration: underline; text-underline-position : under;">Category List</h3>
		
		<div class="mt-5 d-flex justify-content-between">
		
			   <div class="mt-2">
			      <b>${pageDto.viewPage}</b> / ${pageDto.totalPage} pages 
			   </div>
			   
			   <form id="searchForm" method="post" action="categoryList.do">
			   
			      <div class="d-flex justify-content-center">
			         <select class="form-select me-2" style="width:100px" name="searchType">
			         	<!-- 선택을 꼭 하게 js 설정 필요 -->
			            <option value="">선택</option>
			            <option value="C" <c:out value="${pageDto.searchType == 'C' ? 'selected' : ''}"/>>Code.</option>
			            <option value="N" <c:out value="${pageDto.searchType == 'N' ? 'selected' : ''}"/>>Name.</option>
			         </select>
			         
			         <input type="text" id="keyWord" name="keyWord" placeholder="검색어 입력"
			            style="width:200px" class="form-control rounded-0 rounded-start" value="${pageDto.keyWord}"/>
			            
			         <button class="btn btn-dark text white rounded-0 rounded-end"><i class="bi bi-search"></i></button>
			         
			      </div>
			      
			   </form>
			  
			  <!-- 검색이 없을 경우 -->
			  <c:if test="${pageDto.searchType == null || pageDto.searchType == ''}">
			   <div class="mt-2">
			      <select class="form-select form-select-sm" id="cntPerPage">         
			         <option value="5"
			            <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>View by 5</option>
			         <option value="10"
			            <c:out value="${pageDto.cntPerPage == 10 ? 'selected':''}"/>>View by 10</option>
			         <option value="20"
			            <c:out value="${pageDto.cntPerPage == 20 ? 'selected':''}"/>>View by 20</option>
			      </select>
			   </div>
			   </c:if>
			   
			   <!-- 검색할 경우 -->
			   <c:if test="${pageDto.searchType != null && pageDto.searchType != ''}">
			   <div>
			      <select class="form-select form-select-sm" id="cntPerPage">
			      <c:choose>
			         <c:when test = "${pageDto.totalCnt <= 5}">
			            <option value="5" <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>No Option</option>
			         </c:when>
			         
			         <c:when test = "${pageDto.totalCnt > 5 && pageDto.totalCnt< 10}">            
			            <option value="5" <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>View by 5</option>
			            <option value="10"<c:out value="${pageDto.cntPerPage == 10 ? 'selected':''}"/>>View by 10</option>
			         </c:when>
			         
			         <c:when test = "${pageDto.totalCnt >= 10 && pageDto.totalCnt < 20}">
			            <option value="5" <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>View by 5</option>
			         	<option value="10" <c:out value="${pageDto.cntPerPage == 10 ? 'selected':''}"/>>View by 10</option>         
			         </c:when>
			         
			         <c:otherwise>
				         <option value="5" <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>View by 5</option>
				         <option value="10" <c:out value="${pageDto.cntPerPage == 10 ? 'selected':''}"/>>View by 10</option>
				         <option value="20" <c:out value="${pageDto.cntPerPage == 20 ? 'selected':''}"/>>View by 20</option>	
			         </c:otherwise>
			         
			         </c:choose>
			      </select>
			   </div>
			   </c:if>
		   </div>
		  
		<table class="table mt-4">
			<thead>
				<tr>
					<th width="25%">No.</th>
					<th width="25%">Code.</th>
					<th width="25%">Name.</th>
					<th width="25%">Modify / Delete.</th>
				</tr>
			</thead>
			<tbody>
			
			<!-- Ajax 처리 시도 -->
			<c:set var="rowNum" value="${pageDto.startRowNum}"/>
			<c:forEach var="cDto" items="${requestScope.cDtos}">
				<tr>
					<%-- <td id="cnum">${cDto.cate_num}</td> --%>
					<td>${rowNum}</td>
					<td>${cDto.code}</td>
					<td>${cDto.cate_name}</td>
					<td><button class="btn btn-secondary btn-sm" onclick="openModal(this)" 
							data-cate-dto='{"cateNum": "${cDto.cate_num}",
									       "cateCode": "${cDto.code}",
									       "cateName": "${cDto.cate_name}",
									       "rowNum": "${rowNum}"
									       	}'>Modify</button>
									       	
					<a href="${ctxPath}/categoryDel.do?cate_num=${cDto.cate_num}" class="btn btn-sm text-white" style="background-color: black;">Delete</a></td>
				</tr>
				<c:set var="rowNum" value="${rowNum-1}"/>
			</c:forEach>
			
			</tbody>
		</table>
		
		<ul class="pagination justify-content-center mt-4">
		  <li class="page-item ${pageDto.prevPage <= 0 ? 'd-none':''}">
		     <a class="page-link bg-dark text-light" href="categoryList.do?viewPage=${pageDto.prevPage}&cntPerPage=${pageDto.cntPerPage}&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}">Prev</a>
		  </li>
		  
		  <c:forEach var="i" begin="${pageDto.blockStart}" end="${pageDto.blockEnd}">
		     <li class="page-item ${pageDto.viewPage == i ? 'active':''}">
		        <a class="page-link bg-secondary text-light ${pageDto.viewPage == i ? 'border border-dark':''}" href="categoryList.do?viewPage=${i}&cntPerPage=${pageDto.cntPerPage}&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}">${i}</a>
		     </li>
		  </c:forEach>
		  
		  <li class="page-item ${pageDto.blockEnd >= pageDto.totalPage ? 'd-none':''}">
		     <a class="page-link bg-dark text-light" href="categoryList.do?viewPage=${pageDto.nextPage}&cntPerPage=${pageDto.cntPerPage}&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}">Next</a>
		  </li>
		</ul>
	</div>
	
			<!-- Cate update Modal -->
			<div class="modal" id="cateModal">
			  <div class="modal-dialog modal-sm modal-dialog-centered mb-auto">
			    <div class="modal-content" style="background : #fcf9ee">
			
			      <!-- Modal Header -->
			      <div class="modal-header border-1 text-center">
			        <h5 class="modal-title ms-auto ps-4">Category Info.</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
			
			      <!-- Modal Body -->
			      <form action="${ctxPath}/categoryUpdate.do" method="get">
			        <div class="modal-body p-4">
			        
					   <div class="mb-3">
			            <label for="cate_num" class="form-label">No.</label>
			            <input type="text" class="form-control" id="rowNum" name="rowNum" readonly>
			            <input type="hidden" class="form-control" id="cate_num" name="cate_num">
			          </div>	
								        
			          <div class="mb-3">
			            <label for="code" class="form-label">Code.</label>
			            <input type="text" class="form-control" id="code" name="code">
			          </div>
			          
			          <div class="mb-3">
			            <label for="cate_name" class="form-label">Name.</label>
			            <input type="text" class="form-control" id="cate_name" name="cate_name">
			          </div>
			          
			        </div>
			
			        <!-- Modal Footer -->
			        <div class="modal-footer border-0 justify-content-center">
			          <button type="submit" class="btn btn-secondary btn-sm">Update</button>
			          <button type="button" class="btn btn-sm text-white" style="background-color: black;" data-bs-dismiss="modal">Close</button>
			        </div>
			      </form>
			
			    </div>
			  </div>
			</div>
			
			
			<script>
				function openModal(button) {
					
				  // html에 저장한 data 가져옴
				  var cateDtoStr = button.getAttribute('data-cate-dto');
				  var cateDto = JSON.parse(cateDtoStr);
				   
				  // 모달 폼에 데이터를 채움
				  document.getElementById('code').value = cateDto.cateCode;
				  document.getElementById('cate_name').value = cateDto.cateName;
				  document.getElementById('rowNum').value = cateDto.rowNum;
				  document.getElementById('cate_num').value = cateDto.cateNum;
													
			 

				  // 모달 창을 열음
				  $('#cateModal').modal('show');
				}
				
				 $("#cntPerPage").change(function(e){
				      let cntVal = $("#cntPerPage option:selected").val();
				      location.href="<c:url value='categoryList.do?viewPage=1&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}&cntPerPage='/>"+cntVal;      
				   });
			</script>

<%@ include file ="inc/ad_footer.jsp"%>