package com.spring_boot.sociallogin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("/naverlogin")
	public String naverlogin() {
		
		return "/naverlogin";
	}
	
	@RequestMapping("/kakaologin")
	public String kakaologin() {
		
		return "/kakaologin";
	}

	@RequestMapping("/naverSuccess")
	public String naverSuccess() {
		
		return "/naverSuccess";
	}
}
