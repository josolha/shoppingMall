<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/ad_header.jsp"%>

<%@ include file ="inc/ad_sidebar.jsp"%>

<c:if test="${requestScope.msg !=null}">
<script>
	alert("${requestScope.msg}");
</script>
</c:if>


      <div class="container mt-5  col-md-8 mx-auto">
   <div class="border shadow-sm p-5 mb-3 w-100 mx-auto"> 
        <h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Order List</h3>
        <div class="mt-5 d-flex justify-content-between">
		
			   <div class="mt-2">
			      <b>${pageDto.viewPage}</b> / ${pageDto.totalPage} pages 
			   </div>
			   
			  <form id="searchForm" method="post" action="${ctxPath}/admin/orderList.do">
			  
				    <div class="row mb-3">
				        <div class="col">
				            Start: <input type="date" id="start_date" name="start_date" class="form-control rounded-0" onchange="customRange(this);" value="${not empty pageDto.start_date ? pageDto.start_date : ''}">
				        </div>
				        <div class="col">
				            End: <input type="date" id="end_date" name="end_date" class="form-control rounded-0" onchange="customRange(this);" value="${not empty pageDto.end_date ? pageDto.end_date : ''}">
				        </div>
				    </div>
				
				    <div class="d-flex justify-content-center">
				        <select class="form-select me-2" style="width:100px" name="searchType">
				            <option value="">선택</option>
				            <option value="I" <c:out value="${pageDto.searchType == 'I' ? 'selected' : ''}"/>>ID.</option>
				            <option value="N" <c:out value="${pageDto.searchType == 'N' ? 'selected' : ''}"/>>Name.</option>
				        </select>
				        <input type="text" id="keyWord" name="keyWord" placeholder="검색어 입력" style="width:200px" class="form-control rounded-0 rounded-start" value="${pageDto.keyWord}"/>
				        <button class="btn btn-dark text white rounded-0 rounded-end"><i class="bi bi-search"></i></button>
				    </div>
				</form>

			  
			  <!-- 검색이 없을 경우 -->
			  <c:if test="${pageDto.searchType == null || pageDto.searchType == ''}">
			   <div class="mt-2">
			      <select class="form-select form-select-sm" id="cntPerPage">         
			         <option value="5"
			            <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>View by 5</option>
			         <option value="10"
			            <c:out value="${pageDto.cntPerPage == 10 ? 'selected':''}"/>>View by 10</option>
			         <option value="20"
			            <c:out value="${pageDto.cntPerPage == 20 ? 'selected':''}"/>>View by 20</option>
			      </select>
			   </div>
			   </c:if>
			   
			   <!-- 검색할 경우 -->
			   <c:if test="${pageDto.searchType != null && pageDto.searchType != ''}">
			   <div>
			      <select class="form-select form-select-sm" id="cntPerPage">
			      <c:choose>
			         <c:when test = "${pageDto.totalCnt <= 5}">
			            <option value="5" <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>No Option</option>
			         </c:when>
			         
			         <c:when test = "${pageDto.totalCnt > 5 && pageDto.totalCnt< 10}">            
			            <option value="5" <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>View by 5</option>
			            <option value="10"<c:out value="${pageDto.cntPerPage == 10 ? 'selected':''}"/>>View by 10</option>
			         </c:when>
			         
			         <c:when test = "${pageDto.totalCnt >= 10 && pageDto.totalCnt < 20}">
			            <option value="5" <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>View by 5</option>
			         	<option value="10" <c:out value="${pageDto.cntPerPage == 10 ? 'selected':''}"/>>View by 10</option>         
			         </c:when>
			         
			         <c:otherwise>
				         <option value="5" <c:out value="${pageDto.cntPerPage == 5 ? 'selected':''}"/>>View by 5</option>
				         <option value="10" <c:out value="${pageDto.cntPerPage == 10 ? 'selected':''}"/>>View by 10</option>
				         <option value="20" <c:out value="${pageDto.cntPerPage == 20 ? 'selected':''}"/>>View by 20</option>	
			         </c:otherwise>
			         
			         </c:choose>
			      </select>
			   </div>
			   </c:if>
		   </div>
        
        
        <table class="table mt-5">
          <thead>
            <tr>
              <th>No.</th>
              <th>ID.</th>
              <th>Name.</th>
              <th>Date.</th>
              <th>Qty.</th>
              <th>Price.</th>
              <th>Status.</th>
          	  <th>Delete.</th>
          	  
            </tr>
          </thead>
          
       
          <tbody>
          	<c:set var ="rowNum" value= "${pageDto.startRowNum}"/>
            <c:forEach var="dto" items="${requestScope.dtos}">
              <tr>
                <td>${rowNum}</td>
                <td>${dto.memberId}</td>
                <td>${dto.productName}</td>
                <td><fmt:formatDate value="${dto.purchaseDate}" pattern="yyyy-MM-dd"/></td>
                <td>${dto.purchaseQuantity}</td>
                <td><fmt:formatNumber value="${dto.purchasePrice}"/>₩</td>
                <td><button class="btn btn-secondary btn-sm">${dto.purchaseStatus}</button></td>
                
                <td>
                  <a href="javascript:pdDel('${dto.memberId}')" class="btn btn-sm text-white" style="background-color: black;">Delete</a>
                </td>
              </tr>
              <c:set var="rowNum" value="${rowNum-1}"/>
            </c:forEach>
          </tbody>
          
        </table>
        		
			<ul class="pagination justify-content-center mt-4">
			  <li class="page-item ${pageDto.prevPage <= 0 ? 'd-none':''}">
			     <a class="page-link bg-dark text-light" href="orderList.do?viewPage=${pageDto.prevPage}&cntPerPage=${pageDto.cntPerPage}&start_date=${pageDto.start_date}&end_date=${pageDto.end_date}">Prev</a>
			  </li>
			  
			  <c:forEach var="i" begin="${pageDto.blockStart}" end="${pageDto.blockEnd}">
			     <li class="page-item ${pageDto.viewPage == i ? 'active':''}">
			        <a class="page-link bg-secondary text-light ${pageDto.viewPage == i ? 'border border-dark':''}" href="orderList.do?viewPage=${i}&cntPerPage=${pageDto.cntPerPage}
			        			&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}
			        			&start_date=${pageDto.start_date}&end_date=${pageDto.end_date}">${i}</a>
			     </li>
			  </c:forEach>
			  
			  <li class="page-item ${pageDto.blockEnd >= pageDto.totalPage ? 'd-none':''}">
			     <a class="page-link bg-dark text-light" href="orderList.do?viewPage=${pageDto.nextPage}&cntPerPage=${pageDto.cntPerPage}&start_date=${pageDto.start_date}&end_date=${pageDto.end_date}">Next</a>
			  </li>
			</ul>
      </div>
      </div>
   
 

<script>
	document.getElementById('start_date').addEventListener('change', checkDates);
	document.getElementById('end_date').addEventListener('change', checkDates);
	
	function checkDates() {
	    var startDate = document.getElementById('start_date').value;
	    var endDate = document.getElementById('end_date').value;
	    var currentDate = new Date().toISOString().split('T')[0]; // Get current date
	
	    if ((startDate && startDate > currentDate) || (endDate && endDate > currentDate)) {
	        alert('미래 날짜를 선택할 수 없습니다.');
	        document.getElementById('start_date').value = '';
	        document.getElementById('end_date').value = '';
	    } else if (startDate && endDate && startDate > endDate) {
	        alert('시작 날짜가 종료 날짜보다 늦을 수 없습니다.');
	        document.getElementById('start_date').value = '';
	        document.getElementById('end_date').value = '';
	    }
	}
	
	function pdDel(no){
		var isDel = window.confirm("삭제 하시겠습니까?");
		if(isDel) location.href = "orderListDel.do?no="+no;
	}
	

	function openModal(button) {
	  $('#productModal').modal('show');
	}
	
	 $("#cntPerPage").change(function(e){
	      let cntVal = $("#cntPerPage option:selected").val();
	      location.href="<c:url value='orderList.do?viewPage=1&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}&start_date=${pageDto.start_date}&end_date=${pageDto.end_date}&cntPerPage='/>"+cntVal;      
	 });
</script>	


<%@ include file ="inc/ad_footer.jsp"%>