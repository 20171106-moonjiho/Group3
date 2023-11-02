<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<c:import url="/userHeader"/>

<div align="center">
<h1>예약 취소</h1>
<table>
	<tr><td>${msg }</td></tr>
	<tr><td>
	<form action="cancelProc" method="post">
		<input type="text" value="${sessionScope.id }" readonly="readonly"> <br>
		<input type="password" placeholder="비밀번호" name="pw"><br>
		<input type="password" placeholder="비밀번호 확인" name="confirm"><br>
		<input type="hidden" name="seat_no" value="${seat.seat_no }">
		<input type="hidden" name="airplane_no" value="${seat.airplane_no }">
		
		<input type="submit" value="예약 취소"> 
		<input type="button" value="취소" onclick="location.href='myReservation'">
	</form>
	</td></tr>
</table>
</div>

<c:import url="/userFooter"/>
<c:import url="/footer" />
