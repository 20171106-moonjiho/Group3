package com.ming.boot.seat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SeatController {
	@Autowired SeatService service;
	
	@RequestMapping("reservation")
	public String reservation(String no, Model model) {
		//model.addAttribute("seats", service.getSeat(no));
		return "airplane/reservation";
	}
}
