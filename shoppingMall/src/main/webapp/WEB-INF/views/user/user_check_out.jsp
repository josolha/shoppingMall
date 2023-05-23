<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="inc/user_header.jsp"%>

<%@ include file ="inc/user_sidebar.jsp"%>    
  <div class="container mt-5  col-md-8 mx-auto">
   <div class="border shadow-sm p-5 mb-3 w-100 mx-auto"> 
    
    	<section class="w-100 ps-5">
			 <!-- style ="border:1px solid red" -->	
			 
				<h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Order/Payment</h3>
				<table id="cartTable" class="table mt-3">
					<thead>
						<tr>
							<th>Image.</th>
							<th>Name.</th>
							<th>Qty.</th>
							<th>Price.</th>
							<th>Total.</th>
							<th><input type="checkbox" id ="checkAll" onclick="checkAll()"/> Delete.</th>
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
							<td>${cart.product_cnt} pcs</td>
				
							<td>
								<fmt:formatNumber value ="${cart.product.price}"/>₩<br/>
							</td>
							<td>
								<fmt:formatNumber value ="${cart.product.price}"/>₩<br/>
								<fmt:formatNumber value ="${cart.product.PPoint}"/>Point
							</td>
							<td><input type="checkbox" name="chk" value="${cart.product.PNum}"/></td>
						</tr>
						<!--  장바구니 상품 총액 구하기 -->
						<c:set var="cartTotalPrice" value="${cartTotalPrice + cart.product.price * cart.product_cnt}"/>
						<c:set var="cartTotalPoint" value="${cartTotalPoint + cart.product.PPoint * cart.product_cnt}"/>
						</c:forEach>
						
						<tr>
							<td colspan="5"></td>
							<td>
  								<a href="javascript:prodDel();"  class="btn btn bg-dark text-white">Delete</a>
							</td>
						</tr>
						
						</c:if>
					</tbody>
				</table>
				<div class="cart-total-price text-end">
				  Total Cart Price: <b><fmt:formatNumber value ="${cartTotalPrice}"/></b>₩
				</div>
				<div class="cart-total-point text-end">
				  Total Cart Point: <b><fmt:formatNumber value ="${cartTotalPoint}"/></b>Point
				</div>
			
	
	<table class="table">

		<tbody>
			<tr>
				<td colspan="2"><b>Buyer Info.</b></td>
			</tr>
			<tr>
				<td>Name.</td>
				<td>${UserDto.name}</td>
			</tr>
			<tr>
				<td>Email.</td>
				<td>${UserDto.email}</td>
			</tr>
			<tr>
				<td>Phone.</td>
				<td>${UserDto.phone}</td>
			</tr>
			<tr>
				<td colspan="2" class="mt-3"><b>Receiver Info.</b></td>
			</tr>
						<tr>
				<td>Name.</td>
				<td><input class="form-control mb-2 col-4" type="text" placeholder="이름"></td>
			</tr>
			<tr>
				<td>Address.</td>
				<td>
				 	<div class="row">
		            	<div class="col-md-6">
		               		<input class="form-control mb-2" type="text" id="sample2_postcode" name="zipcode" placeholder="우편번호"/>
		            	</div>
			            <div class="col-md-6">
			               <a class="btn btn bg-dark text-light w-100 mb-2" onclick="sample2_execDaumPostcode()">Search PostCode.</a>
			           	 </div>
		         	</div>
				 	<input class="form-control mb-2" type="text" id="sample2_address" placeholder="도로명주소" name="road_addr"/>
        	     	<input class="form-control" type="text" id="sample2_detailAddress" placeholder="상세주소" name="detail_addr"/>  
        	     	  
        	     	  <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch; ">
      <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
   </div>
				</td>
			</tr>
			<tr>
				<td>Phone.</td>
				<td><input class="form-control2 mb-2" type="text" placeholder="휴대폰 번호" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required></td>

			</tr>
					<tr>
				<td colspan="2" class="mt-3"><b>Pay Info.</b></td>
			</tr>
			<tr>
				<td>Total Price.</td>
				<td><fmt:formatNumber value="${cartTotalPrice}"/>원</td>
			</tr>
			<tr>
				<td>Point</td>
				<td>
					<input type="text" id="point" size="10"
						oninput="removeChar(event)"
						onfocus = "clearValue(this)"
						onkeyup ="enterKey(this,${cartTotalPoint},${cartTotalPrice})"
						onchange="inputPoint(this,${cartTotalPoint})"
					/>
					<input type="checkbox" id="use" onclick="usePoint(this,${cartTotalPoint},${cartTotalPrice})"/>
					<label for ="use">
						전액사용[<fmt:formatNumber value="${cartTotalPoint+totalPoint}"/>P]
					</label>
				</td>
			</tr>
			<tr>
				<td>결제 금액</td>
				<td id="cartTotPrice">
					<fmt:formatNumber value="${cartTotalPrice}"/>원
				</td>
			</tr>
			<tr>
				<td>결제 방법</td>
				<td>
					<label><input type="radio" name="payment" value="card" onclick="selPayment()" checked/>신용카드</label>
					<label><input type="radio" name="payment" value="rTransfer" onclick="selPayment()" />실시간 계좌이체</label>
					<label><input type="radio" name="payment" value="deposit" onclick="selPayment()" />무통장 입금</label>
					<label><input type="radio" name="payment" value="hp" onclick="selPayment()" />휴대폰</label>
				</td>
			</tr>
			
		</tbody>
		
		<!--아임포트API 결제 폼 -->
	
	</table>
	<div id = "card">
			카드선택 : <select>
				<option value = "" selected>카드사 선택</option>
				<option value = "">삼성카드</option>
				<option value = "">신한카드</option>
				<option value = "">롯데카드</option>
				<option value = "">비씨카드</option>
				<option value = "">현대카드</option>
			</select><br/><br/>
			할부기간 : <select id = "installments" <c:if test="${cartTotalPrice<=50000}">disabled</c:if>>
				<option value = "1" selected>일시불</option>
				<option value = "2">2개월 무이자 할부</option>
				<option value = "3">3개월 무이자 할부</option>
				<option value = "4">4개월 무이자 할부</option>
				<option value = "5">5개월 무이자 할부</option>
				<option value = "6">6개월 무이자 할부</option>
			</select><br/><br/>
				</div>
		<div id = "rTransfer" style="display:none">
			은행선택 : <select>
				<option value = "" selected>은행 선택</option>
				<option value = "">카카오</option>
				<option value = "">우리은행</option>
				<option value = "">국민은행</option>
				<option value = "">신한은행</option>
			</select><br/><br/>
				</div>
			<div id = "deposit" style="display:none">
			입금은행 : <select>
				<option value = "" selected>은행 선택</option>
				<option value = "">카카오</option>
				<option value = "">우리은행</option>
				<option value = "">국민은행</option>
				<option value = "">신한은행</option>
			</select>
		<ul style="font-size:11px">
			무통장 입금시 유의사항
			<li>입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</li>
			<li>무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</li>
			<li>은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</li>
		</ul>
	</div>
		<div id = "hp" style="display:none">
			통신사 : <select>
				<option value = "" selected>통신사 선택</option>
				<option value = "">SKT</option>
				<option value = "">LG U+</option>
				<option value = "">KT</option>
			</select><br/><br/>
		</div>
		<div class="text-center mt-5">
			<button onclick="requestPay()" class="btn btn bg-dark text-white" >Buy</button>
			<a href="${ctxPath}" class="btn btn-secondary" >Continue Shopping</a>
		</div>
	
	</section>
	
	</div>
	</div>
	<script src="${ctxPath}/resources/js/checkOut.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${ctxPath}/js/zipcode.js"></script>
	
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
 <script>
	function requestPay() {
		
	  

	// 리스트에서 각 항목을 순회하며 데이터 추출

		  
      var userId = "${UserDto.id}";
      var name = "${UserDto.name}";
      var email = "${UserDto.email}"
      var phone = "${UserDto.phone}"
      
      
      // 주문리스트.
	  var roadAddr = document.getElementById('sample2_address').value;
	  var detailAddr = document.getElementById('sample2_detailAddress').value;	
	  var fullAddress = roadAddr + ' ' + detailAddr;
      var receiver_name = document.querySelector('.form-control.mb-2.col-4').value;
      var receiver_phone = document.querySelector('.form-control2.mb-2').value;
	
    
      // 총 가격과 총 포인트
      var totalCartPrice = ${cartTotalPrice};
      var totalCartPoint = ${cartTotalPoint};
      var totalPrice = document.getElementById('cartTotPrice').textContent;
      
      
      // 상품리스트 

      
      
      //사용 포인트 
      var usedPoint = document.querySelector('#point').value.replace(/,/g, "");
   
      

      
      
	  IMP.init('imp03611203'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
	  IMP.request_pay({
	    pg: "카카오페이 결제창",
	    pay_method: "card",
	    merchant_uid : 'merchant_'+new Date().getTime(),
	    name : '결제테스트',
	    amount: parseInt(totalPrice.replace(/[^0-9]/g, '')),
	    buyer_email : email,
	    buyer_name : name,
	    buyer_tel : phone,
	    buyer_addr : fullAddress,
	    buyer_postcode : '123-456'
        
	  }, function (rsp) { // callback
		  
	      if (rsp.success) {
	    	  
	    	  var msg = '결제가 완료되었습니다.';
	    	  alert(msg);
	    	  
	          var cartList = "${orderItems}";

	    	  
	          var orderItems = [];

	          <c:forEach items="${cartList}" var="cart">
	          
	            var orderItem = {
	              order_id:String(rsp.merchant_uid+"order"),		
	              product_id: ${cart.product_id},
	              quantity: ${cart.product_cnt}
	            };
	            
	            orderItems.push(orderItem);
	          </c:forEach>

	          console.log(orderItems);
	    	  
	          var paymentInfo = {
	        		  
	        		  //결제정보 
	                  payment_id: String(rsp.merchant_uid),
	                  order_id: String(rsp.merchant_uid+"order"),
	                  payment_date: new Date(), // 결제 일자는 현재 시간으로 설정
	                  used_points: usedPoint,
	                  earn_points: totalCartPoint - usedPoint,
	                  amount: rsp.paid_amount, // 결제된 금액은 아임포트의 paid_amount를 사용
	                  payment_status: 'PAID', // 결제 상태를 'PAID'로 설정
	                  
	                  //주문정보
                      orderInfo: {
                    	order_id: String(rsp.merchant_uid+"order"),
                    	member_id: userId,
                    	order_date: new Date(),
                        total_amount: totalCartPrice, // 총 가격
                        receiver_name: receiver_name,
                        receiver_phone:	receiver_phone,
                    	shipping_address: fullAddress  // 사용자가 입력한 주소로 변경
      	        	  },
	          
	          		  //포인트정보
	          		  pointInfo:{
	          			  order_id : String(rsp.merchant_uid+"order"),
		          		  member_id :userId,
		          		  payment_id :String(rsp.merchant_uid),
		          		  /* point_amount : usedPoint를 뺸 값으로 업데이트*/
	          		  },
	          		
	          		  //상품아이템정보 
	          		 orderItems : orderItems
	                };
	          
	          $.ajax({
	            url: '${ctxPath}/payments',
	            method: 'POST',
	            contentType: 'application/json', 
	            data: JSON.stringify(paymentInfo),
	            success: function (response) {        
	              console.log('결제 정보 전송 성공');
	            },
	            
	            error: function (xhr, status, error) {
	            	 console.log('결제 정보 전송 실패', xhr.responseText); // 수정된 부분
	            }
	           });
	          
	          location.href = "${ctxPath}/user/myPage.do"  
	                    
	      } else {
    	     var msg = '결제에 실패하였습니다.';
    	      msg += '에러내용 : ' + rsp.error_msg;
    	      alert(msg);
       
     		 }
	  });
	  
	}
</script>

	
	
<%@ include file ="inc/user_footer.jsp"%>