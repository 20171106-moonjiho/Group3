package com.ming.boot.payment;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.boot.seat.SeatDTO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {
	@Autowired private PaymentMapper mapper;
	@Autowired private PaymentService service;
	
	// Iamport
	private IamportClient iamportClient;

	public PaymentController(IamportAPI api) {
		String IAMPORT_API = api.getApi();
		String IAMPORT_API_SECRET = api.getApiSecret();
		iamportClient = new IamportClient(IAMPORT_API, IAMPORT_API_SECRET);
	}

	@PostMapping("verify/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
			@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {

		return iamportClient.paymentByImpUid(imp_uid);
	}

	@PostMapping("succeed")
	@ResponseBody
	public Map<Object, Object> updateStatus(HttpServletRequest req){
		
		String imp_uid = req.getParameter("imp_uid");
		String order_no = req.getParameter("merchant_uid");
		int status = 1;
		Map<Object, Object> map = new HashMap<>();

		//주문번호, 결제고유번호, 결제상태를 인자로 넘겨준다

		int res = mapper.updateStatus(order_no, imp_uid, status);
		if (res > 0) {
			map.put("cnt", 1);
		}else {
			map.put("cnt", 0);
		}			
	
		
		return map;
	}
	
	@PostMapping("registReservation")
	public String registReservation(SeatDTO seat) {
		service.regist(seat);
		return "redirect:myReservation";
	}
}
