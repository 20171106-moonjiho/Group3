package com.ming.boot.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ming.boot.seat.SeatDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {
	@RequestMapping("complete")
	public String paymentComplete(@RequestBody String imp_uid, String merchant_uid, String totalPrice, HttpSession session
			,@RequestBody SeatDTO seatDTO) throws Exception {
		return "payment/complete";
	}
	
	
	
}
