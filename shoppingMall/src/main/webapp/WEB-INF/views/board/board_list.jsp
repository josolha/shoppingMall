<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../user/inc/user_header.jsp"%>

<%@ include file ="../user/inc/user_sidebar.jsp"%>

<c:if test="${requestScope.msg !=null}">
<script>
	alert("${requestScope.msg}");
</script>
</c:if>


      
        <h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Board List</h3>
        <div class="mt-5 d-flex justify-content-between">
		
			   <div class="mt-2">
			      <b>${pageDto.viewPage}</b> / ${pageDto.totalPage} pages 
			   </div>
			   
			   <form id="searchForm" method="post" action="${ctxPath}/board/list.do">
			   
			      <div class="d-flex justify-content-center">
			         <select class="form-select me-2" style="width:200px" name="searchType">
			         
			         	<!-- 선택을 꼭 하게 js 설정 필요 -->
			         	 <option value="">선택</option>
			            <option value="S"
			               <c:out value="${pageDto.searchType == 'S' ? 'selected' : ''}"/>>Subject.</option>
			            <option value="C"
			               <c:out value="${pageDto.searchType == 'C' ? 'selected' : ''}"/>>Contents.</option>
			            <option value="W"
			               <c:out value="${pageDto.searchType == 'W' ? 'selected' : ''}"/>>Writer.</option>               
			            <option value="SC"
			               <c:out value="${pageDto.searchType == 'SC' ? 'selected' : ''}"/>>Subject.+Contents.</option>
			            <option value="SW"
			               <c:out value="${pageDto.searchType == 'SW' ? 'selected' : ''}"/>>Subject.+Writer.</option>
			            <option value="SCW"
			               <c:out value="${pageDto.searchType == 'SCW' ? 'selected' : ''}"/>>All.</option>
			          	
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
              <th>Subject.</th>
              <th>Hit.</th>
              <th>Writer.</th>
              <th>Date.</th>
            </tr>
          </thead>
          
       
          <tbody>
          	<c:set var ="rowNum" value= "${pageDto.startRowNum}"/>
            <c:forEach var="dto" items="${requestScope.bDto}">
              <tr>
                <td><c:out value="${rowNum}"/></td>
                <td><a href="<c:url value='/board/view.do?bid=${dto.bid}&viewPage=${pageDto.viewPage}&cntPerPage=${pageDto.cntPerPage}&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}'/>"/><c:out value="${dto.subject}"/></a></td>
                <td><c:out value="${dto.hit}"/></td>
                <td><c:out value="${dto.writer}"/></td>
                <td><c:out value="${dto.regDate}"/></td>
              </tr>
              <c:set var="rowNum" value="${rowNum-1}"/>
            </c:forEach>
          </tbody>
          
        </table>
        	
        	<ul class="pagination justify-content-center mt-4">
        		<button class="btn btn bg-dark text-light" id="btn-write">Write</button>
        	</ul>
        		
			<ul class="pagination justify-content-center mt-4">
			  <li class="page-item ${pageDto.prevPage <= 0 ? 'd-none':''}">
			     <a class="page-link bg-dark text-light" href="${ctxPath}/board/list?viewPage=${pageDto.prevPage}&cntPerPage=${pageDto.cntPerPage}">Prev</a>
			  </li>
			  
			  <c:forEach var="i" begin="${pageDto.blockStart}" end="${pageDto.blockEnd}">
			     <li class="page-item ${pageDto.viewPage == i ? 'active':''}">
			        <a class="page-link bg-secondary text-light ${pageDto.viewPage == i ? 'border border-dark':''}" href="${ctxPath}/board/list.do?viewPage=${i}&cntPerPage=${pageDto.cntPerPage}&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}">${i}</a>
			     </li>
			  </c:forEach>
			  
			  <li class="page-item ${pageDto.blockEnd >= pageDto.totalPage ? 'd-none':''}">
			     <a class="page-link bg-dark text-light" href="${ctxPath}/board/list.do?viewPage=${pageDto.nextPage}&cntPerPage=${pageDto.cntPerPage}">Next</a>
			  </li>
			</ul>

<script>
	$(document).ready(function(){
	    $("#btn-write").click(() => {
	       location.href="<c:url value='register.do'/>";
	    })
	 });
	
	 $("#cntPerPage").change(function(e){
	      let cntVal = $("#cntPerPage option:selected").val();
	      location.href="<c:url value='/board/list.do?viewPage=1&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}&cntPerPage='/>"+cntVal;      
	 });
</script>	


<%@ include file ="../user/inc/user_footer.jsp"%>