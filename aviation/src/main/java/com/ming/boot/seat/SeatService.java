package com.ming.boot.seat;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ming.boot.member.IMemberMapper;
import com.ming.boot.member.MemberDTO;
import com.ming.boot.reservation.ScheduleDTO;
import com.ming.boot.reservation.ScheduleMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class SeatService {
	@Autowired private IMemberMapper m_mapper; 
	@Autowired private SeatMapper mapper;
	@Autowired private HttpSession session;
	@Autowired private ScheduleMapper s_mapper;

	public List<SeatDTO> getSeatByMember(String string) {
		LocalDate date = LocalDate.now();
		List<SeatDTO> now = new ArrayList<>();
		List<SeatDTO> pre = new ArrayList<>();
		List<SeatDTO> list = mapper.getSeatByMember((String) session.getAttribute("id"));
		for(SeatDTO seat: list) {
			ScheduleDTO schedule = s_mapper.getAirplane(seat.getAirplane_no());
			if(date.isAfter(LocalDate.parse(schedule.getAirplane_date()))) pre.add(seat);
			else now.add(seat);
		}
		if(string.equals("now")) return now;
		return pre;
		
	}

	public void regist(SeatDTO seat) {
		mapper.regist(seat);
		
	}

	public List<String> getSeatByAirplane(String no) {
		return mapper.getSeatByAirplane(no);
	}
	public String cancelProc(MemberDTO member, SeatDTO seat) {
		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		if(member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		
		MemberDTO check = m_mapper.login(member.getId());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(check != null && encoder.matches(member.getPw(), check.getPw()) == true) {
			int result = mapper.cancelProc(seat);
			if(result == 1)
				return "예약 취소";
			return "예약 취소를 다시 시도하세요.";
		}
		
		return "아이디 또는 비밀번호를 확인 후 입력하세요";
	}
}