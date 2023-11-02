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
import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	@Autowired AirplaneDataService service;
	@Autowired HttpSession session;
	
	@GetMapping("airplane")
	public String airplane() {
		if(session.getAttribute("id") == null || !session.getAttribute("id").equals("admin"))
			return "redirect:index";
		return "admin/airplane";
	}
	
	@ResponseBody
	@PostMapping(value="get", produces = "text/plain; charset=utf-8")
	public String get() {
		service.getAccessData();
		service.getAccessDataI();
		return "항공기 정보를 받아왔습니다.";
	}
	
	@ResponseBody
	@PostMapping(value="db", produces = "text/plain; charset=utf-8")
	public String db() {
		int domestic = service.makeDB();
		int inter = service.makeDB2();
		return "국내선 "+domestic+"행, 국제선 "+inter+"행 추가되었습니다.";
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
		service.getList2(depart_port, arrive_port, airplane_date, currentPage, model);
		return "airplane/inter";
	}
	
	@ResponseBody
	@PostMapping(value="airport", produces = "text/plain; charset=utf-8")
	public String airport() {
		service.getAirportData();
		return "공항 정보를 추가했습니다";
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
