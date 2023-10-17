package com.ming.boot.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReservationController {
	@Autowired AirplaneDataService service;
	
	@GetMapping("airplane")
	public String airplane() {
		return "airplane/airplane";
	}
	
	@ResponseBody
	@PostMapping(value="airplane", produces = "application/json; charset=utf-8")
	public List<AirplaneDTO> ariplane() {
		return service.getAccessData();
	}
	
}
