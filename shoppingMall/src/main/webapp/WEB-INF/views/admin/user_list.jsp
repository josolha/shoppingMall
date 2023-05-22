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
        <h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Users List</h3>
        <div class="mt-5 d-flex justify-content-between">
		
			   <div class="mt-2">
			      <b>${pageDto.viewPage}</b> / ${pageDto.totalPage} pages 
			   </div>
			   
			   <form id="searchForm" method="post" action="${ctxPath}/admin/users.do">
			   
			      <div class="d-flex justify-content-center">
			         <select class="form-select me-2" style="width:100px" name="searchType">
			         
			         	<!-- 선택을 꼭 하게 js 설정 필요 -->
			         	
			            <option value="">선택</option>
			            <option value="I" <c:out value="${pageDto.searchType == 'C' ? 'selected' : ''}"/>>ID.</option>
			            <option value="N" <c:out value="${pageDto.searchType == 'N' ? 'selected' : ''}"/>>Name.</option>
			         </select>
			         
			         <input type="text" id="keyWord" name="keyWord" placeholder="검색어 입력"
			            style="width:200px" class="form-control rounded-0 rounded-start" value="${pageDto.keyWord}"/>
			            
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
              <th>Email.</th>
              <th>Phone.</th>
              <th>Delete.</th>
          
            </tr>
          </thead>
          
       
          <tbody>
          	<c:set var ="rowNum" value= "${pageDto.startRowNum}"/>
            <c:forEach var="dto" items="${requestScope.dtos}">
              <tr>
                <td>${rowNum}</td>
                <td>${dto.id}</td>
                <td>${dto.name}</td>
                <td>${dto.email}</td>
                <td>${dto.phone}</td>
                <td>
                  <a href="javascript:pdDel('${dto.no}')" class="btn btn-sm text-white" style="background-color: black;">Delete</a>
                </td>
              </tr>
              <c:set var="rowNum" value="${rowNum-1}"/>
            </c:forEach>
          </tbody>
          
        </table>
        		
			<ul class="pagination justify-content-center mt-4">
			  <li class="page-item ${pageDto.prevPage <= 0 ? 'd-none':''}">
			     <a class="page-link bg-dark text-light" href="users.do?viewPage=${pageDto.prevPage}&cntPerPage=${pageDto.cntPerPage}">Prev</a>
			  </li>
			  
			  <c:forEach var="i" begin="${pageDto.blockStart}" end="${pageDto.blockEnd}">
			     <li class="page-item ${pageDto.viewPage == i ? 'active':''}">
			        <a class="page-link bg-secondary text-light ${pageDto.viewPage == i ? 'border border-dark':''}" href="users.do?viewPage=${i}&cntPerPage=${pageDto.cntPerPage}&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}">${i}</a>
			     </li>
			  </c:forEach>
			  
			  <li class="page-item ${pageDto.blockEnd >= pageDto.totalPage ? 'd-none':''}">
			     <a class="page-link bg-dark text-light" href="users.do?viewPage=${pageDto.nextPage}&cntPerPage=${pageDto.cntPerPage}">Next</a>
			  </li>
			</ul>
      </div>
      </div>
   
 

<script>
	function pdDel(no){
		var isDel = window.confirm("삭제 하시겠습니까?");
		if(isDel) location.href = "usersDel.do?no="+no;
	}
	

	function openModal(button) {
	  $('#productModal').modal('show');
	}
	
	 $("#cntPerPage").change(function(e){
	      let cntVal = $("#cntPerPage option:selected").val();
	      location.href="<c:url value='users.do?viewPage=1&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}&cntPerPage='/>"+cntVal;      
	 });
</script>	


<%@ include file ="inc/ad_footer.jsp"%>