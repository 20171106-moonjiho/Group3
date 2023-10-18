<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<div align="center">
	<h1>게시글 목록</h1>
		<table border=1>
			<tr>
				<th width="50">No.</th>
				<th width="250">항공사</th>
				<th width="100">항공편명</th>
				<th width="100">출발공항</th>
				<th width="60">도착공항</th>
				<th width="60">출발시각</th>
				<th width="60">도착시각</th>
				<th width="60">운항일</th>				
			</tr>
			<c:forEach var="airplane" items="${schedule}">
				<tr>
					<td>${airplane.airplane_no }</td>
					<td>${airplane.company }</td>
					<td>${airplane.airplane_name }</td>
					<td>${airplane.depart_port }</td>
					<td>${airplane.arrive_port }</td>
					<td>${airplane.depart_time }</td>
					<td>${airplane.arrive_time }</td>
					<td>${airplane.airplane_date }</td>
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










