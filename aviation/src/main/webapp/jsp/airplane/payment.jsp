<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
결재 페이지<br>
<form action="registReservation" method="post">
	<input type='hidden' name= 'airplane_no' value="${seat.airplane_no}">
	<input type='hidden' name= 'member_id' value="${seat.member_id}">
	<input type='hidden' name= 'seat_no' value="${seat.seat_no}">
	<input type='hidden' name= 'passenger_name' value="${seat.passenger_name}">
<input type="submit">결재완료
</form>
<c:import url="/footer" />
    