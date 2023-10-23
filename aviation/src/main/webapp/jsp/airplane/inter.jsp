<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
    $(function() {
        $('#depart_port').autocomplete({
            source : function(request, response) {
                $.ajax({
                    type : 'get',
                    url: 'interSearch',
                    dataType : 'json',
                    data : {value : request.term},
                    success : function(data) {
                        // 서버에서 json 데이터 response 후 목록 추가
                        response(
                            $.map(data, function(item) {
                                return {
                                    label : item,
                                    value : item,
                                    test : item + 'test'
                                }
                            })
                        );
                    }
                });
            },
            select : function(event, ui) {
                console.log(ui);
                console.log(ui.item.label);
                console.log(ui.item.value);
                console.log(ui.item.test);
            },
            focus : function(event, ui) {
                return false;
            },
            minLength : 1,
            autoFocus : true,
            classes : {
                'ui-autocomplete': 'highlight'
            },
            delay : 500,
            position : { my : 'right top', at : 'right bottom' },
            close : function(event) {
                console.log(event);
            }
        });
    });
    $(function() {
        $('#arrive_port').autocomplete({
            source : function(request, response) {
                $.ajax({
                    type : 'get',
                    url: 'interSearch',
                    dataType : 'json',
                    data : {value : request.term},
                    success : function(data) {
                        // 서버에서 json 데이터 response 후 목록 추가
                        response(
                            $.map(data, function(item) {
                                return {
                                    label : item,
                                    value : item,
                                    test : item + 'test'
                                }
                            })
                        );
                    }
                });
            },
            select : function(event, ui) {
                console.log(ui);
                console.log(ui.item.label);
                console.log(ui.item.value);
                console.log(ui.item.test);
            },
            focus : function(event, ui) {
                return false;
            },
            minLength : 1,
            autoFocus : true,
            classes : {
                'ui-autocomplete': 'highlight'
            },
            delay : 500,
            position : { my : 'right top', at : 'right bottom' },
            close : function(event) {
                console.log(event);
            }
        });
    });
</script>

<div align="center">
	<h1>게시글 목록</h1>
		<form action="inter" method="post">
			출발<input name="depart_port" id="depart_port">
			도착<input name="arrive_port" id="arrive_port">
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










