<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- iamport.payment.js -->
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP;
        IMP.init("imp78620537");
        
        let airplane_no = document.getElementById('airplane_no');
    	let seat_no = document.getElementById('seat_no');
    	let member_id = document.getElementById('member_id');
    	let passengerName = document.getElementById('passenger_name');
    	
    	let pay = Number(document.getElementById('pay'));
    	
    	function createOrderNum(){
    		const date = new Date();
    		const year = date.getFullYear();
    		const month = String(date.getMonth() + 1).padStart(2, "0");
    		const day = String(date.getDate()).padStart(2, "0");
    		
    		let orderNum = year + month + day;
    		for(let i=0;i<10;i++) {
    			orderNum += Math.floor(Math.random() * 8);	
    		}
    		return orderNum;
    	}
    	
        function requestPay() {
            IMP.request_pay(
                {
                    pg: "html5_inicis.INIBillTst",		//KG이니시스 pg파라미터 값
                    pay_method: "card",		//결제 방법
                    merchant_uid: "merchant_" + createOrderNum(),//주문번호
                    name: $("#seat_no").val(),		//상품 명
                    amount: $("#pay").val(),			//금액
      				buyer_email: "",
      				buyer_name: $("#passengerName").val(),
      				buyer_tel: $("#mobile").val(),
      				buyer_addr: "seoul",
      				buyer_postcode: "10597"
     	
                },
                function (rsp) {
      				//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {
                        $.ajax({
                            url: "verify/" + rsp.imp_uid,
                            method: "POST",
                            contentType: "application/json",
                            data: JSON.stringify({
                                imp_uid: rsp.imp_uid,            // 결제 고유번호
                                merchant_uid: rsp.merchant_uid,   // 주문번호
                                amount: rsp.paid_amount
                            }),
                        }).done(function (data) {
                            // 가맹점 서버 결제 API 성공시 로직
                        	if(rsp.paid_amount == data.response.amount){
              		        	succeedPay(rsp.imp_uid, rsp.merchant_uid);
              	        	} else {
              	        		alert("결제 검증 실패");
              	        	}
                        })
                    } else {
                        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                    }
                }
            );
        }
        
        function succeedPay(imp_uid, merchant_uid){
    		$.ajax({  
    			 url : 'succeed',
    			 type : 'POST',
    			 async : true,
    			 dataType : "Json", 
    			 data :{
    				imp_uid: imp_uid,            // 결제 고유번호
    	            merchant_uid: merchant_uid   // 주문번호 
    			 },
    			 success : function(data){
    				 if(data.cnt > 0){
    	            	var msg = '결제 및 검증이 완료되었습니다.'
    	          		alert(msg)
    	            	location.href="registReservation"
    	            }else{
    	            	var msg = '결제가 완료되었으나 에러가 발생했습니다.'
    	               	alert(msg)
    	               	location.href="reservation"
    			 }
    			 }, 
    			 error : function (e){
    				 alert("에러")
    			 }
    		});
    	}
        
    </script>

<c:import url="/header" />
		<input type='hidden' name= 'airplane_no' value="${seat.airplane_no}">
		<input type='hidden' name= 'member_id' value="${seat.member_id}">
		<input type='hidden' id="seat_no" name= 'seat_no' value="${seat.seat_no}">
		<input type='hidden' id='mobile' name='mobile' value="${avm.mobile }">
		<input type='hidden' id='address' name='address' value="${avm.address }">
		<input type='hidden' id='passengerName' name= 'passenger_name' value="${seat.passenger_name}">
		<input type='hidden' id='pay' name= 'pay' value="${pay}">
		<input type='button' onclick="requestPay()" value="결제하기">
<c:import url="/footer" />
</html>