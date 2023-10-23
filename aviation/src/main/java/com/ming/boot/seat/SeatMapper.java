package com.ming.boot.seat;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatMapper {

	void getSeat(String no);

}
