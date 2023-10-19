package com.ming.boot.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		service.getAccessData();
		service.makeSchedule();
		service.makeDB();
		return service.getSchedule();
	}
	
	@RequestMapping("domestic")
	public String airplaneFromProc(String depart_port, String arrive_port, String airplane_date,
									String currentPage, Model model) {
		service.getList(depart_port, arrive_port, airplane_date, currentPage, model);
		return "airplane/domestic";
	}
	
	@GetMapping("inter")
	public String inter() {
		service.getAirport();
		return "airplane/inter";
	}
	
}
