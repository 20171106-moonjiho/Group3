package com.ming.boot.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ming.boot.PageService;
import com.ming.boot.seat.SeatDTO;

import jakarta.servlet.http.HttpSession;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class MemberService {
	@Autowired private IMemberMapper mapper;
	@Autowired private HttpSession session;
	
	public String registProc(MemberDTO member) {
		if(member.getId() == null || member.getId().trim().isEmpty()) {
			return "아이디를 입력하세요.";
		}
		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		if(member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		if(member.getUserName() == null || member.getUserName().trim().isEmpty()) {
			return "이름을 입력하세요.";
		}
		if(member.getSsn1() == null || member.getSsn1().trim().isEmpty()) {
			return "주민번호를 입력하세요.";
		}
		if(member.getSsn2() == null || member.getSsn2().trim().isEmpty()) {
			return "주민번호를 입력하세요.";
		}
		
		MemberDTO check = mapper.login(member.getId());
		if(check != null) {
			return "이미 사용중인 아이디 입니다.";
		}
		
		/* 암호화 과정 */
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String secretPass = encoder.encode(member.getPw());
		member.setPw(secretPass);
		
		int result = mapper.registProc(member);
		if(result == 1)
			return "회원 등록 완료";
		
		return "회원 등록을 다시 시도하세요.";
	}
	
	
	public String loginProc(String id, String pw) {
		if(id == null || id.trim().isEmpty()) {
			return "아이디를 입력하세요.";
		}
		if(pw == null || pw.trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		
		MemberDTO check = mapper.login(id);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(check != null && encoder.matches(pw, check.getPw()) == true) {
			session.setAttribute("id", check.getId());
			session.setAttribute("userName", check.getUserName());
			session.setAttribute("ssn1", check.getSsn1());
			session.setAttribute("ssn2", check.getSsn2());
			session.setAttribute("address", check.getAddress());
			session.setAttribute("mobile", check.getMobile());
			return "로그인 성공";
		}
		
		return "아이디 또는 비밀번호를 확인 후 다시 입력하세요.";
	}
	public void memberInfo(String select, String search, String cp, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		if(select == null)
			select = "";
		
		int pageBlock = 5; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		ArrayList<MemberDTO> members = mapper.memberInfo(begin, end, select, search);
		int totalCount = mapper.totalCount(select, search);
		if(totalCount == 0) {
			return ;
		}
		
		String url = "memberInfo?select="+select+"&search="+search+"&currentPage=";
		String result = PageService.printPage(url, totalCount, pageBlock, currentPage);
		
		model.addAttribute("select", select);
		model.addAttribute("search", search);
		model.addAttribute("result", result);
		model.addAttribute("members", members);
	}
	
	public String userInfo(Model model) {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "로그인 후 이용하세요.";
		
		MemberDTO member = mapper.login(sessionId);
		if(member.getAddress() != null && member.getAddress().isEmpty() == false) {
			String[] address = member.getAddress().split(",");
			model.addAttribute("postcode", address[0]);
			member.setAddress(address[1]);
			model.addAttribute("detailAddress", address[2]);
		}
		model.addAttribute("member", member);
		return "회원 검색 완료";
	}

	public String updateProc(MemberDTO member) {
		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		if(member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		if(member.getUserName() == null || member.getUserName().trim().isEmpty()) {
			return "이름을 입력하세요.";
		}
		/* 암호화 과정 */
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String secretPass = encoder.encode(member.getPw());
		member.setPw(secretPass);
		
		int result = mapper.updateProc(member);
		if(result == 1)
			return "회원 수정 완료";
		
		return "회원 수정을 다시 시도하세요.";
	}


	public String deleteProc(MemberDTO member) {
		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		if(member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		
		MemberDTO check = mapper.login(member.getId());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(check != null && encoder.matches(member.getPw(), check.getPw()) == true) {
			int result = mapper.deleteProc(member.getId());
			if(result == 1)
				return "회원 삭제 완료";
			return "회원 삭제를 다시 시도하세요.";
		}
		
		return "아이디 또는 비밀번호를 확인 후 입력하세요";
	}

	public void certifiedPhoneNumber(String mobile, String numStr) {
		String api_key = "NCSCXC0GJP0XTPP4";
	    String api_secret = "NDOHIFV44DZAKVJ6WWOPNSH5BCWNODAW";
        Message coolsms = new Message(api_key, api_secret);
 
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", mobile);    
        params.put("from", "01039370876");   
        params.put("type", "SMS");
        params.put("text", "["+numStr+"]");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
	}

}