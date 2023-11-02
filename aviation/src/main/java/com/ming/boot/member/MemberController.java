package com.ming.boot.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ming.boot.reservation.AirplaneDataService;
import com.ming.boot.reservation.ScheduleDTO;
import com.ming.boot.seat.SeatDTO;
import com.ming.boot.seat.SeatService;

import jakarta.servlet.http.HttpSession;


@Controller
public class MemberController {
	@Autowired private MemberService service ;
	@Autowired private SeatService s_service;
	@Autowired private AirplaneDataService a_service;
	@Autowired private HttpSession session;
	
	@RequestMapping("regist")
	public String regist() {
		return "member/regist";
	}
	
	@PostMapping("registProc")
	public String registProc(MemberDTO member, String postcode, String detailAddress, Model model, RedirectAttributes ra) {
		if(member.getAddress() != null && member.getAddress().trim().isEmpty() == false)
			member.setAddress( postcode + "," + member.getAddress() + "," + detailAddress);
		
		String msg = service.registProc(member);
		
		if(msg.equals("회원 등록 완료")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		
		model.addAttribute("msg", msg);
		return "member/regist";
	}
	
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("loginProc")
	public String loginProc(String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(id, pw);
		if(msg.equals("로그인 성공")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		model.addAttribute("msg", msg);
		return "member/login";
	}

	@RequestMapping("logout")
	public String logout(RedirectAttributes ra) {
		if(session.getAttribute("kakao") != null) {
			kakaoService.unlink();
		}
		session.invalidate();
		ra.addFlashAttribute("msg", "로그 아웃");
		return "redirect:index";
	}
	
	@RequestMapping("memberInfo")
	public String memberInfo(String select, String search,
			@RequestParam(value="currentPage", required = false) String cp, Model model) {
		if(session.getAttribute("id") == null || !session.getAttribute("id").equals("admin"))
			return "redirect:index";
		service.memberInfo(select, search, cp, model);
		return "admin/memberInfo";
	}
	
	@RequestMapping("userInfo")
	public String userInfo(Model model,  RedirectAttributes ra) {
		String msg = service.userInfo(model);
		if(msg.equals("회원 검색 완료"))
			return "member/userInfo";
		
		ra.addFlashAttribute("msg", msg);
		return "redirect:index";
	}
	
	@RequestMapping("update")
	public String update() {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		return "member/update";
	}
	
	@PostMapping("updateProc")
	public String updateProc(MemberDTO member, Model model) {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		member.setId(sessionId);
		String msg = service.updateProc(member);
		if(msg.equals("회원 수정 완료")) {
			session.invalidate();
			return "redirect:index";
		}
		
		model.addAttribute("msg", msg);
		return "member/update";
	}
	
	@RequestMapping("delete")
	public String delete() {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		return "member/delete";
	}
	
	@PostMapping("deleteProc")
	public String deleteProc(MemberDTO member, Model model) {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:login";
		
		member.setId(sessionId);
		String msg = service.deleteProc(member);
		if(msg.equals("회원 삭제 완료")) {
			session.invalidate();
			return "redirect:index";
		}
		
		model.addAttribute("msg", msg);
		return "member/delete";
	}
	
	@RequestMapping("kakaoLogin")
	public String kakaoLogin(String code) {
		System.out.println("code : " + code);
		kakaoService.getAccessToken(code);
		kakaoService.getUserInfo();
		
		return "redirect:index";
	}
	@Autowired private KakaoService kakaoService;
	
	@RequestMapping("mobileCheck")
	@ResponseBody	
	public String sendSMS(String mobile) { // 휴대폰 문자보내기
		Random rand  = new Random(); //랜덤숫자 생성하기 !!
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
             
    	service.certifiedPhoneNumber(mobile, numStr); //휴대폰 api 쪽으로 가기 !!
    	// // 밑에 자세한 설명나옴
     
        return numStr;
    }
    
    @RequestMapping("userHeader")
    public String userHeader() {
    	return "member/userHeader";
    }
    
    @RequestMapping("userFooter")
   	public String userFooter() {
   		return "member/userFooter";
  	}
   	
   	@RequestMapping("myReservation")
   	public String myReservation(Model model) {
   		List<SeatDTO> list = s_service.getSeatByMember();
   		List<Integer> airplane_list = new ArrayList<>();
   		List<ScheduleDTO> result = new ArrayList<>();
   		for(SeatDTO seat : list) {
   			if(!airplane_list.contains(seat.getAirplane_no())) {
   				airplane_list.add(seat.getAirplane_no());
   			}
   		}
   		
   		for(int no : airplane_list) {
   			ScheduleDTO airplane = a_service.getAirplane(no);
   			result.add(airplane);
   		}
   		model.addAttribute("seats", list);
   		model.addAttribute("airplanes", result);
   		
   		return "member/myReservation";
   	}
   	
   	@RequestMapping("cancel")
   	public String cancel(SeatDTO seat) {
		if(session.getAttribute("id")==null) {
			return "redirect/login";
		}
   		SeatDTO result = s_service.getbySeat(seat);
   		if(result == null || !result.getMember_id().equals(session.getAttribute("id")) ) {
   			return "redirect/myReseration";
   		}
   		s_service.delete(seat);
   		return "redirect/myReseration";
   	}
}