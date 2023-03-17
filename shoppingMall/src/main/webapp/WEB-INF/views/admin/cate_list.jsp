<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file ="inc/ad_header.jsp"%>

<%@ include file ="inc/ad_sidebar.jsp"%>


	<div class="container mt-5 border shadow-sm p-5 mb-3 w-75">
		<h3 class ="text-center" style="text-decoration: underline; text-underline-position : under;">Category List</h3>
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
									       	}'>modify</button>
					<a href="${ctxPath}/categoryDel.do?cate_num=${cDto.cate_num}" class="btn btn-sm text-white" style="background-color: black;">delete</a></td>
				</tr>
				<c:set var="rowNum" value="${rowNum-1}"/>
			</c:forEach>
			
			</tbody>
		</table>
		
		<ul class="pagination justify-content-center mt-4">
		  <li class="page-item ${pageDto.prevPage <= 0 ? 'disabled':''}">
		     <a class="page-link bg-dark text-light" href="categoryList.do?viewPage=${pageDto.prevPage}&cntPerPage=${pageDto.cntPerPage}">Prev</a>
		  </li>
		  
		  <c:forEach var="i" begin="${pageDto.blockStart}" end="${pageDto.blockEnd}">
		     <li class="page-item ${pageDto.viewPage == i ? 'active':''}">
		        <a class="page-link bg-secondary text-light ${pageDto.viewPage == i ? 'border border-dark':''}" href="categoryList.do?viewPage=${i}&cntPerPage=${pageDto.cntPerPage}">${i}</a>
		     </li>
		  </c:forEach>
		  
		  <li class="page-item ${pageDto.blockEnd >= pageDto.totalPage ? 'disabled':''}">
		     <a class="page-link bg-dark text-light" href="categoryList.do?viewPage=${pageDto.nextPage}&cntPerPage=${pageDto.cntPerPage}">Next</a>
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

			</script>

<%@ include file ="inc/ad_footer.jsp"%>