<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<c:import url="/adminHeader"/>
<script>
	var xhr;
	function get(){
		xhr = new XMLHttpRequest();
		xhr.open('post', 'get')
		xhr.send();
		xhr.onreadystatechange = resProc;
	}
	
	function db(){
		xhr = new XMLHttpRequest();
		xhr.open('post', 'db')
		xhr.send();
		xhr.onreadystatechange = resProc;
	}
	
	function airport(){
		xhr = new XMLHttpRequest();
		xhr.open('post', 'airport')
		xhr.send();
		xhr.onreadystatechange = resProc;
	}
	
	function resProc(){
		if(xhr.readyState == 4 	&& xhr.status == 200){
			alert(xhr.responseText);
		}
	}
</script>
<div align="center">
	<button type="button" onclick="get()">스케줄 받아오기</button>
	<button type="button" onclick="db()">db입력</button>
	<button type="button" onclick="airport()">공항 정보 입력</button>
</div>
<c:import url="/adminFooter"/>
<c:import url="/footer" />