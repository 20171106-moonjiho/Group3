package com.ming.boot.seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ming.boot.member.IMemberMapper;
import com.ming.boot.member.MemberDTO;

import jakarta.servlet.http.HttpSession;

@Service
public class SeatService {
	@Autowired private IMemberMapper m_mapper; 
	@Autowired private SeatMapper mapper;
	@Autowired private HttpSession session;

	public List<SeatDTO> getSeatByMember() {
		return mapper.getSeatByMember((String) session.getAttribute("id"));
		
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