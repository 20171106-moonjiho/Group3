package com.ming.boot.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.boot.seat.SeatDTO;
/*
CREATE TABLE payment(
order_no VARCHAR2(100) PRIMARY KEY,
imp_uid VARCHAR2(100),
status NUMBER
);*/

@Service
public class PaymentService {
	@Autowired private PaymentMapper mapper;
	
	public void regist(SeatDTO seat) {
		mapper.regist(seat);
		
	}
}
