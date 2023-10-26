<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Air : Seat Choice</title>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">-->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<!-- 직접 정의한 CSS
<link rel="stylesheet" href="resources/css/seat.css">--> 
<script src="seat.js"></script>
</head>

<body> 
<c:import url="/header" />
<div align="center" class="container basicFont">
	<div class="SeatTop">
		<a href="index">a<!-- <img src="resources/images/bomair_logo.png"/> --></a>
		<p class="font_title">좌석 지정 페이지</p>
		<hr class="hrCss">
	</div>
	
	<!-- 좌석 현황 표출 -->
	<div class="showSeatArea">
			<div class="btn-group" data-toggle="buttons" id="F_div">
				<label class="btn btn-big btn-primary" for="F1" id="F1_lb">
				<input type="checkbox" autocomplete="off" id="F1" value="F1">F1</label>
				<label class="btn btn-big btn-primary" for="F2" id="F2_lb">
				<input type="checkbox" autocomplete="off" id="F2">F2</label>
				<label class="btn btn-big btn-primary" for="F3" id="F3_lb">
				<input type="checkbox" autocomplete="off" id="F3">F3</label>
			</div>
			<br>
			<br>
			<div class="btn-group" data-toggle="buttons" id="E_div">
				<label class="btn btn-big btn-primary" for="E1" id="E1_lb">
				<input type="checkbox" autocomplete="off" id="E1">E1</label>
				<label class="btn btn-big btn-primary" for="E2" id="E2_lb">
				<input type="checkbox" autocomplete="off" id="E2">E2</label>
				<label class="btn btn-big btn-primary" for="E3" id="E3_lb">
				<input type="checkbox" autocomplete="off" id="E3">E3</label>
			</div>
			<br>
			<br>
			<div class="btn-group" data-toggle="buttons" id="B_div">
				<label class="btn btn-big btn-primary" for="B1" id="B1_lb">
				<input type="checkbox" autocomplete="off" id="B1">B1</label>
				<label class="btn btn-big btn-primary" for="B2" id="B2_lb">
				<input type="checkbox" autocomplete="off" id="B2">B2</label>
				<label class="btn btn-big btn-primary" for="B3" id="B3_lb">
				<input type="checkbox" autocomplete="off" id="B3">B3</label>
			</div>
			<br>
			<br>
		</div>
	<c:forEach var="s" items="${seats}">
		<c:set var="seatNo" value="${fn:substring(s, 0, 1)}"></c:set>
		<script>
		//console.log("${s}");
		$("#${s}_lb").attr("disabled",true)
		$("#${seatNo}_div").attr("style", "background-color: red")
		</script>
	</c:forEach>
	<!-- Modal : 좌석 체크  -->
	<div class="modal fade" id="modal_seatCheck" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">체크인 : 좌석선택</h4>
	      </div>
	      <div class="modal-body">
	      		<div class="form-group">
		            좌석번호 : <label for="gogekSeat" class="control-label"></label>
		            <input type="text" class="form-control" id="gogekSeat" value="" readonly/>
		          </div>
		          <div class="form-group">
		            탑승자 성명 : <label for="gogekName" class="control-label dispAlert" style="color:red;"></label>
		            <input type="text" class="form-control" id="gogekName">
		          </div>
	      </div>
	      <div class="modal-footer">
	        <button class="btn btn-default" data-dismiss="modal" id="choiceCancel">취소</button>
	        <button class="btn btn-primary" id="btnCheckIn">체크인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal : 체크인 내역 최종확인 -->
	<div class="modal fade" id="modal_confirm" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">좌석 선택 내역 확인</h4>
	        <h5 class="modal-title" id="myModalLabel">한 번 체크인한 좌석은 변경할 수 없으니 신중히 확인해주세요.</h5>
	      </div>
	      <div id="modal_confirmBody" class="modal-body">
	      
	      </div>
	      <div class="modal-footer">
	        <button class="btn btn-default" data-dismiss="modal" id="btnBack">돌아가기</button>
	        <button class="btn btn-primary" id="btnGoNext">최종 완료하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 최종전송 폼 -->
	<form action="payment" method="POST" name="frm">
		<input type='hidden' name= 'airplane_no' value="${no}">
		<input type='hidden' name= 'member_id' value="${sessionScope.id}">
		<input type="hidden" name="seatTableName" value="${a_seat }">
		<div class="hiddenArea"></div>
		<div class="css_btnSubmit">
			<input type="button" value="체크인 완료하기" class="btn btn-big btn-success" onclick="confirmCheck();">
		</div>
	</form>

	<br><br>	
	<!-- <a href="showCheckinInfo">Go to 체크인 내역 확인 페이지 (확인용, 철거예정)</a> -->
	
</div>	
<c:import url="/footer" />
</body>
</html>