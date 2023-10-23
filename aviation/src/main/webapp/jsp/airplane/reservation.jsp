<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<script>
	function changeColor(String seat){
		var box = document.getElementById(seat);
		box.bgcolor="blue";
	}
</script>
<div align="center">
	<table>
		<c:forEach var="column" begin="1" end="10">
			<tr>
				<c:forEach var="row" items="A,B,C">
					<th border="1"><input id ="${row }${column }" border = "1"
					 width="50" height="50" bgcolor="white" onclick="changeColor(${row }${column })">${row }${column }</div>
					</th>
				</c:forEach>
				<th width = "50"></th>
				<c:forEach var="row" items="D,E,F">
					<th border="1">${row }${column }
					</th>
				</c:forEach>
			</tr>
		</c:forEach>
		
	</table>
</div>
<c:import url="/footer" />










