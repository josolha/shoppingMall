<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="inc/user_header.jsp"%>

<%@ include file ="inc/user_sidebar.jsp"%>


		<!-- 서브 메뉴 -->
	
			<section class="w-100 ps-5">
			 <!-- style ="border:1px solid red" -->	
			 
				<h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Cart List</h3>
				<table class="table mt-3">
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
					<c:if test="${cartList.size() == null || cartList.size() ==0 }">
						<tr>
							<td colspan="6">Cart is empty.</td>
						</tr>
					</c:if>
					<c:if test="${cartList.size() != 0 }">
					<c:set var="cartTotalPrice" value="0"/>
					<c:set var="cartTotalPoint" value="0"/>
					<c:forEach var="cart" items="${cartList}">
						<tr>
							<td>
								<img src="${ctxPath}/resources/file_repo/${cart.product.PImage}" width="80px">
							</td>
							<td>${cart.product.PName}</td>
							<td>
								<form action="cartModify.do" method="post">
								<input type="hidden" name="pNum" value="${cart.product.PNum}"/>
								<input type="text" size="3" name="pQty" value="${cart.product_cnt}"/> Pcs<br/>
								<input type="submit" class="btn btn-sm btn-secondary mt-3" value="Update">
								</form>
							</td>
							<td>
								<fmt:formatNumber value ="${cart.product.price}"/>₩<br/>
								<fmt:formatNumber value ="${cart.product.PPoint}"/>Point
							</td>
							<td>
								<fmt:formatNumber value ="${cart.product.price * cart.product_cnt}"/>₩<br/>
								<fmt:formatNumber value ="${cart.product.PPoint * cart.product_cnt}"/>Point
							</td>
							<td>
								<a href="cartDelete.do?pNum=${cart.product.PNum}" class="mt-2 btn btn bg-dark text-white">delete</a>
							</td>
						</tr>
						<!--  장바구니 상품 총액 구하기 -->
						<c:set var="cartTotalPrice" value="${cartTotalPrice + cart.product.price * cart.product_cnt}"/>
						<c:set var="cartTotalPoint" value="${cartTotalPoint + cart.product.PPoint * cart.product_cnt}"/>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
				<div class="text-end">
					Total Cart Price: <b><fmt:formatNumber value ="${cartTotalPrice}"/></b> ₩</br>
					Total Cart Point: <b><fmt:formatNumber value ="${cartTotalPoint}"/></b> Point
				</div>
				<div class="text-center mt-5">
					<a href="checkOut.do" class="btn btn bg-dark text-white" >Buy</a>
					<a href="${ctxPath}" class="btn btn-secondary" >Continue Shopping</a>
				</div>
			</section>

<%@ include file ="inc/user_footer.jsp"%>

