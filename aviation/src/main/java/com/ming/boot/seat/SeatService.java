package com.ming.boot.seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SeatService {
	@Autowired private SeatMapper mapper;
	@Autowired private HttpSession session;

	public List<SeatDTO> getSeatByMember() {
		return mapper.getSeatByMember((String) session.getAttribute("id"));
		
	}

	public void regist(SeatDTO seat) {
		mapper.regist(seat);
		
	}

	public List<String> getSeatByAirplane(String no) {
		return mapper.getSeatByAirplane(no);
	}

	public SeatDTO getbySeat(SeatDTO seat) {
		return mapper.getBySeat(seat);
	}

	public void delete(SeatDTO seat) {
		mapper.delete(seat);
	}
}