package com.multi.matchingBoard;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.multi.snslogin.KaKaoLoginBO;
import com.multi.snslogin.NaverLoginBO;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("user")
@Log4j
public class LoginController {
	
	private NaverLoginBO naverLoginBO;
	private String NaverapiResult =null;
	
	private KaKaoLoginBO kakaoLoginBO;
	private String KakaoapiResult= null;
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private void setNaverLoginBO(KaKaoLoginBO kakaoLoginBO) {
		this.kakaoLoginBO = kakaoLoginBO;
	}
	
	@RequestMapping(value = "login")
    public String login(Model model,HttpSession session) {
		
		String naverAuthUrl= naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("urlNaver", naverAuthUrl);
		
		String kakaoAuthUrl= kakaoLoginBO.getAuthorizationUrl(session);
		model.addAttribute("urlKakao", kakaoAuthUrl);
		
		googleOAuth2Parameters.set("access_type", "offline");
        googleOAuth2Parameters.set("approval_prompt", "force");
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String googleAuthUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("urlGoogle",googleAuthUrl);
		
        return "user/login";
    }
	
	@RequestMapping(value="/callbackNaver", method= {RequestMethod.GET , RequestMethod.POST})
	public String callBackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception{
		OAuth2AccessToken oauthToken;
		oauthToken=naverLoginBO.getAccessToken(session, code, state);
		NaverapiResult=naverLoginBO.getUserProfile(oauthToken);
		System.out.println(NaverapiResult);
		System.out.println(oauthToken);
		
		// Naver API 결과 파싱
	    JsonElement jsonElement = JsonParser.parseString(NaverapiResult);
	    JsonObject jsonObject = jsonElement.getAsJsonObject();
	    JsonObject response = jsonObject.getAsJsonObject("response");
	    
	    // 필요한 정보 추출
	    String id = response.get("id").getAsString();
	    String accessToken = oauthToken.getAccessToken();
	    String refreshToken = oauthToken.getRefreshToken();
	    
	    // 정보 출력 (또는 DB에 저장)
	    System.out.println("ID: " + id);
	    System.out.println("Access Token: " + accessToken);
	    System.out.println("Refresh Token: " + refreshToken);
		
		
		
		return "user/callbackNaver";
	}
	
	@RequestMapping(value="/callbackKakao", method= {RequestMethod.GET, RequestMethod.POST})
	public String callBackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken=kakaoLoginBO.getAccessToken(session, code, state);
		KakaoapiResult=kakaoLoginBO.getUserProfile(oauthToken);
		System.out.println(KakaoapiResult);
		System.out.println(oauthToken);
		
		JsonElement jsonElement = JsonParser.parseString(KakaoapiResult);
	    JsonObject jsonObject = jsonElement.getAsJsonObject();

	    // 필요한 정보 추출
	    long id = jsonObject.get("id").getAsLong();
	    String accessToken = oauthToken.getAccessToken();
	    String refreshToken = oauthToken.getRefreshToken();

	    // 정보 출력 (또는 DB에 저장)
	    System.out.println("ID: " + id);
	    System.out.println("Access Token: " + accessToken);
	    System.out.println("Refresh Token: " + refreshToken);
		
		return "user/callbackKakao";
	}
	
	@RequestMapping(value = "/callbackGoogle", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws Exception {
		AccessGrant accessGrant = googleConnectionFactory.getOAuthOperations().exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);
		// 액세스 토큰 값
		String accessToken = accessGrant.getAccessToken();
		System.out.println("액세스 토큰: " + accessToken);
		String refreshToken = accessGrant.getRefreshToken();
		System.out.println("리프레시 토큰: " + refreshToken);
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	    String googleAuthUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
	    System.out.println("Google Authorization URL: " + googleAuthUrl);

		try {
	        // Google OAuth2 API userinfo 엔드포인트에 요청
	        URL url = new URL("https://www.googleapis.com/oauth2/v3/userinfo");
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        
	        // 응답 읽기
	        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String inputLine;
	        StringBuffer response = new StringBuffer();
	        while ((inputLine = in.readLine()) != null) {
	            response.append(inputLine);
	        }
	        in.close();
	        
	        // JSON 파싱
	        JsonElement jsonElement = JsonParser.parseString(response.toString());
	        JsonObject jsonObject = jsonElement.getAsJsonObject();
	        
	        // 이메일 정보 출력
	        String email = jsonObject.get("email").getAsString();
	        System.out.println("Email: " + email);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	

		return "user/callbackGoogle";
		 

	}
	
	
}
