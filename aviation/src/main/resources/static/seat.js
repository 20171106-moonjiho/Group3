var confirmValue=false;
var inwon=1;

$(document).ready(function(){
	
	// 체크박스 클릭 시 
	$("input[type=checkbox]").change(function(){
		
		var seatNo=$(this).attr('id');
		
		if($(this).is(":checked")){
			if(inwon>0){ // 정상적인 상태
				$("#gogekSeat").val(seatNo);
	    		$("#modal_seatCheck").modal('toggle');
			} else { // 예약인원수 이상 클릭 시도할 때
				jQuery("label[for="+$(this).attr('id')+"]").addClass("active");
				alert("한 번에 한 좌석만 예약가능합니다." );
			} 
			
        } else{ // 이미 선택된 좌석을 한번 더 클릭 시
        	if(confirm("정말 해당 좌석 선택을 취소하시겠습니까?")){
        		var class_seatNo="."+seatNo;
        		console.log(class_seatNo);
        		jQuery(class_seatNo).remove();
        		jQuery("label[for="+$(this).attr('id')+"]").addClass("active");
        		inwon++;
        		alert(seatNo+"번 좌석을 취소하였습니다.");
        	} else {
        		jQuery("label[for="+$(this).attr('id')+"]").removeClass("active");
        	}
        }
		
		// 모달 상태에서 체크인버튼 클릭 시
		$("#btnCheckIn").click(function(){
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
				jQuery(".hiddenArea").append(tagForSeatCheck);
				
				var tagForConfirm="";
				tagForConfirm+="<label class='"+$("#gogekSeat").val()+"'>";
				tagForConfirm+="좌석번호: "+$("#gogekSeat").val()+"&nbsp;&nbsp;";
				tagForConfirm+="탑승자명: "+$("#gogekName").val()+"&nbsp;&nbsp;";
				tagForConfirm+="</label><br><br>";
				jQuery("#modal_confirmBody").append(tagForConfirm);
				
				console.log($("#gogekSeat").val()+", "+$("#gogekName").val());
				
				inwon--;
				alert($("#gogekSeat").val()+"번 좌석 선택이 완료되었습니다.");
				$("#modal_seatCheck").modal('toggle');
				
				$("#gogekName").val("");
				$("#gogekPassport").val("");
			}
		})
		
		$("#choiceCancel").click(function(){
			console.log($("#gogekSeat").val()+"취소");
			$("#gogekName").val("");
			$("#gogekPassport").val("");
			jQuery("label[for="+$("#gogekSeat").val()+"]").removeClass("active");
		});
		
		$("#btnGoNext").click(function(){
			$("#modal_confirm").modal('toggle');
			$("form[name=frm]").submit();
		});
		
		$("#btnBack").click(function(){
			// alert("go back");
			$("#modal_confirm").modal('toggle');
		});
		
    });
});

function confirmCheck(){
	if(inwon===0){
		console.log(inwon);
		$("#modal_confirm").modal('toggle');
	}else{
		alert("예약한 인원만큼 좌석을 체크인 해주세요.");				
	}
}