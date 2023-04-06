

function checkAll() {
        // isChecked는 true, false 값을 갖는다.
        let isChecked = document.getElementById("checkAll").checked;

        let chks = document.getElementsByName("chk");
        for (let i = 0; i<chks.length; i++) {
          chks[i].checked = isChecked;
        }
      }
      
function prodDel(){
   let chks = document.getElementsByName("chk");
   let prodNumArray = [];
 
	
	//장바구니에서 삭제할 상품번호를 문자열로 생성해주는 로직
	//체크된 상번호가 7,9,10 --> "7/9/10"
   for(i=0; i<chks.length; i++){
		if(chks[i].checked){
			prodNumArray.push(chks[i].value);
		}
	}
	//상품이 체크되지 않았을 경우 메시지 출력
   if(prodNumArray.length === 0){
		alert("삭제할 상품을 체크하세요");
		return;
	}

	
   console.log(prodNumArray);
	
	// prodNumstr에 저장된 문자열("7/9/10")을 delProdNums input요소에 저장
	
//	document.cartForm.delProdNums.value = prodNumStr;
	
	let res = confirm("정말로 삭제하시겠습니다?");
	if(res){
		$.ajax({
			  url: '/jomaltwo/cart/delete',
			  type: 'post',
			  data: JSON.stringify(prodNumArray),
			  contentType: "application/json; charset=utf-8",
//			  dataType: "json",
			  success: function(result) {
				  alert("삭제 완료 했습니다.");
				  window.location.href = "/jomaltwo/checkout.do";
//				    // cartList를 사용하여 동적인 HTML 생성
//				    var tableBody = $('#cartTable tbody');
//				    tableBody.empty(); // 기존 목록 제거
//
//				    // cartList를 순회하면서 행 추가
//				    for (var i = 0; i < cartList.length; i++) {
//				      var cart = cartList[i];
//				      var row = $('<tr>');
//				      console.log(cart);
//				      row.append($('<td>').append($('<img>').attr('src', '/jomaltwo/resources/file_repo/' + cart.product.pimage).attr('width', '80px')));
//				      row.append($('<td>').text(cart.product.pname));
//				      row.append($('<td>').text(cart.product_cnt + ' pcs'));
//				      row.append($('<td>').text(new Intl.NumberFormat().format(cart.product.price) + '₩'));
//				      row.append($('<td>').append($('<span>').text(new Intl.NumberFormat().format(cart.product.price) + '₩')).append($('<br>')).append($('<span>').text(new Intl.NumberFormat().format(cart.product.ppoint) + 'Point')));
//				      row.append($('<td>').append($('<input>').attr('type', 'checkbox').attr('name', 'chk').val(cart.product.pnum)));
//
//				      tableBody.append(row);
//				    }
//				    
//				    var deleteButton = $('<a>').attr('href', 'javascript:prodDel();').addClass('btn btn bg-dark text-white').text('Delete');
//				    var deleteRow = $('<tr>').append($('<td>').attr('colspan', '5')).append($('<td>').append(deleteButton));
//				    tableBody.append(deleteRow);
//
//
//				    // 총액 표시 갱신
//				    var cartTotalPrice = 0;
//				    var cartTotalPoint = 0;
//				    for (var i = 0; i < cartList.length; i++) {
//				      var cart = cartList[i];
//				      cartTotalPrice += cart.product.price * cart.product_cnt;
//				      console.log(cartTotalPrice);
//				      cartTotalPoint += cart.product.ppoint * cart.product_cnt;
//				    }
//				    $('.cart-total-price').html('Total Cart Price: <b>' + new Intl.NumberFormat().format(cartTotalPrice) + '₩</b>');
//				    $('.cart-total-point').html('Total Cart Point: <b>' + new Intl.NumberFormat().format(cartTotalPoint) + 'Point</b>');
//				    
//				    
//	

				
			        },
			        
			    error: function () {
			        alert("삭제 실패");
			    }
			});
	}
}

//포인트 전액 체크가 되면 포인트 입력박스에 전액 포인트가 입력
// 전액체크를 해제하면 포인트 입력박스를 비우기 
function usePoint(obj,point,price){
	let input_point = document.getElementById("point");
	let totPrice = document.getElementById("cartTotPrice");
	
	if(obj.checked){
		//천단위 정규표현식 
		input_point.value = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		totPrice.innerText = (price-point).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
		disableCheck(price-point);
		
	
  
	}else{ // 체크 해제시
	 	input_point.value= "";
	 	totPrice.innerText = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	 	
	 	
		disableCheck(price);
	 	
	 	
	}
}

//5만원 이하 일시불만 가능하도록 보이도록 하는 함수
function disableCheck(value){
	
	if((value) <= 50000){
		document.getElementById("installments").options[0].selected = true;
		document.getElementById("installments").disabled = true;
	}
	else{
		
		document.getElementById("installments").disabled = false;
	}
}


//문자 입력시 자동 제거하기
function removeChar(e){
	e.target.value=e.target.value.replace(/[^0-9]/g,'');
}
//point input에 focus가 오면 값 지우기
function clearValue(obj){
	obj.value ="";
	let use = document.getElementById("use");
	if(use.checked){
		obj.value ="";
		use.checked = false;
	}
	
}
// 포인트 값이 직접 입력될때 동시에 결제 금액이 계산되는 함수
function enterKey(obj,point,price){
	let totPrice = document.getElementById("cartTotPrice");
	
	if(event.key >= 0 && event.key<10 || event.key=="Backspace"){
		if(obj.value <= point){ //적립 포인트 이하일떄
			let value = price -obj.value;
			
			totPrice.innerText = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			disableCheck(value);
		}
	}
}
// 포인트 입력금액이 적립 포인트액보다 클 경우 경고창 띄우기 
// 재입력 받기
function inputPoint(obj,point){
	if(obj.value >point){
		alert("적립 포인트가 부족합니다")
	}

}

//radio 버튼이 선택된 요소만 화면에 보이게 하는 함수
function selPayment(){
	let pm =document.getElementsByName("payment");
	
	for(let i =0; i<pm.length; i++){
		if(pm[i].checked){ //checked된 요소(element)는 display를 block으로 설정
			document.getElementById(pm[i].value).style.display="block";
		}else{
			document.getElementById(pm[i].value).style.display="none";
		}
	}
}
   
 