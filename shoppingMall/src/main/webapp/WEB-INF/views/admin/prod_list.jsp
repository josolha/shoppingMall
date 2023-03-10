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
				<td>${dto.pNum}</td>
				<td>${dto.pCategory_fk}</td>
				<td>
					<img src="${ctxPath}/uploadedFile/${dto.pImage}" style="width:60px"/>
				</td>
				<td>${dto.pName}</td>
				<td>${dto.price}</td>
				<td>${dto.pCompany}</td>
				<td>${dto.pQty}</td>				
				<td>
					<a href="productUpdate.do?pNum=${dto.pNum}"  class="btn btn-outline-danger btn-sm">수정</a>
					<a href="javascript:pdDel('${dto.pNum}','${dto.pImage}')"  class="btn btn-outline-danger btn-sm">삭제</a>				
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<script>
	function pdDel(pNum, pImage){
		var isDel = window.confirm("삭제 하시겠습니까?");
		if(isDel) location.href = "prodDelete.do?pNum="+pNum+"&pImage="+pImage;
	}
</script>	


<%@ include file ="inc/ad_footer.jsp"%>