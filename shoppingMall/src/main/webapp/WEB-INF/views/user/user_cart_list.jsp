<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="inc/user_header.jsp"%>

<%@ include file ="inc/user_sidebar.jsp"%>


		<!-- 서브 메뉴 -->
	
			<section class="w-100 ps-5">
			 <!-- style ="border:1px solid red" -->	
			 
				<h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Cart List</h3>
				<table class="table">
					<thead>
						<tr>
							<th>Img.</th>
							<th>Name.</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Total</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${pDtos == null || pDtos.size() ==0 }">
						<tr>
							<td colspan="6">Cart is empty.</td>
						</tr>
					</c:if>
					<c:if test="${pDtos.size() != 0 }">
					<c:set var="cartTotalPrice" value="0"/>
					<c:set var="cartTotalPoint" value="0"/>
					<c:forEach var="pDto" items="${pDtos}">
						<tr>
							<td>
								<img src="${ctxPath}/resources/file_repo/${pDto.PImage}" width="80px">
							</td>
							<td>${pDto.PName}</td>
							<td>
								<form action="cartModify.do" method="post">
								<input type="hidden" name="pNum" value="${PDto.PNum}"/>
								<input type="text" size="3" name="pQty" value="${pDto.PQty}"/>개<br/>
								<input type="submit" class="btn btn-sm btn-secondary mt-3" value="수정">
								</form>
							</td>
							<td>
								<fmt:formatNumber value ="${pDto.price}"/>원<br/>
								<fmt:formatNumber value ="${pDto.PPoint}"/>포인트
							</td>
							<td>
								<fmt:formatNumber value ="${pDto.totPrice}"/>원<br/>
								<fmt:formatNumber value ="${pDto.totPoint}"/>포인트
							</td>
							<td>
								<a href="cartDelete.do?pNum=${pDto.PNum}" class="btn btn-sm btn-outline-danger">삭제</a>
							</td>
						</tr>
						<!--  장바구니 상품 총액 구하기 -->
						<c:set var="cartTotalPrice" value="${cartTotalPrice + pDto.totPrice}"/>
						<c:set var="cartTotalPoint" value="${cartTotalPoint + pDto.totPoint}"/>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
				<div class="text-end">
					Total Cart Price: <b><fmt:formatNumber value ="${cartTotalPrice}"/></b>₩</br>
					Total Cart Point: <b><fmt:formatNumber value ="${cartTotalPoint}"/></b>Point
				</div>
				<div class="text-center mt-5">
					<a href="checkOut.do" class="btn btn bg-dark text-white" >Buy</a>
					<a href="${ctxPath}" class="btn btn-secondary" >Continue Shopping</a>
				</div>
			</section>




<%@ include file ="inc/user_footer.jsp"%>

