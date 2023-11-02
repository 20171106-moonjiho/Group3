package com.ming.boot.seat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ming.boot.member.MemberDTO;

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
	public String payment(SeatDTO seat) {
		session.setAttribute("seat", seat);
		System.out.println(seat.getAirplane_no()+seat.getMember_id()+seat.getPassenger_name()+seat.getSeat_no());
		return "airplane/payment";
	}
	
	@RequestMapping("registReservation")
	public String registReservation() {
		SeatDTO seat = (SeatDTO) session.getAttribute("seat");
		service.regist(seat);
		session.removeAttribute("seat");
		return "redirect:myReservation";
	}
	
	@RequestMapping("cancel")
	public String cancel(Model model, SeatDTO seat) {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		model.addAttribute("seat", seat);
		return "member/cancel";
	}
	
	@PostMapping("cancelProc")
	public String cancelProc(MemberDTO member, SeatDTO seat, Model model) {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		//System.out.println(i);
		
		member.setId(sessionId);

		String msg = service.cancelProc(member, seat);
		if(msg.equals("예약 취소")) {
			
			return "redirect:myReservation";
		}
		
		model.addAttribute("msg", msg);
		return "member/cancel";
	}
}