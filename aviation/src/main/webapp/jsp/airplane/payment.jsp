<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script>
    <!-- iamport.payment.js -->
    <script
            type="text/javascript"
            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
    ></script>
    <script>
        var IMP = window.IMP;
        IMP.init("imp78620537");
        
        /* let airplane_no = document.getElementById('airplane_no');
    	let seat_no = document.getElementById('seat_no');
    	confirm = document.getElementById('confirm');
    	userName = document.getElementById('userName'); */
    	
        function requestPay() {
            IMP.request_pay(
                {
                    pg: "html5_inicis.INIBillTst",		//KG이니시스 pg파라미터 값
                    pay_method: "card",		//결제 방법
                    merchant_uid: 'merchant_' + new Date().getTime(),//주문번호
                    name: "kk",		//상품 명
                    amount: 200,			//금액
      				buyer_email: "",
      				buyer_name: "홍길동",
      				buyer_tel: "010-4242-4242",
      				buyer_addr: "서울특별시 강남구 신사동",
      				buyer_postcode: "01181"
     	
                },
                function (rsp) {
      				//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {
                        $.ajax({
                            url: "verify" + rsp.imp_uid,
                            method: "GET",
                            contentType: "application/json",
                            data: JSON.stringify({
                                imp_uid: rsp.imp_uid,            // 결제 고유번호
                                merchant_uid: rsp.merchant_uid,   // 주문번호
                                amount: rsp.paid_amount
                            }),
                        }).done(function (data) {
                            // 가맹점 서버 결제 API 성공시 로직
                        	if(rsp.paid_amount == amount){
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
    	            	location.href="reservation"
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
    <title>Sample Payment</title>
	결제 페이지<br>
</head>
<body>
<!-- 결제하기 버튼 생성 -->
	<!-- <form action="registReservation" method="post"> -->
		<input type='hidden' name= 'airplane_no' value="${seat.airplane_no}">
		<input type='hidden' name= 'member_id' value="${seat.member_id}">
		<input type='hidden' name= 'seat_no' value="${seat.seat_no}">
		<input type='hidden' name= 'passenger_name' value="${seat.passenger_name}">
		<button onclick="requestPay()">결제하기</button>
	<!-- <input type="submit">결제완료 -->
	<!-- </form> -->
</body>
<c:import url="/footer" />
</html>