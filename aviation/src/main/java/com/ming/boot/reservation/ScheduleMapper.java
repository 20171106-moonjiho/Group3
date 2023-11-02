package com.ming.boot.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ScheduleMapper {

	void insert(ScheduleDTO dto);

	int totalCount(@Param("depart_port")String depart_port, @Param("arrive_port")String arrive_port,
									@Param("airplane_date")String airplane_date);

	List<ScheduleDTO> list(@Param("depart_port")String depart_port, @Param("arrive_port")String arrive_port,
									@Param("airplane_date")String airplane_date, @Param("begin")int begin,
									@Param("end")int end);

	ScheduleDTO getAirplane(int airplane_no);

	String getLastDate();

	String getLastDate2();

	int totalCount2(@Param("depart_port")String depart_port, @Param("arrive_port")String arrive_port,
					@Param("airplane_date")String airplane_date);

	List<ScheduleDTO> list2(@Param("depart_port")String depart_port, @Param("arrive_port")String arrive_port,
							@Param("airplane_date")String airplane_date, @Param("begin")int begin,
							@Param("end")int end);

}
