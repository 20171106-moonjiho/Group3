package com.ming.boot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("index")
	public void index() {}
	
	@RequestMapping("header")
	public String header() {
		return "default/header";
	}
	@RequestMapping("main")
	public String main() {
		return "default/main";
	}
	@RequestMapping("footer")
	public String footer() {
		return "default/footer";
	}
	
	@RequestMapping("adminHeader")
	public String adminHeader() {
		return "admin/adminHeader";
	}
	@RequestMapping("adminFooter")
	public String adminFooter() {
		return "admin/adminFooter";
	}
}
