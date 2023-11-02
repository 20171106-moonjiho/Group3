<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="airplane.js"></script>
<style>
	.ui-autocomplete {
		max-height: 300px;
		overflow-y: auto;
		/* prevent horizontal scrollbar */
		overflow-x: hidden;
	}
	</style>
<div align="center">
	<h1>국제선 조회</h1>
		<form action="inter" method="post">
			출발<input name="depart_port" id="depart_port">
			도착<input name="arrive_port" id="arrive_port">
			날짜<input type="text" id="startDate" name="airplane_date">
			<button type="submit">조회</button>
		</form>
		<table class="type05">
			<tr>
				<th width="100">항공사</th>
				<th width="100">항공편명</th>
				<th width="100">출발공항</th>
				<th width="100">도착공항</th>
				<th width="100">출발시각</th>
				<th width="100">도착시각</th>
				<th width="200">운항일</th>
				<th width="100">예약</th>				
			</tr>
			<c:forEach var="airplane" items="${schedule}">
				<tr>
					<td>${airplane.company }</td>
					<td>${airplane.airplane_name }</td>
					<td>${airplane.depart_port }</td>
					<td>${airplane.arrive_port }</td>
					<td>${airplane.depart_time }</td>
					<td>${airplane.arrive_time }</td>
					<td>${airplane.airplane_date }</td>
					<td><button type="button" onclick="location.href='reservation?no=${airplane.airplane_no}'" >예약</button></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8">
					${result }
				</td>
			</tr>
		</table>
</div>
<c:import url="/footer" />
