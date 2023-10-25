package com.ming.boot.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AirportMapper {

	List<AirportDTO> searchAirport(String search);

	void insert(AirportDTO dto);

}