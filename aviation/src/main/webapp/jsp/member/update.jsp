<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<c:import url="/userHeader"/>
<div align="center">
	<font color="red" >${msg }</font>
	<h1>회원 수정</h1>
	<table ><tr><td>
	<form action="updateProc" method="post" id="f">
		<input type="text" value="${sessionScope.id }" id="id" readOnly> (*필수 항목) <br>
		<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
		<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm"
		onchange="pwCheck()">
		<label id="label" ></label><br>
		<input type="text" name="userName" id="userName" value="${sessionScope.userName }" readOnly ><br>
		<input type="text" value="${sessionScope.ssn1 }" name="ssn1" placeholder="주민번호 앞자리" size=6 maxlength=6 readOnly> -
		<input type="password" value="${sessionScope.ssn2 }" name="ssn2" placeholder="주민번호 뒷자리" readOnly size=7 maxlength=7><br>
		
		<input type="text" name="address" value="${sessionScope.address }"><br>
		<input type="text" name="mobile" value="${sessionScope.mobile }"><br>
		<input type="button" value="회원수정" onclick="allCheck()">
		<input type="button" value="취소" onclick="location.href='index'"><br>
	</form>
	</td></tr></table>
</div>
<c:import url="/userFooter"/>
<c:import url="/footer" />



