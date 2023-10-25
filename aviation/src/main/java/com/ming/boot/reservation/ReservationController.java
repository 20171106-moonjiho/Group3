package com.ming.boot.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ReservationController {
	@Autowired AirplaneDataService service;
	
	@GetMapping("airplane")
	public String airplane() {
		return "airplane/airplane";
	}
	
	@ResponseBody
	@PostMapping(value="airplane", produces = "application/json; charset=utf-8")
	public List<AirplaneDTO> airPlane() {
		service.getAccessData();
		service.makeSchedule();
		service.makeDB();
		return service.getSchedule();
	}
	
	@RequestMapping("domestic")
	public String domestic(String depart_port, String arrive_port, String airplane_date,
									String currentPage, Model model) {
		service.getList(depart_port, arrive_port, airplane_date, currentPage, model);
		return "airplane/domestic";
	}
	
	@RequestMapping("inter")
	public String inter(String depart_port, String arrive_port, String airplane_date,
									String currentPage, Model model) {
		if(depart_port != null && arrive_port != null && depart_port.contains(",") && arrive_port.contains(",")) {
			depart_port = depart_port.split(",")[0];
			arrive_port = arrive_port.split(",")[0];
		}
		service.getList(depart_port, arrive_port, airplane_date, currentPage, model);
		return "airplane/inter";
	}
	
	@ResponseBody
	@PostMapping(value="airport", produces = "application/json; charset=utf-8")
	public List<AirplaneDTO> airport() {
		service.getAirportData();
		return null;
	}
	
	@ResponseBody
	@GetMapping(value="interSearch", produces = "text/plain; charset=utf-8")
	public String interSearch(HttpServletRequest req) {
		String search = req.getParameter("value");
		List<String> list = service.searchAirport(search);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
}
