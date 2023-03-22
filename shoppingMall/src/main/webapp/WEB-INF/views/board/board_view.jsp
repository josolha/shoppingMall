<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   

<%@ include file ="../user/inc/user_header.jsp"%>

<%@ include file ="../user/inc/user_sidebar.jsp"%>


	<div class="w-100 shadow p-5 rounded border">
		<h3 class="text-center" style="text-decoration: underline; text-underline-position: under;">Board View</h3>
		<table class="table table-borderless mt-4">
		    <tbody>
		      <tr>
		        <td><label for="bid">No.</label></td>
		        <td><input type="text" class="form-control" id="bid" name="bid" disabled value="${dto.bid}" /></td>
		      </tr>
		      <tr>
		        <td><label for="subject">Subject.</label></td>
		        <td><input type="text" class="form-control" id="subject" name="subject" disabled value="<c:out value='${dto.subject}'/>" /></td>
		      </tr>
		      <tr>
		        <td><label for="contents">Contents.</label></td>
		        <td><textarea class="form-control" id="contents" name="contents" disabled rows="4"><c:out value='${dto.contents}'/></textarea></td>
		      </tr>
		      <tr>
		        <td><label for="writer">Writer.</label></td>
		        <td><input type="text" class="form-control" id="writer" name="writer" disabled value="<c:out value='${dto.writer}'/>" /></td>
		      </tr>
		    </tbody>
		  </table>
		<div class="form-group justify-content-center mt-4 text-center">
			<button type="button" id="btn-modify" class="btn btn-primary me-2">Modify</button>
			<button type="button" id="btn-remove" class="btn btn-danger me-2">Delete</button>
			<button type="button" id="btn-list" class="btn btn-primary">List</button>
		</div>
		
		
		
		<!-------------------- 댓글 UI ----------------------->
		
		<!-- 댓글 버튼 -->
		<div class="mt-5 mb-3 d-flex justify-content-between">
			<h6><i class="fa fa-comments-o"></i>Comment</h6>
			<button class="btn btn-sm btn-outline-secondary" id="btn-addReply"
			 	data-bs-target="#replyModal" data-bs-toggle="modal">New Comment</button>
		</div>
		
		
		<!-- 댓글 리스트 영역 -->
		<ul class="p-0 replyArea" style="list-style:none">
			<li class="mb-2 p-0">
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6>홍길동</h6><span>2022-12-22</span>	
					</div>
					<p>댓글 테스트 .......</p>
				</div>
			</li>
			<li class="mb-2 p-0">
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6>홍길동</h6><span>2022-12-22</span>	
					</div>
					<p>댓글 테스트 .......</p>
				</div>
			</li>
		</ul>
		<!---------------------------------------------------->
		
		
		<!--------------- pagination Area -------------------->
		<ul class="pagination justify-content-center my-5">
		  <li class="page-item">
		     <a class="page-link">이전</a>
		  </li>
		     <li class="page-item">
		        <a class="page-link">1</a>
		     </li>
 
		  <li class="page-item ">
		     <a class="page-link">다음</a>
		  </li>
		</ul>
		<!--------------------------------------------------->
		
	</div>


<!-- The Modal -->
<div class="modal fade" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header border-0">
      	<h5>댓글 달기</h5>
      </div>

      <!-- Modal body -->
      <form>
         <div class="modal-body p-4">
			<div class="mb-3">
				<label for="reply_contents">댓글 내용</label>
				<textarea class="form-control" id ="reply_contents"></textarea>
			</div>
			<div class="mb-3">
				<label for="replyer">댓글 작성자</label>
				<input type ="text" class="form-control" id="replyer" name="replyer"/>
			</div>
			<div class="mb-3">
				<label for="reply_date">등록일</label>
				<input type ="text" class="form-control" id="reply_date" name="reply_date"/>
			</div>
         </div>
         
         <!-- Modal footer -->
         <div class="modal-footer border-0">
         	<button type="button" id="btn-modal-modify" class="btn btn-sm btn-success">수정</button>
         	<button type="button" id="btn-modal-remove" class="btn btn-sm btn-danger">삭제</button>
         	<button type="button" id="btn-modal-register" class="btn btn-sm btn-primary">등록</button>
         	<button type="button" id="btn-modal-close" class="btn btn-sm btn-secondary">닫기</button>
         </div>
     </form>    

    </div>
  </div>
</div>

<script src="${ctxPath}/resources/js/reply.js"></script>
<script>

$(document).ready(function(){
	
   var bidValue = '<c:out value="${dto.bid}"/>';

   // 댓글 리스트 
   var replyArea = $(".replyArea");
   
   var viewPage  =1;
   
   displayList(viewPage);
   
   function displayList(viewPage){
	   
	      replyFunc.getList({bid:bidValue, viewPage : viewPage || 1}, function(data){
	    	  
	         var str ="";
	         
	         var list = data.list; // viewPage(1,2,3 페이지....)에 해당하는 댓글 리스트 
	         
	         // 댓글이 없는 경우에는 댓글 출력되지 않도록
	         if(list ==null || list.length == 0){
	            replyArea.html("");
	            return;
	         }
	         
	         // 댓글이 있는 경우
	         for(var i = 0; i <list.length; i++){
	        	 
	            str += '<li class="mb-2 p-0" data-rno="'+list[i].rno+'"style="cursor:pointer;">'
	            			+'<div class="form-control">'
	              				 +'<div class="d-flex justify-content-between">'
	              					 +'<h6>'+list[i].replyer+'</h6><span>'+replyFunc.showDateTime(list[i].r_date)+'</span>'
	             				  +'</div>'
	              			  	+'<p>'+list[i].r_contents+'</p>'                           
	              			+'</div>'
	              		+'</li>';
	         }
	         
	         replyArea.html(str);
	         
	         showPgNavi(data);
	         
	      });
	   }
   // pagination 처리 
   var pageArea = $(".pagination");
   
   function showPgNavi(data){
	   console.log("data :" +data);
	   console.log("blockStart :" +data.blockStart);
	   
	   var prevPage = data.prevPage;
	   var nextPage = data.nextPage;
	   var blockStart = data.blockStart;
	   var blockEnd = data.blockEnd;
	   
	   var totalPage = data.totalPage;
	   var viewPage = data.viewPage;
	   
	   var str = "";
	   
	   if(prevPage){
		   str += '<li class="page-item">'
			   +'<a class="page-link" href="'+prevPage+'">이전</a>'
			   +'</li>';
	   }
	   for(var i =blockStart; i<= blockEnd; i++){
		   var active = viewPage == i ? "active" : ""; 
			   
		   str += '<li class="page-item '+active+'">'
			   +'<a class="page-link" href="'+i+'">'+i+'</a>'
			   +'</li>';
	   }
	   if(blockEnd < totalPage){
		   str += '<li class="page-item">'
			   +'<a class="page-link" href="'+nextPage+'">다음</a>'
			   +'</li>';
	   }
	   
	   pageArea.html(str);
   }
   
   pageArea.on("click","li a",function(e){
	   e.preventDefault();
	   //$(this)는 a 태그 
	   var targetPage = $(this).attr("href");
	   
	   viewPage = targetPage;
	   
	   displayList(targetPage);
   });
   
   
////////////////////////Model & Event 처리////////////////////////
	var modal =  $(".modal");
	var taReplyContents = $("#reply_contents");
	var ipReplyer = $("#replyer");
	var ipReplyDate = $("#reply_date");
	
	var modifyBtn = $("#btn-modal-modify")
	var removeBtn = $("#btn-modal-remove")
	var registerBtn = $("#btn-modal-register")
	
	
	$("#btn-modal-close").on("click",function(){
		modal.modal("hide");
	});


	//모달창 열기
	//새댓글 버튼에 click 이벤트 발생하면 즉시실행함수 수행
	$("#btn-addReply").on("click",function(e){
		taReplyContents.val("");
		ipReplyer.val("");
		
		// closet()는 부모 중에 가장 가까운 조상을 선택
		ipReplyDate.closest("div").hide();
		
		// 닫기 버튼을 제외한 세개의 버튼은 숨김
		modal.find("button[id != 'btn-modal-close']").hide();
		registerBtn.show();
	});
	
	
	//등록
	registerBtn.on("click",function(e){
		if(taReplyContents.val() == null || taReplyContents.val().trim() ==""){
			alert("댓글을 입력하세요");
			taReplyContents.focus();
			return;
		}
		if(ipReplyer.val() == null || ipReplyer.val().trim() ==""){
			alert("작성자를 입력하세요");
			ipReplyer.focus();
			return;
		}
		
		// 댓글 입력 데이터를 JSON 형식으로 만들기
		var reply = {bid:bidValue,r_contents:taReplyContents.val(),replyer:ipReplyer.val()};
		
		replyFunc.register(reply, function(result){
					modal.modal("hide");
					displayList();
				}
			); 
	});
	
	//댓글 상세 보기 
	// 이벤트 위임(delegation) : 제이쿼리에서 on()함수를 이용해서 처리
	// 현재의 ul(.replyArea클래스) 태그에 이벤트를 주고 실제 이벤트 대상은 li가 되도록 위임(이벤트 전가)한다
	// click 이벤트가 li로 전달됨, 댓글이 없으면 li는 존재하지 않기 때문에 이벤트를 줄 수 가 없음
	// 따라서 항상 존재하는 ul에 이벤트를 주고 자식 li에게 전달해준다. 
	$(".replyArea").on("click","li",function(){
		// 여기서 $(this) 는  클랙된 li, 이벤트가 발생된 li
		var rno = $(this).data("rno"); // data-rno 값 가져오기
		//alert("rno :"+ rno); 
		
		//reply는 서버에서 전송된 JSON 형식의 댓글(rno,r_contents,replyer,r_date,update_date)
		replyFunc.get(rno, function(reply){
			taReplyContents.val(reply.r_contents);
			ipReplyer.val(reply.replyer).attr("readonly", true);
			ipReplyDate.val(reply.r_date).attr("readonly", true);;
			
			modal.data("rno",reply.rno);
			
			modal.find("button[id != 'btn-modal-close']").hide();
			modifyBtn.show();
			removeBtn.show();
			
			modal.modal("show");
		});
	});
	
	// 삭제
	removeBtn.on("click",function(){
		var rno = modal.data("rno");
		
		replyFunc.remove(rno,function(result){
			alert(result);
			modal.modal("hide");
			displayList();
		});
	});
	
	// 수정
	modifyBtn.on("click",function(){
		var reply = {rno: modal.data("rno"),r_contents : taReplyContents.val()}
		
		replyFunc.update(
				reply,
				function(result){
					alert(result);	
					modal.modal("hide");
					displayList();
				}
			); 
	});
	
});

	$("#btn-modify").click(()=>{
		location.href="<c:url value='/board/modify.do?bid=${dto.bid}'/>";
	})
	$("#btn-list").click(()=>{
		location.href="<c:url value='/board/list.do?viewPage=${pageDto.viewPage}&cntPerPage=${pageDto.cntPerPage}&searchType=${pageDto.searchType}&keyWord=${pageDto.keyWord}'/>";
	})
	$("#btn-remove").click(()=>{
		location.href="<c:url value='/board/remove.do?bid=${dto.bid}'/>";
	})

</script>

<%@ include file ="../user/inc/user_footer.jsp"%>