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
<div class="header -renew">
<div class="header__aligner -renew">
	<div class="header__logo -renew">
		<div class="logo">
			<a class="logo__air" href="" data-click-area="header-logo" data-click-name="AIR">AIR</a>
		</div>
	</div>
	<div align="right" class="header__util -renew">
		<div class="lang -renew _mo-hidden">
			<div class="lang__aligner -renew">
				<div class="lang__top">
					<div class="lang__util">
						<div>
							<c:choose>
								<c:when test="${empty sessionScope.id }">
									<a href="${context }login">로그인</a>&nbsp;&nbsp;&nbsp;
								</c:when>
								<c:otherwise>
									<a href="${context }logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
								</c:otherwise>
							</c:choose>
							<a href="${context }regist">회원가입</a>&nbsp;&nbsp;&nbsp;								
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
<div align="center">
	<hr>
	<ul>
		<li><a href="${context }index">HOME</a></li>
		<li><a href="${context }domestic">국내선 예약</a></li>
		<li><a href="${context }inter">국제선 예약</a></li>
		<li><a href="${context }boardForm">문의</a></li>
	</ul>
	<hr>
</div>