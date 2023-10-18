package com.ming.boot.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleMapper {

	void insert(ScheduleDTO dto);

	List<ScheduleDTO> list();

}
