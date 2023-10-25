package com.ming.boot.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class ReservationService {

	@Autowired private HttpSession session;
	public String reservation(int airplane_no) {
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		
		return "";
	}
}
