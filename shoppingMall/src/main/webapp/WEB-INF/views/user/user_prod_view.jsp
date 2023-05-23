
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="inc/user_header.jsp"%>

<%@ include file ="inc/user_sidebar.jsp"%>

<!--flex는 바로 자식요소에게만 수평배열 -->
  <div class="container mt-5  col-md-8 mx-auto">
   <div class="border shadow-sm p-5 mb-3 w-100 mx-auto"> 
	<div class="container mt-5 d-flex" >
		<!-- 서브 메뉴 -->
		
			<section class="w-100 ps-5">
			  <h3> <c:if test="${pDto.PSpec != null}">[${pDto.PSpec}]</c:if> Product View.</h3>
			  <div class="row">
			    <!-- 상품이미지 -->
			    <div class="col-md-6">
			      <img src="${ctxPath}/resources/file_repo/${pDto.PImage}" class="w-75"/>
			    </div>
			    <!-- 상품상세 정보 -->
			    <div class="col-md-6">
			      <form name="prodForm" method="post">
			        <input type="hidden" name="pSpec" value="${pDto.PSpec}" />
			        <p>No : ${pDto.PNum}</p>
			        <h2 class="text-center">${pDto.PName}</h2>
			        <div class="text-center my-4">
			          <h4><fmt:formatNumber value="${pDto.price}" />₩</h4>
			          <p>Save Point: <fmt:formatNumber value="${pDto.PPoint}" />p</p>
			          <label for="pQty">Quantity:</label>
			          <input type="number" name="pQty" id="pQty" min="1" value="1" style="width: 60px;"/>
			        </div>
			        <div class="my-4">
			          <h4 class="mb-3"><b>[About]</b></h4>
			          <p class="about-content">${pDto.PContent}</p>
			        </div>
			        <!-- 로그인한 사용자만 장바구니 담기 허용 -->
			        <c:if test="${loginDto != null}">
			          <a href="javascript:goCart(${pDto.PNum},'${loginDto.id}')" class="btn btn-sm bg-dark text-white">Add Cart</a>
			        </c:if> 
			        <!-- 로그인을 안했을 경우-->
			        <c:if test="${loginDto == null}">
			        	<a href="javascript:showMsg()" class="btn btn-sm bg-dark text-white">Add Cart</a>
			        </c:if> 
			        <a href="javascript:history.back()" class="btn btn-sm btn-secondary">Continue Shopping</a> 
			      </form>	
			    </div>
			  </div>
			</section>

	</div>
	</div>
	</div>
	<script type="text/javascript">
		function goCart(PNum,id){
			   var pQty = document.getElementById("pQty").value;
			   var data = {
					   product_id : PNum,
					   user_id : id,
					   product_cnt :pQty
			   };
			   
			   $.ajax({
				    url : '/jomaltwo/user/cart/new',
				    type : 'post',
				    data : JSON.stringify(data),
				    contentType : "application/json; charset=utf-8",
				    success : function(result){
				     	alert("카트 담기를 했습니다.");
				    },
				    error : function(){
				     	alert("카트 담기 실패");
				    }
				   });
		}
		
		function showMsg(){
			alert("로그인이 필요합니다.");
		}
		 
	
	</script>
	
<%@ include file ="inc/user_footer.jsp"%>
