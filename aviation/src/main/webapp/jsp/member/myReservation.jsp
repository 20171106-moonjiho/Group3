<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<c:import url="/userHeader"/>
<table class="type05">
			<tr height="50">
				<th width="100">항공사</th>
				<th width="100">항공편명</th>
				<th width="100">출발공항</th>
				<th width="100">도착공항</th>
				<th width="100">출발시각</th>
				<th width="100">도착시각</th>
				<th width="200">운항일</th>
				<th width="100">좌석</th>
				<th width="100">취소</th>				
			</tr>
			<c:forEach var="seat" items="${seats}">
				<c:forEach var="airplane" items="${airplanes}">
					<c:if test="${airplane.airplane_no == seat.airplane_no }">
						<tr height="50">
							<td>${airplane.company }</td>
							<td>${airplane.airplane_name }</td>
							<td>${airplane.depart_port }</td>
							<td>${airplane.arrive_port }</td>
							<td>${airplane.depart_time }</td>
							<td>${airplane.arrive_time }</td>
							<td>${airplane.airplane_date }</td>
							<td>${seat.seat_no }</td>
							<td><button type="button"
							 	onclick="location.href='cancel?airplnae_no=${seat.airplane_no}&seat_no=${seat.seat_no }'" >
							 	취소</button></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:forEach>
		</table>


<c:import url="/userFooter"/>
<c:import url="/footer" />
