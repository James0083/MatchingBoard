package com.multi.matchingBoard;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.multi.snslogin.KaKaoLoginBO;
import com.multi.snslogin.NaverLoginBO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("user")
@Log4j
public class LoginController {
	
	private NaverLoginBO naverLoginBO;
	private String apiResult =null;
	
	//private KaKaoLoginBO kakaoLoginBO;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "login")
    public String login(Model model,HttpSession session) {
		
		String naverAuthUrl= naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("urlNaver", naverAuthUrl);
		
		//String kakaoAuthUrl= kakaoLoginBO.getAuthorizationUrl(session);
		//model.addAttribute("urlNaver", naverAuthUrl);
		
        return "user/login";
    }
	
	@RequestMapping(value="/callbackNaver", method= {RequestMethod.GET , RequestMethod.POST})
	public String callBackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception{
		OAuth2AccessToken oauthToken;
		oauthToken=naverLoginBO.getAccessToken(session, code, state);
		apiResult=naverLoginBO.getUserProfile(oauthToken);
		System.out.println(apiResult);
		System.out.println(oauthToken);
		
		return "user/callbackNaver";
	}
	/*
	@RequestMapping(value="/callbackKakao", method= {RequestMethod.GET, RequestMethod.POST})
	public String callBackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken=kakaoLoginBO.getAccessToken(session, code, state);
		
		return "redirect:/home";
	}
	*/
	
}
