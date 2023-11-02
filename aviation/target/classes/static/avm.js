function allCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	userName = document.getElementById('userName');
	ssn1 = document.getElementById('ssn1');
	ssn2 = document.getElementById('ssn2');
	mobile = document.getElementById('mobile');
	phone2 = document.getElementById('phone2');
	
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else if(confirm.value == ""){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(userName.value == ""){
		alert('이름은 필수 항목입니다.');
	}else if(ssn1.value == ""){
		alert('주민번호는 필수 항목입니다.');
	}else if(ssn2.value == ""){
		alert('주민번호는 필수 항목입니다.');
	}else if(mobile.value == ""){
		alert('전화번호는 필수 항목입니다.');
	}else if(phone2.value == ""){
		alert('인증번호를 입력하세요.');
	}else if($("#phoneAutChk").val() != "true"){
		alert('휴대폰 인증을 완료해주세요')
	}else if($("#phoneDoubleChk").val() != "true"){
		alert('휴대폰 인증을 완료해주세요')
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

function updateCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	userName = document.getElementById('userName');
	ssn1 = document.getElementById('ssn1');
	ssn2 = document.getElementById('ssn2');
	mobile = document.getElementById('mobile');
	
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else if(confirm.value == ""){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(userName.value == ""){
		alert('이름은 필수 항목입니다.');
	}else if(ssn1.value == ""){
		alert('주민번호는 필수 항목입니다.');
	}else if(ssn2.value == ""){
		alert('주민번호는 필수 항목입니다.');
	}else if(mobile.value == ""){
		alert('전화번호는 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

function pwCheck(){
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	label = document.getElementById('label');
	 if(pw.value == confirm.value){
		 label.innerHTML = '일치'
	 }else{
		 label.innerHTML = '불일치'
	 }
	// window.alert('pwCheck 호출')
}

function loginCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}