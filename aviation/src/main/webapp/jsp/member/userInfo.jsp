<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />

<div align="center">
	<form action="userInfo">
		<h1>개인 정보</h1>
		아이디 : ${sessionScope.id } <br> 
		<%-- 비밀번호 : ${sessionScope.pw }<br> --%>
		이름 : ${sessionScope.userName }<br>
		주민번호 : ${sessionScope.ssn1 } - ${sessionScope.ssn2 }<br>
		주소 : ${sessionScope.address } <br>
		전화번호 : ${sessionScope.mobile } <br><br>
		<button type="button" onclick="location.href='update'">회원 수정</button>
		<button type="button" onclick="location.href='delete'">회원 삭제</button>	
	</form>
</div>	

<c:import url="/footer"/>



















