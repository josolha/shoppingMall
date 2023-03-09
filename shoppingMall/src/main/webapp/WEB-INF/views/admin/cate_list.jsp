<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/ad_header.jsp"%>

	<div class="container mt-5 border shadow-sm p-5 mb-3 w-50">
		<h3 class ="text-center">Category List</h3>
		<table class="table mt-4">
			<thead>
				<tr>
					<th width="25%">No.</th>
					<th width="25%">Code.</th>
					<th width="25%">Name.</th>
					<th width="25%">Delete.</th>
				</tr>
			</thead>
			<tbody>
			
			<!-- Ajax 처리 할꺼임 -->
			
			<c:forEach var="cDto" items="${requestScope.cDtos}">
				<tr>
					<td id="cnum">${cDto.cate_num}</td>
					<td>${cDto.code}</td>
					<td>${cDto.cate_name}</td>
					<td><a href="${ctxPath}/categoryDel.do?cate_num=${cDto.cate_num}" class="btn btn-sm text-white" id="removeBtn" style="background-color: black;">delete</a></td>
					<!-- categoryDel.do?cate_num=${cDto.cate_num} -->
				</tr>
			</c:forEach>
			
			
			</tbody>
		</table>
	</div>
	




	
<%@ include file ="inc/ad_footer.jsp"%>