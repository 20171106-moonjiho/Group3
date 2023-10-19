<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 minDate: 1,
                 maxDate: 14 
            });    
    });
</script>

<div align="center">
	<h1>게시글 목록</h1>
		<form action="domestic" method="post">
			출발<select name="depart_port">
				<option value="GMP">김포</option>
				<option value="CJU">제주</option>
				<option value="PUS">부산</option>
				<option value="MWX">무안</option>
				<option value="CJJ">청주</option>
				<option value="TAE">대구</option>
				<option value="WJU">원주</option>
				<option value="KPO">포항</option>
				<option value="USN">울산</option>
				<option value="HIN">사천</option>
				<option value="KUV">군산</option>
				<option value="KWJ">광주</option>
				<option value="RSU">여수</option>
				<option value="ICN">인천</option>
			</select>
			도착<select name="arrive_port">
				<option value="GMP">김포</option>
				<option value="CJU">제주</option>
				<option value="PUS">부산</option>
				<option value="MWX">무안</option>
				<option value="CJJ">청주</option>
				<option value="TAE">대구</option>
				<option value="WJU">원주</option>
				<option value="KPO">포항</option>
				<option value="USN">울산</option>
				<option value="HIN">사천</option>
				<option value="KUV">군산</option>
				<option value="KWJ">광주</option>
				<option value="RSU">여수</option>
				<option value="ICN">인천</option>
			</select>
			날짜<input type="text" id="startDate" name="airplane_date">
			<button type="submit">조회</button>
		</form>
		<table border=1>
			<tr>
				<th width="250">항공사</th>
				<th width="100">항공편명</th>
				<th width="100">출발공항</th>
				<th width="60">도착공항</th>
				<th width="60">출발시각</th>
				<th width="60">도착시각</th>
				<th width="60">운항일</th>
				<th width="50">예약</th>				
			</tr>
			<c:forEach var="airplane" items="${schedule}">
				<tr>
					<td>${airplane.company }</td>
					<td>${airplane.airplane_name }</td>
					<td>${airplane.depart_port }</td>
					<td>${airplane.arrive_port }</td>
					<td>${airplane.depart_time }</td>
					<td>${airplane.arrive_time }</td>
					<td>${airplane.airplane_date }</td>
					<td><button type="button" onclick="location.href='reservation?no=${airplane.airplane_no}'" >예약</button></td>
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










