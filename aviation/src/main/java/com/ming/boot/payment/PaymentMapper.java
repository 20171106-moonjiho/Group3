package com.ming.boot.payment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {

	int updateStatus(int order_no, String imp_uid, int status);
	
}
