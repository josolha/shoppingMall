<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/ad_header.jsp"%>

<div class="container mt-5 border shadow-sm p-5 mb-3 w-50">
	<h3 class="text-center" style="text-decoration: underline; text-underline-position : under;" >Product Register</h3>
	<form action="productAdd.do" method="post" enctype="multipart/form-data">
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
						<td><input type="file" class="form-control form-control-sm" name="pImage"/></td>
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
									<option value="${spec.name()}">${spec.value}</option>
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
	<!-- <div id="sidebar"> -->
    
<!-- <div id="nav-account">
	<ul class="first_nav">
		<li><a href="/account/index.tmpl">마이페이지</a></li>
		<li class="logout"><a href="/account/signin.tmpl?_SUBMIT=signout" data-test-id="myaccount_menu_signout">로그아웃</a></li>
	</ul>

	<ul class="main_nav">
		<li id="nav_account_profile"><a href="/account/registration.tmpl" data-test-id="myaccount_menu_profile">회원정보 입력</a></li>
		<li id="nav_address_book"><a href="/account/address_book/index.tmpl" data-test-id="myaccount_menu_shipping_billing">배송주소록</a></li>
		li id="nav_payment_info"><a href="/account/payment_info/index.tmpl" >결제 정보</a></li
		<li id="nav_orders"><a href="/account/order_history/index.tmpl" data-test-id="myaccount_menu_orders">주문내역 보기</a></li>
        
		<li id="nav_favorites"><a href="/account/favorites.tmpl" data-test-id="myaccount_menu_favorites">관심상품 리스트</a></li>
		<li id="nav_reorder"><a href="/account/order_history/purchases.tmpl" data-test-id="myaccount_menu_reorder">지난 구매제품 다시구매</a></li>
		<li id="nav_appointments"><a href="/account/appointments/index.tmpl" data-test-id="myaccount_menu_myappointment">나의 예약</a></li>
	</ul>
	z
	

<div id="customer-service">
	<h1 class="customer-service-header"><center><strong>고객관리지원팀</strong></center></h1>
	<div class="customer-service-content">
		<p></p><p>문의 사항이 있으시거나 고객관리지원팀과 상담을 원하실 경우 다음 링크 <a href="mailto:consumercare-kr@jomalone.com">consumercare-kr@jomalone.com</a>를 눌러 이메일 문의 서비스로 보내주시면 응대를 도와드리겠습니다.<br>
도움이 필요하시면 고객관리지원팀으로 문의 바랍니다. 02-6971-3228<br>
라이브 챗 또는 이메일 문의 서비스를 이용하시면 보다 신속하게 응대를 도와드리겠습니다.<br>
감사합니다.</p><p></p>
	</div>
</div>
</div>


</div> -->
	
	
	
<%@ include file ="inc/ad_footer.jsp"%>