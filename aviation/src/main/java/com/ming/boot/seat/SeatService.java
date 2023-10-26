package com.ming.boot.seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SeatService {
	@Autowired private SeatMapper mapper;

	public List<SeatDTO> getSeat(String no) {
		//mapper.getSeat(no);
		return null;
	}
	
	@Autowired private HttpSession session;
	public String reservation(int airplane_no) {
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		return "";
	}
}
