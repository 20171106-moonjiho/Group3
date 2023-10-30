package com.ming.boot.payment;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ming.boot.seat.SeatDTO;

@Mapper
public interface PaymentMapper {

	int updateStatus(@Param("order_no")String order_no, @Param("imp_uid")String imp_uid, @Param("status")int status);

	void regist(SeatDTO seat);
	
}
