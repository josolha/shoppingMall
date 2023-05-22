<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/ad_header.jsp"%>

<%@ include file ="inc/ad_sidebar.jsp"%>

<div class="container mt-5  col-md-8 mx-auto">
   <div class="border shadow-sm p-5 mb-3 w-75 mx-auto"> 
   
	<h3 class="text-center" style="text-decoration: underline; text-underline-position : under;" >Product Register</h3>
	<form action="${ctxPath}/admin/productAdd.do" method="post" enctype="multipart/form-data">
		<table class="table table-borderless mt-4">
			<tbody>
				<tr>
					<td>Category.</td>
					<td>
						<select class="form-select form-select-sm" name="pCategory_fk">
							<c:if test="${categoryList==null || categoryList.size()==0}">
								<option value="">Empty Category.</option>
							</c:if>
							<c:if test="${categoryList!=null || categoryList.size()!=0}">
								<c:forEach var="category" items="${categoryList}">
								<option value="${category.code}">[${category.code}]. ${category.cate_name}</option>
								</c:forEach>
							</c:if>
						</select>
					</td>
				</tr>
				<tr>
						<td>Product Name.</td>
						<td><input type="text" class="form-control form-control-sm" name="pName"/></td>
					</tr>
					<tr>
						<td>Made.</td>
						<td><input type="text" class="form-control form-control-sm" name="pCompany"/></td>
					</tr>
					<tr>
						<td>Image.</td>
						<td><input type="file" class="form-control form-control-sm" name="file"/></td>
					</tr>
					<tr>
						<td>Quantity.</td>
						<td><input type="text" class="form-control form-control-sm" name="pQty"/></td>
					</tr>
					<tr>
						<td>Price.</td>
						<td><input type="text" class="form-control form-control-sm" name="price"/></td>
					</tr>
					<tr>
						<td>Grade.</td>
						<td>
							<select class="form-select form-select-sm" name="pSpec">
								<option value="none" selected> NORMAL</option>
								<c:forEach var="spec" items="${pdSpecs}">
									<option value="${spec.name()}">${spec.name()}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>Information.</td>
						<td><textarea class="form-control form-control-sm" rows="3" name="pContent"></textarea></td>
					</tr>
					<tr>
						<td>Product Point.</td>
						<td><input type="text" class="form-control form-control-sm" name="pPoint"/></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit"  class="btn btn-sm text-white" style="background-color: black;" value="Register"/>
							<input type="reset" class="btn btn-sm btn-secondary" value="Cancle"/>
						</td>
					</tr>
				</tbody>			
			</table>
		</form>	
	</div>
	</div>
	
	
<%@ include file ="inc/ad_footer.jsp"%>