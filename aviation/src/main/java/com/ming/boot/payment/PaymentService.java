package com.ming.boot.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.boot.seat.SeatDTO;

@Service
public class PaymentService {
	@Autowired private PaymentMapper mapper;
	
	public void regist(SeatDTO seat) {
		mapper.regist(seat);
		
	}
}
