package com.ming.boot.seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatService {
	@Autowired private SeatMapper mapper;

	public List<SeatDTO> getSeat(String no) {
		mapper.getSeat(no);
		return null;
	}
}
