<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	a {text-decoration: none; color:black;}
	ul {padding: 20px;}
	ul li {display: inline; padding: 15px;}
	.main_div{height: 150px; padding-top : 80px;}
</style>    

<script src="dbQuiz.js"></script>

<div align="center">
	<h1>AIR</h1>
</div>

<c:url var="context" value="/"/>
<div class="header__aligner -renew">
	<div class="header__logo -renew">
		<div class="logo">
			<a class="logo__air" href="" data-click-area="header-logo" data-click-name="AIR">AIR</a>
		</div>
	</div>
	<div class="header__util -renew">
		<div class="lang -renew _mo-hidden">
			<div class="lang__aligner -renew">
				<div class="lang__top">
					<div class="lang__util">
						<c:choose>
							<c:when test="${empty sessionScope.id }">
								<li><a href="${context }login">Login</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${context }logout">Logout</a></li>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	
	
	</div>
</div>
<div align="right">
	<hr>
	<ul>
		<li><a href="${context }index">HOME</a></li>
		<li><a href="${context }regist">Regist</a></li>
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<li><a href="${context }login">Login</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${context }logout">Logout</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="${context }memberInfo">MemberInfo</a></li>
		<li><a href="${context }boardForm">Board</a></li>
	</ul>
	<hr>
</div>








