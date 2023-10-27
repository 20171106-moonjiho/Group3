<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<script type="text/javascript">
$("#phoneAutChk").val("false");
$(function(){
	//휴대폰 번호 인증var code2 = "";
	
	$("#phoneChk").click(function(){
		var phone = $("#mobile").val();
		if(phone == null || phone == ""){
			alert('번호를 입력하세요.');
		}else{
		    alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
		    $.ajax({
		        type:"POST", // post 형식으로 발송
		        url:"mobileCheck", // controller 위치
		        data: {mobile:phone}, // 전송할 데이터값
		        cache : false,
		        success:function(data){
		            if(data == "error"){ //실패시 
		                alert("휴대폰 번호가 올바르지 않습니다.")
		            }else{            //성공시        
		                alert("휴대폰 전송이 됨.")
		                code2 = data; // 성공하면 데이터저장
		                //$("#phone2").attr("disabled", false);
		                $("#mobile").attr("readonly", true);
		            }
		        }       
		    });
		}
	}); 		


	//휴대폰 인증번호 대조
  $("#phoneChk2").click(function(){
      if($("#phone2").val() == code2){ // 위에서 저장한값을 비교함
           alert('인증성공')
           //$("#phone2").attr("disabled",true);
           $("#phoneAutChk").val("true");
           $("#phoneDoubleChk").val("true");
      }else{
          alert('인증실패')
           $("#phoneAutChk").val("false");
          $("#phoneDoubleChk").val("false");
      }
  });
});
</script>

<body>
<div align="center">
	<h1>회원 등록</h1>
	<table >
	<tr><td>
		<font color="red" >${msg }</font>
	</td></tr>
	<tr><td>
	<form action="registProc" method="post" id="f">
		<input type="text" name="id" placeholder="아이디" id="id"> (*필수 항목) <br>
		<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
		<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm"
		onchange="pwCheck()">
		<label id="label" ></label><br>
		<input type="text" name="userName" id="userName" placeholder="이름" ><br>
		<input type="text" name="ssn1" id="ssn1" placeholder="주민번호 앞자리" size=6 maxlength=6> -
		<input type="password" name="ssn2" id="ssn2" placeholder="주민번호 뒷자리" size=7 maxlength=7><br>
		
		<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="address" id="sample6_address" placeholder="주소"><br>
		<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소"><br>
		
		<!-- <input id="mobile" type="text" name="mobile" title="전화번호" required/> -->
		<input  class="signin_pass" id="mobile" type="text" name="mobile" title="전화번호 입력" placeholder="전화번호 입력해주세요">
        <input type="hidden" id="phoneAutChk"/>
        <input  class="signin_pass" type="button" value="입력" id="phoneChk"><br>  <!-- phoneChk 클릭시 함수 발동 -->
    	
        <input  class="signin_pass" id="phone2" type="text" name="phone2" title="인증번호 입력" placeholder="인증번호 입력해주세요">
        <input  class="signin_pass" type="button" value="인증확인" id="phoneChk2"><br> <!-- phoneChk 클릭시 함수 발동 -->
        <input type="hidden" id="phoneDoubleChk"/>
			
		<input type="button" value="회원가입" onclick="allCheck()">
		<input type="button" value="취소" onclick="location.href='index'"><br>
	</form>
	</td></tr></table>
</div>
<script src="avm.js"></script>
</body>

<c:import url="/footer" />