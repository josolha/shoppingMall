<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="inc/user_header.jsp"%>

<%@ include file="inc/user_sidebar.jsp"%>

  
  <div class="container mt-5  col-md-8 mx-auto">
   <div class="border shadow-sm p-5 mb-3 w-100 mx-auto">    
<section class="w-100 ps-5">

	<h3 class="text-center"
		style="text-decoration: underline; text-underline-position: under;">My
		Page</h3>


	<div class="d-flex justify-content-between border-bottom mb-3 pb-2">
		<h5>User Info.</h5>
		<div>
			<button type="button" id="edit-btn" class="btn btn-secondary btn-sm me-2"
				onclick="openModal(this)" >Edit</button>
			<a href="${ctxPath}/user/changePw.do"class="btn bg-dark btn-sm text-white">Change
				PW</a>
		</div>
	</div>
	<table class="table table-borderless">
		<tbody>
			<tr>
				<th scope="row">ID.</th>
				<td>${UserDto.id}</td>
			</tr>
			<tr>
				<th scope="row">Name.</th>
				<td>${UserDto.name}</td>
			</tr>
			<tr>
				<th scope="row">Email.</th>
				<td>${UserDto.email}</td>
			</tr>
			<tr>
				<th scope="row">Phone.</th>
				<td>${UserDto.phone}</td>
			</tr>
			<tr>
				<th scope="row">My Point.</th>
				<td><fmt:formatNumber value="${totalPoint}"/>P</td>
			</tr>
		</tbody>
	</table>

			<!-- UserInfo Modal -->
			<div class="modal" id="UserInfoModal">
			  <div class="modal-dialog modal-sm modal-dialog-centered mb-auto">
			    <div class="modal-content" style="background : #fcf9ee">
			
			      <!-- Modal Header -->
			      <div class="modal-header border-1 text-center">
			        <h5 class="modal-title ms-auto ps-4">User Info.</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
			
			      <!-- Modal Body -->
			      
			        <div class="modal-body p-4">
			        
					   <div class="mb-3">
			            <label for="id" class="form-label">ID.</label>
			            <input type="text" class="form-control" id="id" name="id" readonly >
			          </div>	
								        
			          <div class="mb-3">
			            <label for="name" class="form-label">Name.</label>
			            <input type="text" class="form-control" id="name" name="name">
			          </div>
			          
			          <div class="mb-3">
			            <label for="email" class="form-label">Email.</label>
			            <input type="text" class="form-control" id="email" name="email">
			          </div>
			          
       		          <div class="mb-3">
			            <label for="phone" class="form-label">Phone.</label>
			            <input type="text" class="form-control" id="phone" name="phone">
			          </div>
			          
			        </div>
			
			        <!-- Modal Footer -->
			        <div class="modal-footer border-0 justify-content-center">
			          <button type="button" id="update-btn" class="btn btn-secondary btn-sm">Update</button>
			          <button type="button" class="btn btn-sm text-white" style="background-color: black;" data-bs-dismiss="modal">Close</button>
			        </div>
			      
			
			    </div>
			  </div>
			</div>
			
			<!-- UserAddress Modal -->
			<div class="modal" id="UserAddressModal">
			  <div class="modal-dialog modal-sm modal-dialog-centered mb-auto">
			    <div class="modal-content" style="background : #fcf9ee">
			
			      <!-- Modal Header -->
			      <div class="modal-header border-1 text-center">
			        <h5 class="modal-title ms-auto ps-4">Address.</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
			
			      <!-- Modal Body -->
			      
			        <div class="modal-body p-4">
			        
					   <div class="mb-3">
			            <label for="id" class="form-label">ZipCode.</label>
			            <input type="text" class="form-control" id="zipcode" name="zipcode" value="${UserDto.zipcode}" >
			          </div>	
								        
			          <div class="mb-3">
			            <label for="name" class="form-label">Road.</label>
			            <input type="text" class="form-control" id="road_addr" name="road_addr" value="${UserDto.road_addr}">
			          </div>
			          
		          	  <div class="mb-3">
			            <label for="name" class="form-label">Jibun.</label>
			            <input type="text" class="form-control" id="jibun_addr" name="jibun_addr" value="${UserDto.jibun_addr}">
			          </div>
			          
			          
			          <div class="mb-3">
			            <label for="email" class="form-label">Detail.</label>
			            <input type="text" class="form-control" id="detail_addr" name="detail_addr" value="${UserDto.detail_addr}">
			          </div>
			          
			        </div>
			
			        <!-- Modal Footer -->
			        <div class="modal-footer border-0 justify-content-center">
			          <button type="button" id="update-btn2" class="btn btn-secondary btn-sm">Update</button>
			          <button type="button" class="btn btn-sm text-white" style="background-color: black;" data-bs-dismiss="modal">Close</button>
			        </div>
			      
			
			    </div>
			  </div>
			</div>

	<div
		class="d-flex justify-content-between align-items-center border-bottom mb-3 pb-2">
		<h5>Address.</h5>
		<button type="button" class="btn btn-secondary btn-sm me-2" onclick="openModal2(this)">Edit</button>
	</div>
	<table class="table table-borderless">
		<tbody>
			<tr>
				<th scope="row">ZipCode</th>
				<td>${UserDto.zipcode}</td>
			</tr>
			<tr>
				<th scope="row">Road</th>
				  <td>${UserDto.road_addr}</td>
			</tr>
			<tr>
				<th scope="row">Jibun</th>
				  <td>${UserDto.jibun_addr}</td>
			</tr>
			<tr>
				<th scope="row">Detail</th>
				<td>${UserDto.detail_addr}</td>
			</tr>
		</tbody>
	</table>

	<!-- 결제 내역 -->
	<div class="border-bottom">
		<h5>Payment History.</h5>
	</div>
	<table id="payTable" class="table mt-3">
		<thead>
			<tr>
				<th>Name.</th>   
				<th>Date.</th>
				<th>Quantity.</th>
				<th>Price.</th>
				<th>State.</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${PaymentHistoydto.size() == null || PaymentHistoydto.size() ==0 }">
						<tr>
							<td colspan="6">History is empty.</td>
						</tr>
			</c:if>
				
		    <c:forEach var="dto" items="${PaymentHistoydto}">	
			<tr>
				<td>${dto.productName}</td> 
		        <td><fmt:formatDate value="${dto.purchaseDate}" pattern="yyyy-MM-dd"/></td>
				<td>${dto.purchaseQuantity}</td>
				
				<td><fmt:formatNumber value="${dto.purchasePrice}"/>₩</td>
				<td>
					<button>${dto.purchaseStatus}</button>
				</td>
			</tr>
			</c:forEach>

	<!-- 이하 생략 -->
		</tbody>
	</table>

</section>
</div>
</div>
<script>
function openModal(button) {
	
    var id = "${UserDto.id}";
    var name = "${UserDto.name}";
    var email = "${UserDto.email}";
    var phone = "${UserDto.phone}";

    // 모달창의 HTML 요소를 가져옵니다.
    var idInput = document.querySelector("#UserInfoModal #id");
    var nameInput = document.querySelector("#UserInfoModal #name");
    var emailInput = document.querySelector("#UserInfoModal #email");
    var phoneInput = document.querySelector("#UserInfoModal #phone");
    
    document.querySelector('#id').setAttribute('name', 'new-id');
    document.querySelector('#name').setAttribute('name', 'new-name');

    // HTML 요소에 값을 설정합니다.
    idInput.value = id;
    nameInput.value = name;
    emailInput.value = email;
    phoneInput.value = phone;
	
    // 모달 창을 열음
    $('#UserInfoModal').modal('show');
    
    // updateUser() 함수 정의
    function updateUserInfo() {
        // 업데이트할 사용자 정보를 가져옵니다.
        var updatedName = nameInput.value;
        var updatedEmail = emailInput.value;
        var updatedPhone = phoneInput.value;

        // AJAX 요청을 보냅니다.
        $.ajax({
            url: "${ctxPath}/updateUserInfo",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                id: id,
                name: updatedName,
                email: updatedEmail,
                phone: updatedPhone
            }),
            success: function(response) {
                // 응답을 처리합니다.
                alert("수정 완료 했습니다.");
                $("#UserInfoModal").modal("hide");
				
                // 마이페이지를 다시 로드합니다.
                location.reload();
            },
            error: function(jqXHR, textStatus, errorThrown) {
            	alert("수정 실패 했습니다.");
            }
        });
    }
    $("#update-btn").on("click", updateUserInfo);
}

function openModal2(button) {
	

    // 모달 창을 열음
    $('#UserAddressModal').modal('show');
    
    // updateUser() 함수 정의
    function updateAddress() {
        // 업데이트할 사용자 정보를 가져옵니다.
        const zipcodeInput = document.getElementById('zipcode');
		const roadAddrInput = document.getElementById('road_addr');
		const jibunAddrInput = document.getElementById('jibun_addr');
		const detailAddrInput = document.getElementById('detail_addr');
        
        var id = "${UserDto.id}";
        var zipcodeValue = zipcodeInput.value;
        var road_addrValue = roadAddrInput.value;
        var jibun_addrValue = jibunAddrInput.value;
        var detail_addrValue = detailAddrInput.value;
        
        // AJAX 요청을 보냅니다.
        $.ajax({
            url: "${ctxPath}/updateAddress",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                id: id,
                zipcode : zipcodeValue,
                road_addr : road_addrValue,
                jibun_addr : jibun_addrValue,
                detail_addr : detail_addrValue
                
            }),
            success: function(response) {
                // 응답을 처리합니다.
                alert("수정 완료 했습니다.");
                $("#UserInfoModal").modal("hide");
				
                // 마이페이지를 다시 로드합니다.
                location.reload();
            },
            error: function(jqXHR, textStatus, errorThrown) {
            	alert("수정 실패 했습니다.");
            }
        });
    }
    $("#update-btn2").on("click", updateAddress);
}
	


</script>

<%@ include file="inc/user_footer.jsp"%>
