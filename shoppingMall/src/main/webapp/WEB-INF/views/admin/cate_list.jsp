<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/ad_header.jsp"%>

	<div class="container mt-5 border shadow-sm p-5 mb-3 w-50">
		<h3 class ="text-center">카테고리 리스트</h3>
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
			
			<c:forEach var="dto" items="${requestScope.dtos}">
				<tr>
					<td>${dto.cate_num}</td>
					<td>${dto.code}</td>
					<td>${dto.cate_name}</td>
					<td><a href="categoryDel.do?cate_num=${dto.cate_num}" class= "btn btn-outline-danger btn-sm">삭제</a></td>
				</tr>
			</c:forEach>
			
			</tbody>
		</table>
	</div>
	
<%@ include file ="inc/ad_footer.jsp"%>