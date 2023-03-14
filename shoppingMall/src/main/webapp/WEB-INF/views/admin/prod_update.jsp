<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/ad_header.jsp"%>

<%@ include file ="inc/ad_sidebar.jsp"%>

<div class="container mt-5 border shadow-sm p-5 mb-3 w-50">
	<h3 class="text-center" style="text-decoration: underline; text-underline-position : under;" >Product Info.</h3>
	<form action="productUpdateOk.do" method="post" enctype="multipart/form-data">
		<table class="table table-borderless mt-4">
			<tbody>
				<tr>
					<td>Product No.</td>
					<td>${pDto.PNum}<input type="hidden" class="form-control form-control-sm" name="pNum" value="${pDto.PNum}"/></td>
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
								
									<c:if test="${category.code == pDto.PCategory_fk}">
										<option value="${category.code}" selected>[${category.code}]. ${category.cate_name}</option>
									</c:if>
									
									<c:if test="${category.code != pDto.PCategory_fk}">
										<option value="${category.code}">[${category.code}]. ${category.cate_name}</option>
									</c:if>
								</c:forEach>
								
							</c:if>
						</select>
					</td>
				</tr>
				<tr>
						<td>Product Name.</td>
						<td><input type="text" class="form-control form-control-sm" name="pName"  value="${pDto.PName}"/></td>
					</tr>
					<tr>
						<td>Made.</td>
						<td><input type="text" class="form-control form-control-sm" name="pCompany" value="${pDto.PCompany}"/></td>
					</tr>
					<tr>
						<td>Image.</td>
						<td>
							<img src="${ctxPath}/resources/file_repo/${pDto.PImage}" id="previewImg" width="100px"/>
							
							
							<!-- 이미지를 수정했을 경우  -->
							<input type="file" class="form-control form-control-sm" name="file" onchange="previewImage()"/>
							
							<!-- 이미지를 수정하지 않고 그대로 사용할 경우 -->
							<input type="hidden" class="form-control form-control-sm" name="pImage" value="${pDto.PImage}"/>
							
						</td>
					</tr>
					<tr>
						<td>Quantity.</td>
						<td><input type="text" class="form-control form-control-sm" name="pQty" value="${pDto.PQty}"/></td>
					</tr>
					<tr>
						<td>Price.</td>
						<td><input type="text" class="form-control form-control-sm" name="price" value="${pDto.price}"/></td>
					</tr>
					<tr>
						<td>Grade.</td>
						<td>
							<select class="form-select form-select-sm" name="pSpec">
							
								<option value="NORMAL" selected> NORMAL</option>
								
								<c:forEach var="spec" items="${pdSpecs}">
								
									<c:if test="${pDto.PSpec == spec.name()}">
										<option value="${spec.name()}" selected>${spec.value}</option>
									</c:if>
									
									<c:if test="${pDto.PSpec != spec.name()}">
										<option value="${spec.name()}">${spec.value}</option>
									</c:if>
									
								</c:forEach>
								
							</select>
						</td>
					</tr>
					<tr>
						<td>Information.</td>
						<td><textarea class="form-control form-control-sm" rows="3" name="pContent">${pDto.PContent}</textarea></td>
					</tr>
					<tr>
						<td>Product Point.</td>
						<td><input type="text" class="form-control form-control-sm" name="pPoint" value="${pDto.PPoint}"/></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit"  class="btn btn-sm text-white" style="background-color: black;" value="Modify"/>
							<input type="reset" class="btn btn-sm btn-secondary" value="Cancle"/>
						</td>
					</tr>
				</tbody>			
			</table>
		</form>	
	</div>
	<script>
	
	function previewImage() {
	  var input = document.querySelector('input[name="file"]');
	  var file = input.files[0];
	  var reader = new FileReader();

	  reader.addEventListener("load", function () {
	    var image = document.getElementById('previewImg');
	    image.src = reader.result;
	  }, false);

	  if (file) {
	    reader.readAsDataURL(file);
	  }
	}
	</script>
	
<%@ include file ="inc/ad_footer.jsp"%>