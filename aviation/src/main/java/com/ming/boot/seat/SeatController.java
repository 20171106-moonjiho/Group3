package com.ming.boot.seat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class SeatController {
	@Autowired SeatService service;
	@Autowired HttpSession session;
	
	@RequestMapping("reservation")
	public String reservation(String no, Model model) {
		if(session.getAttribute("id")==null) {
			return "redirect:login";
		}
		model.addAttribute("no", no);
		model.addAttribute("seats", service.getSeatByAirplane(no));
		return "airplane/reservation";
	}
	
	@PostMapping("payment")
	public String payment(SeatDTO seat, Model model) {
		model.addAttribute("seat", seat);
		return "airplane/payment";
	}
	
//	@PostMapping("registReservation")
//	public String registReservation(SeatDTO seat) {
//		service.regist(seat);
//		return "redirect:myReservation";
//	}
}