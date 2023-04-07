<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<c:set var="cnt" value="${cnt+1}"/>

  <div class="card <c:if test="${cnt%4 !=0}">me-3</c:if>" style="width:20% ;height:100%">
  <div class="d-flex flex-column" style="height:100%;">
    <!-- 이미지 -->
    <a href="${ctxPath}/productView.do?pNum=${pDto.PNum}&pSpec=${pDto.PSpec}" style="overflow:hidden;">
      <img class="card-img-top flex-grow-1" src="${ctxPath}/resources/file_repo/${pDto.PImage}" alt="Card image" style="width:100%; max-height :70%; background : #fcf9ee">
    </a>

    <div class="card-body " style="background : #fcf9ee; max-height :30%">
      <h4 class="card-title text-center" style="font-size:20px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap">${pDto.PName}</h4>
      <h4 class="card-text text-center" style="font-size:15px;"><fmt:formatNumber type="Number" value="${pDto.price}"/>₩</h4>
      <h4 class="card-text text-center" style="font-size:12px;" >Save Point : <fmt:formatNumber type="Number" value="${pDto.PPoint}"/>p</h4>

      <!-- 로그인 되었을 경우 -->
      <%-- <c:if test="${sessionScope.isLogin != null}">
      <a href="cartAdd.do?pNum=${pDto.pNum}&pQty=1&pSpec=${pDto.pSpec}" class="btn btn-outline-info" style="width:100%">장바구니 담기 </a>
      </c:if>

      <!-- 로그인 안되었을 경우 -->
      <c:if test="${sessionScope.isLogin == null}">
      <a href="javascript:alert('로그인이 필요합니다')" class="btn btn-outline-info" style="width:100%">장바구니 담기 </a>
      </c:if>  --%> 

    </div>
  </div>
</div>

 
<c:if test="${cnt%4 == 0}">
		<!--card를 감싸는 div를 닫고 다시 감싸는 태그를 열어준다  -->
	 </div><div class="d-flex mt-4">
</c:if>