<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<c:import url="/userHeader"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="avm.js"></script>
<div align="center">
	<font color="red" >${msg }</font>
	<h1>회원 수정</h1>
	<table ><tr><td>
	<form action="updateProc" method="post" id="f">
		<input type="text" value="${sessionScope.id }" id="id" readOnly> (*필수 항목) <br>
		<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
		<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm"	onchange="pwCheck()"><br>
		<input type="text" name="userName" id="userName" value="${sessionScope.userName }" readOnly ><br>
		<input type="text" value="${sessionScope.ssn1 }" name="ssn1" size=6 readOnly> -
		<input type="password" value="${sessionScope.ssn2 }" name="ssn2" size=7 readOnly><br>
		
		<input type="text" name="postcode" id="sample6_postcode" value="${postcode }" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="address" id="sample6_address" value="${sessionScope.address }" placeholder="주소"><br>
		<input type="text" name="detailAddress" id="sample6_detailAddress" value="${detailAddress }" placeholder="상세주소"><br>
		<input type="text" name="mobile" value="${sessionScope.mobile }" readonly><br>
		<input type="button" value="회원수정" onclick="updateCheck()">
		<input type="button" value="취소" onclick="location.href='index'"><br>
	</form>
	</td></tr></table>
</div>
<c:import url="/userFooter"/>
<c:import url="/footer" />
