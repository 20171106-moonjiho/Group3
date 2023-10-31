<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<c:import url="/userHeader"/>
<div align="center">
		<h2>개인 정보</h2>
	<table class="type05">
		<tr>
		<th>아이디</th>
		<td width="500">${sessionScope.id }</td>
		</tr>
		<tr>
		<th>이름</th>
		<td width="500">${sessionScope.userName }</td>
		</tr>
		<tr>
		<th>주소</th>
		<td width="500">${sessionScope.address }</td>
		</tr>
		<tr>
		<th>전화번호</th>
		<td width="500">${sessionScope.mobile }</td>
		</tr>	
	</table>
</div>	
<c:import url="/userFooter"/>
<c:import url="/footer"/>
