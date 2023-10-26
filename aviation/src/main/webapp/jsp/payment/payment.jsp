<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        function requestPay() {
            IMP.request_pay(
                {
                    pg: "html5_inicis",		//KG이니시스 pg파라미터 값
                    pay_method: "card",		//결제 방법
                    merchant_uid: "1234578",//주문번호
                    name: "당근 10kg",		//상품 명
                    amount: 200,			//금액
      				buyer_email: "gildong@gmail.com",
      				buyer_name: "홍길동",
      				buyer_tel: "010-4242-4242",
      				buyer_addr: "서울특별시 강남구 신사동",
      				buyer_postcode: "01181"
     	
                },
                function (rsp) {
      				//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {
                        $.ajax({
                            url: "validate" + rsp.imp_uid,
                            method: "GET",
                            contentType: "application/json",
                            data: JSON.stringify({
                                imp_uid: rsp.imp_uid,            // 결제 고유번호
                                merchant_uid: rsp.merchant_uid,   // 주문번호
                                amount: rsp.paid_amount
                            }),
                        }).done(function (data) {
                            // 가맹점 서버 결제 API 성공시 로직
                        })
                    } else {
                        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                    }
                }
            );
        }
    </script>
    <meta charset="UTF-8"/>
    <title>Sample Payment</title>
</head>
<body>
<button onclick="requestPay()">결제하기</button>
<!-- 결제하기 버튼 생성 -->
</body>
</html>