<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:import url="/header" />
<script src="seat.js"></script>
<div align="center" class="container basicFont">
	<div class="SeatTop">
		<p class="font_title">좌석 지정 페이지</p>
		<hr class="hrCss">
	</div>
	
	<!-- 좌석 현황 표출 -->
	<div class="showSeatArea">
		<c:forEach var="seat_class" items="F, E, B">
			<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="${seat_class }_div">
				<c:forEach var="s_no" begin="1" end="3">
					<input type="radio" class="btn-check" autocomplete="off" name="seat_no"
					id="${seat_class }${s_no }" value="${seat_class }${s_no }">
					<label class="btn btn-outline-primary" for="${seat_class }${s_no }"
					 id="${seat_class }${s_no }_lb">${seat_class}${s_no }</label>
				</c:forEach>
			</div>
			<br>
			<br>
		</c:forEach>
	</div>
	<c:forEach var="s" items="${seats}">
		<c:set var="seatNo" value="${fn:substring(s, 0, 1)}"></c:set>
		<script>
		console.log("${s}");
		$("#${s}").attr("disabled",true)
		$("#${s}_lb").attr("class", "btn btn-secondary")
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
	        <button class="btn btn-default" data-bs-dismiss="modal">취소</button>
	        <button class="btn btn-primary" id="btnCheckIn" onclick="finalCheck()">체크인</button>
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
	      
		        <button class="btn btn-default" data-bs-dismiss="modal" id="btnBack">돌아가기</button>
		        <button class="btn btn-primary" onclick="submit()">최종 완료하기</button>
	      
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
</div>	
<c:import url="/footer" />