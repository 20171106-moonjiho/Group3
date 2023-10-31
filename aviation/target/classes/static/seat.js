function confirmCheck(){
	if($('input:radio[name=seat_no]').is(':checked')){
		var seatNo = $('input[name=seat_no]:checked').val();
		$("#gogekSeat").val(seatNo);
		$("#modal_seatCheck").modal('toggle');
	}else{
		alert("좌석을 선택해 주세요.");				
	}
}
function finalCheck(){
	if($("#gogekName").val()===""){
		jQuery("label[for=gogekName]").empty();
		jQuery("label[for=gogekName]").append("탑승자 성명을 기입해주세요.");
		jQuery("label[for=gogekName]").fadeIn('fast');
		$("#gogekName").focus();
		setTimeout(function() {
			jQuery("label[for=gogekName]").fadeOut();
		}, 500);
		
	}  else {
		var tagForSeatCheck="";
		tagForSeatCheck+="<label class='"+$("#gogekSeat").val()+"'>";
		tagForSeatCheck+="";
		tagForSeatCheck+="<input type='hidden' name= 'seat_no' value='"+$("#gogekSeat").val()+"'>";
		tagForSeatCheck+="<input type='hidden' name= 'passenger_name' value='"+$("#gogekName").val()+"'>";
		tagForSeatCheck+="";
		tagForSeatCheck+="</label>";
		jQuery(".hiddenArea").empty();
		jQuery(".hiddenArea").append(tagForSeatCheck);
		
		var tagForConfirm="";
		tagForConfirm+="<label class='"+$("#gogekSeat").val()+"'>";
		tagForConfirm+="좌석번호: "+$("#gogekSeat").val()+"&nbsp;&nbsp;";
		tagForConfirm+="탑승자명: "+$("#gogekName").val()+"&nbsp;&nbsp;";
		tagForConfirm+="</label><br><br>";
		jQuery("#modal_confirmBody").empty();
		jQuery("#modal_confirmBody").append(tagForConfirm);
		
		alert($("#gogekSeat").val()+"번 좌석 선택이 완료되었습니다.");
		$("#modal_seatCheck").modal('toggle');
		$("#modal_confirm").modal('toggle');
		
		$("#gogekName").val("");
		$("#gogekPassport").val("");
	}
}
function submit(){
	$("#modal_confirm").modal('toggle');
	$("form[name=frm]").submit();
}