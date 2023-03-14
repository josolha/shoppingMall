<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="inc/ad_header.jsp"%>

<%@ include file ="inc/ad_sidebar.jsp"%>

	<div class="container mt-5 border shadow-sm p-5 mb-3 w-50">
		<h3 class ="text-center" style="text-decoration: underline; text-underline-position : under;" >Category Register</h3>
		<form action="${ctxPath}/categoryAdd.do" method="post" name ="categoryForm">
			<div class="mt-3">
				<label for ="code">Code. </label>
				<input type="text" class ="form-control" id="code"
					placeholder="카테고리 코드를 입력하세요" name="code"/>
			</div>
			
			<div class="my-3">
				<label for ="cate_name">Name. </label>
				<input type="text" class ="form-control" id="cate_name"
					placeholder="카테고리 명을 입력하세요" name="cate_name"/>
			</div>
			
			<div class="text-center">
				<input type="button" class="btn btn-sm text-white" style="background-color: black;" value="Register"
					onclick="cateInputChk()"/>
				<input type="reset" value="Cancle" class="btn btn-secondary btn-sm"/>
			</div>
			
		</form>
		
	</div>
	
	
	<script src="${ctxPath}/js/cateValidChk.js"></script>
	

<%@ include file ="inc/ad_footer.jsp"%>