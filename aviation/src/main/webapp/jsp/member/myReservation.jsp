<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<c:import url="/userHeader"/>
<table border=1>
			<tr>
				<th width="250">항공사</th>
				<th width="100">항공편명</th>
				<th width="100">출발공항</th>
				<th width="60">도착공항</th>
				<th width="60">출발시각</th>
				<th width="60">도착시각</th>
				<th width="60">운항일</th>
				<th width="60">좌석</th>
				<th width="50">예약</th>				
			</tr>
			<c:forEach var="seat" items="${seats}">
				<c:forEach var="airplane" items="${airplanes}">
					<c:if test="${airplane.airplane_no == seat.airplane_no }">
						<tr>
							<td>${airplane.company }</td>
							<td>${airplane.airplane_name }</td>
							<td>${airplane.depart_port }</td>
							<td>${airplane.arrive_port }</td>
							<td>${airplane.depart_time }</td>
							<td>${airplane.arrive_time }</td>
							<td>${airplane.airplane_date }</td>
							<td>${seat.seat_no }</td>
							<td><button type="button" onclick="location.href='reservation?no=${airplane.airplane_no}'" >예약</button></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:forEach>
			<tr>
				<td colspan="8">
					${result }
				</td>
			</tr>
		</table>


<c:import url="/userFooter"/>
<c:import url="/footer" />
