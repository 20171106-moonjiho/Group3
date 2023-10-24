<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	var xhr;
	function sendProc(){
		xhr = new XMLHttpRequest();
		xhr.open('post', 'airport')
		xhr.send();
		xhr.onreadystatechange = resProc;
	}
	
	function resProc(){
		if(xhr.readyState == 4 	&& xhr.status == 200){
			var resData = JSON.parse(xhr.responseText);
			//console.log(resData)
			//console.log(resData[0])
			//console.log(Object.keys(resData[0]))
			
			var printData = "";
			for(i = 0; i < resData.length; i++){
				var keys = Object.keys(resData[i])
				printData += "<tr>";
				for(j = 0; j < keys.length; j++){
					//console.log(resData[i][keys[j]])
					printData += "<td>"+resData[i][keys[j]]+"</td>";
				}
				printData += "</tr>";
			}
			document.getElementById('tbody').innerHTML = printData;
		}
	}
</script>
<body>
	
	<button type="button" onclick="sendProc()">실행</button>
	<table border=1>
		<thead>
			<tr>
				<th>항공사</th>
				<th>운항편명</th>
				<th>출발공항</th>
				<th>도착공항</th>
				<th>출발시간</th>
				<th>도착시간</th>
				<th>운항요일</th>
				<th>시작일자</th>
				<th>종료일자</th>
				<th>국내_국제</th>
			</tr>
		</thead>
		<tbody id="tbody">
			
		</tbody>
	</table>
</body>
</html>