<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/ad_header.jsp"%>

<%@ include file ="inc/ad_sidebar.jsp"%>

<c:if test="${requestScope.msg !=null}">
<script>
	alert("${requestScope.msg}");
</script>
</c:if>


      <div class="container mt-5 border shadow-sm p-5 mb-3 w-100">
        <h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Product List</h3>
        <table class="table mt-5">
          <thead>
            <tr>
              <th>No.</th>
              <th>Category Code.</th>
              <th>Image.</th>
              <th>Name.</th>
              <th>Price.</th>
              <th>Made.</th>
              <th>Quantity.</th>
              <th>Modify/Delete.</th>
            </tr>
          </thead>
          
       
          <tbody>
          	<c:set var ="rowNum" value= "${pageDto.startRowNum}"/>
            <c:forEach var="dto" items="${requestScope.dtos}">
              <tr>
                <td>${rowNum}</td>
                <td>${dto.PCategory_fk}</td>
                <td>
                  <img src="${ctxPath}/resources/file_repo/${dto.PImage}" style="width:60px" />
                </td>
                <td>${dto.PName}</td>
                <td>${dto.price}</td>
                <td>${dto.PCompany}</td>
                <td>${dto.PQty}</td>
                <td>
                  <!-- <button onclick="openModal(this)" class="btn btn-secondary btn-sm">Modify</button> -->
                  <a href="productUpdate.do?pNum=${dto.PNum}" class="btn btn-secondary btn-sm">Modify</a>
                  <a href="javascript:pdDel('${dto.PNum}','${dto.PImage}')" class="btn btn-sm text-white" style="background-color: black;">Delete</a>
                </td>
              </tr>
              <c:set var="rowNum" value="${rowNum-1}"/>
            </c:forEach>
          </tbody>
          
        </table>
        		
			<ul class="pagination justify-content-center mt-4">
			  <li class="page-item ${pageDto.prevPage <= 0 ? 'd-none':''}">
			     <a class="page-link bg-dark text-light" href="productList.do?viewPage=${pageDto.prevPage}&cntPerPage=${pageDto.cntPerPage}">Prev</a>
			  </li>
			  
			  <c:forEach var="i" begin="${pageDto.blockStart}" end="${pageDto.blockEnd}">
			     <li class="page-item ${pageDto.viewPage == i ? 'active':''}">
			        <a class="page-link bg-secondary text-light ${pageDto.viewPage == i ? 'border border-dark':''}" href="productList.do?viewPage=${i}&cntPerPage=${pageDto.cntPerPage}">${i}</a>
			     </li>
			  </c:forEach>
			  
			  <li class="page-item ${pageDto.blockEnd >= pageDto.totalPage ? 'd-none':''}">
			     <a class="page-link bg-dark text-light" href="productList.do?viewPage=${pageDto.nextPage}&cntPerPage=${pageDto.cntPerPage}">Next</a>
			  </li>
			</ul>
      </div>
   
  


		<%-- <!--모달창 -->
			<div class="modal" id="productModal">
				  <div class="modal-dialog modal-lg modal-dialog-centered mb-auto">
				    <div class="modal-content" style="background : #fcf9ee">
				
				      <!-- Modal Header -->
				      <div class="modal-header border-1 text-center">
				        <h5 class="modal-title ms-auto ps-4">Product Info.</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				      </div>
				
				      <!-- Modal Body -->
				      <form action="${ctxPath}/categoryUpdate.do" method="get">
				        <table class="table table-borderless mt-4">
						<tbody>
						<tr>
							<td>Product No.</td>
							<td>${dto.PNum}<input type="hidden" class="form-control form-control-sm" name="pNum" value="${dto.PNum}"/></td>
						</tr>
					
						<tr>
							<td>Category.</td>
							<td>
								<select class="form-select form-select-sm" name="pCategory_fk">
									<c:if test="${categoryList==null || categoryList.size()==0}">
										<option value="">Empty Category.</option>
									</c:if>
									<c:if test="${categoryList!=null || categoryList.size()!=0}">
									
										<c:forEach var="category" items="${categoryList}">
										
											<c:if test="${category.code == pDto.pCategory_fk}">
												<option value="${category.code}" selected>[${category.code}]. ${category.cate_name}</option>
											</c:if>
											
											<c:if test="${category.code != pDto.pCategory_fk}">
												<option value="${category.code}">[${category.code}]. ${category.cate_name}</option>
											</c:if>
										</c:forEach>
										
									</c:if>
								</select>
							</td>
						</tr>
						<tr>
								<td>Product Name.</td>
								<td><input type="text" class="form-control form-control-sm" name="pName"  value="${pDto.pName}"/></td>
							</tr>
							<tr>
								<td>Made.</td>
								<td><input type="text" class="form-control form-control-sm" name="pCompany" value="${pDto.pCompany}"/></td>
							</tr>
							<tr>
								<td>Image.</td>
								<td>
									<img src="${ctxPath}/resources/file_repo/${pDto.pImage}" width="100px"/>
									
									<!-- 이미지를 수정했을 경우  -->
									<input type="file" class="form-control form-control-sm" name="pImage"/>
									
									<!-- 이미지를 수정하지 않고 그대로 사용할 경우 -->
									<input type="hidden" class="form-control form-control-sm" name="pImageOld" value="${pDto.pImage}"/>
								</td>
							</tr>
							<tr>
								<td>Quantity.</td>
								<td><input type="text" class="form-control form-control-sm" name="pQty" value="${pDto.pQty}"/></td>
							</tr>
							<tr>
								<td>Price.</td>
								<td><input type="text" class="form-control form-control-sm" name="price" value="${pDto.price}"/></td>
							</tr>
							<tr>
								<td>Grade.</td>
								<td>
									<select class="form-select form-select-sm" name="pSpec">
										<option value="none" selected> NORMAL</option>
										<c:forEach var="spec" items="${pdSpecs}">
											<c:if test="${pDto.pSpec == spec.name()}">
												<option value="${spec.name()} selected">${spec.value}</option>
											</c:if>
											<c:if test="${pDto.pSpec != spec.name()}">
												<option value="${spec.name()}">${spec.value}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>Information.</td>
								<td><textarea class="form-control form-control-sm" rows="3" name="pContent">${pDto.pContent}</textarea></td>
							</tr>
							<tr>
								<td>Product Point.</td>
								<td><input type="text" class="form-control form-control-sm" name="pPoint" value="${pDto.pPoint}"/></td>
							</tr>
							<tr>
								<td colspan="2" class="text-center">
									<input type="submit"  class="btn btn-sm text-white" style="background-color: black;" value="Modify"/>
									<input type="button" class="btn btn-sm btn-secondary"data-bs-dismiss="modal" value="Cancle"/>
								</td>
							</tr>
						</tbody>			
						</table>
				      </form>
				
				    </div>
				  </div>
				</div> --%>



<script>
	function pdDel(pNum, pImage){
		var isDel = window.confirm("삭제 하시겠습니까?");
		if(isDel) location.href = "productDel.do?pNum="+pNum+"&pImage="+pImage;
	}
	

	function openModal(button) {
	  $('#productModal').modal('show');
	}
</script>	


<%@ include file ="inc/ad_footer.jsp"%>