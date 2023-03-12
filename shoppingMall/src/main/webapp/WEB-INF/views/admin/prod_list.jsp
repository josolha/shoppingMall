<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/ad_header.jsp"%>

<c:if test="${requestScope.msg !=null}">
<script>
	alert("${requestScope.msg}");
</script>
</c:if>


<div class="container mt-5 border shadow-sm p-5 mb-3 w-75">
	<h3 class="text-center" style="text-decoration: underline; text-underline-position : under;">Product List</h3>
	<table class="table mt-4">
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
		<c:forEach var="dto" items="${requestScope.dtos}">
			<tr>
				<td>${dto.PNum}</td>
				<td>${dto.PCategory_fk}</td>
				<td>
					<img src="${ctxPath}/resources/file_repo/${dto.PImage}" style="width:60px"/>
				</td>
				<td>${dto.PName}</td>
				<td>${dto.price}</td>
				<td>${dto.PCompany}</td>
				<td>${dto.PQty}</td>				
				<td>
					<a href="productUpdate.do?pNum=${dto.PNum}"  class="btn btn-secondary btn-sm">Modify</a>
					<a href="javascript:pdDel('${dto.PNum}','${dto.PImage}')"  class="btn btn-sm text-white" style="background-color: black;">Delete</a>	
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<script>
	function pdDel(pNum, pImage){
		var isDel = window.confirm("삭제 하시겠습니까?");
		if(isDel) location.href = "productDel.do?pNum="+pNum+"&pImage="+pImage;
	}
</script>	


<%@ include file ="inc/ad_footer.jsp"%>