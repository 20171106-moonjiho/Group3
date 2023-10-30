<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="avm.js"></script>
<script src="regist.js"></script>

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
		<input type="text" name="ssn1" placeholder="주민번호 앞자리" size=6 maxlength=6> -
		<input type="password" name="ssn2" placeholder="주민번호 뒷자리" size=7 maxlength=7><br>
		
		<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="address" id="sample6_address" placeholder="주소"><br>
		<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소"><br>
		
		<!-- <input id="mobile" type="text" name="mobile" title="전화번호" required/> -->
		<input  class="signin_pass" id="mobile" type="text" name="mobile" title="전화번호 입력" placeholder="전화번호 입력해주세요">
        <input type="hidden" id="phoneAutChk"/>
        <input  class="signin_pass" type="button" value="입력" id="phoneChk"><br>  <!-- phoneChk 클릭시 함수 발동 -->
    	
        <input  class="signin_pass" id="phone2" type="text" name="phone" title="인증번호 입력" placeholder="인증번호 입력해주세요" disabled required>
        <input  class="signin_pass" type="button" value="인증확인" id="phoneChk2"><br> <!-- phoneChk 클릭시 함수 발동 -->
        <input type="hidden" id="phoneDoubleChk"/>
			
		<input type="button" value="회원가입" onclick="allCheck()">
		<input type="button" value="취소" onclick="location.href='index'"><br>
	</form>
	</td></tr></table>
</div>

<c:import url="/footer" />