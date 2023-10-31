<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>index</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="table.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		a {text-decoration: none; color:black;}
		ul {padding: 20px;}
		ul li {display: inline; padding: 15px;}
		.main_div{height: 150px; padding-top : 80px;}
	</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="domestic">국내선 예약</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="inter">국제선 예약</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="boardForm">문의</a>
        </li>
      </ul>
    </div>
    <c:choose>
		<c:when test="${empty sessionScope.id }">
			<button type="button" class="btn btn-outline-light me-2" onclick="location.href='login'">로그인</button>
          	<button type="button" class="btn btn-warning" onclick="location.href='regist'">회원가입</button>
		</c:when>
		<c:otherwise>
			<span class="navbar-text">${sessionScope.userName }님 환영합니다.&nbsp;&nbsp;&nbsp;</span>
			<button type="button" class="btn btn-outline-light me-2" onclick="location.href='logout'">로그아웃</button>
          	<button type="button" class="btn btn-warning" onclick="location.href='userInfo'">마이페이지</button>
		</c:otherwise>
	</c:choose>
  </div>
</nav>

<div class="header -renew">
<div class="header__aligner -renew">
	<div align="right" class="header__util -renew">
		<div class="lang -renew _mo-hidden">
			<div class="lang__aligner -renew">
				<div class="lang__top">
					<div class="lang__util">
						<div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
<table align="center">
	<tr height="500">
		<td>
