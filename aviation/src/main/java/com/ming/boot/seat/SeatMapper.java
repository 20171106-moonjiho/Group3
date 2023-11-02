package com.ming.boot.seat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatMapper {

	List<SeatDTO> getSeatByMember(String id);

	void regist(SeatDTO seat);

	List<String> getSeatByAirplane(String no);
	void cancel(SeatDTO seat);

	int cancelProc(SeatDTO seat);

}
