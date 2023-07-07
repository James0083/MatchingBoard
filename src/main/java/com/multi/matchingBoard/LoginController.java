package com.multi.matchingBoard;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.multi.model.SnsLoginVO;
import com.multi.model.UserVO;
import com.multi.service.SocialService;
import com.multi.service.UserService;
import com.multi.snslogin.KaKaoLoginBO;
import com.multi.snslogin.NaverLoginBO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class LoginController {
	
	@Autowired
	private SocialService socialservice;
	@Autowired
	private UserService userservice;
	
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
	    oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    String NaverapiResult = naverLoginBO.getUserProfile(oauthToken);
	    System.out.println(NaverapiResult);
	    
	    // Naver API JSON 정보 파싱
	    JsonElement jsonElement = JsonParser.parseString(NaverapiResult);
	    JsonObject jsonObject = jsonElement.getAsJsonObject();
	    JsonObject response = jsonObject.getAsJsonObject("response");
	    
	    String identifier = response.get("id").getAsString();
	    String accessToken = oauthToken.getAccessToken();
	    String refreshToken = oauthToken.getRefreshToken();
	    
	    String type = "Naver";
	    
	    SnsLoginVO snsLogin = socialservice.findSnsLoginByidentifier(identifier);
	    System.out.println("snsLogin: " + snsLogin);
	    
	    // DB 연동
	    if(snsLogin == null){
	        // 신규 사용자
	        String userid = UUID.randomUUID().toString(); // UUID 생성은 신규 사용자일 때만 수행
	        userservice.insertUser(userid);
	        socialservice.saveSnsLogin(userid, type, identifier, refreshToken);
	        UserVO loginUser = userservice.getUserById(userid); // 여기서 loginUser 가져오기
	        System.out.println("New user created with userid: " + userid);
	        session.setAttribute("loginUser", loginUser);
	        System.out.println("New loginUser set in session: " + loginUser);
	        return "user/callbackNaver";
	    } else {
	        // 기존 사용자
	        String userid = snsLogin.getUserid(); // 기존 사용자의 userid 가져오기
	        UserVO loginUser = userservice.getUserById(userid); // 여기서 기존 사용자 정보 가져오기
	        session.setAttribute("loginUser", loginUser);
	        System.out.println("Existing loginUser set in session: " + session.getAttribute("loginUser"));
	        return "redirect:/"; // 메인 페이지로 리다이렉션
	    }
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

	   
	    String identifier = jsonObject.get("id").getAsString();
	    String accessToken = oauthToken.getAccessToken();
	    String refreshToken = oauthToken.getRefreshToken();
	    
	    String type = "Kakao";
	    SnsLoginVO snsLogin = socialservice.findSnsLoginByidentifier(identifier);
	    // DB 연동
	    if(snsLogin == null){
	    	String userid = UUID.randomUUID().toString(); // UUID 생성은 신규 사용자일 때만 수행
	        userservice.insertUser(userid);
	        socialservice.saveSnsLogin(userid, type, identifier, refreshToken);
	        UserVO loginUser = userservice.getUserById(userid); // 여기서 loginUser 가져오기
	        System.out.println("New user created with userid: " + userid);
	        session.setAttribute("loginUser", loginUser);
	        System.out.println("New loginUser set in session: " + loginUser);
			return "user/callbackKakao";
	    } else {
	        // 기존 사용자
	    	String userid = snsLogin.getUserid(); // 기존 사용자의 userid 가져오기
	        UserVO loginUser = userservice.getUserById(userid); // 여기서 기존 사용자 정보 가져오기
	        session.setAttribute("loginUser", loginUser);
	        System.out.println("Existing loginUser set in session: " + session.getAttribute("loginUser"));
	        return "redirect:/"; // 메인 페이지로 리다이렉션
	    }
	}
	
	@RequestMapping(value = "/callbackGoogle", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws Exception {
		AccessGrant accessGrant = googleConnectionFactory.getOAuthOperations().exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);
		
		String accessToken = accessGrant.getAccessToken();
		System.out.println("액세스 토큰" + accessToken);
		String refreshToken = accessGrant.getRefreshToken();
		System.out.println("리프레시 토큰" + refreshToken);
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	    String oogleAuthUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
	    System.out.println("Google Authorization URL: " + oogleAuthUrl);

		try {
	        // Google OAuth2 API
	        URL url = new URL("https://www.googleapis.com/oauth2/v3/userinfo");
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        
	        // ���� �б�
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
	        
	        //UUID 생성
		    String userid= UUID.randomUUID().toString();
		  
		    String id = jsonObject.get("email").getAsString();
		    String type="Google";
	        
	        // DB연동
		    userservice.insertUser(userid);
		    socialservice.saveSnsLogin(userid, type, id, refreshToken);
	        
	        
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return "user/callbackGoogle";
	}
	
	@RequestMapping(value = "/mypage")
	public String connectSns(Model model, HttpSession session) throws Exception {
		System.out.println("mypage에서 불러오기 성공");
		Object userObj = session.getAttribute("loginUser");
	    if (userObj == null) {
	        // 사용자가 로그인하지 않은 경우 로그인 페이지로 리다이렉션
	        return "redirect:/user/login";
	    }
	    System.out.println("userObj :"+userObj);
	    
	    String authUrl = "";
	    String identifier = "";
	    String refreshToken = "";
	    String type="";
	    OAuth2AccessToken oauthToken;
	    JsonElement jsonElement;
	    JsonObject jsonObject;
	    switch (type) {
	        case "naver":
	            authUrl = naverLoginBO.getAuthorizationUrl(session);
	            model.addAttribute("connecturlNaver", authUrl);
	            System.out.println("connecturlNaver: "+authUrl);
	            // Naver 연동 처리 (이후에 identifier와 refreshToken 설정)
	    	    //oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    	    //String NaverapiResult = naverLoginBO.getUserProfile(oauthToken);
	    	    System.out.println(NaverapiResult);
	    	    // Naver API JSON 정보 파싱
	    	    jsonElement = JsonParser.parseString(NaverapiResult);
	    	    jsonObject = jsonElement.getAsJsonObject();
	    	    JsonObject response = jsonObject.getAsJsonObject("response");
	    	    
	    	    identifier = response.get("id").getAsString();
	    	    //refreshToken = oauthToken.getRefreshToken();
	    	    type = "Naver";
	    	    System.out.println("버튼 입력성공: "+NaverapiResult);
	            break;
	        case "kakao":
	            authUrl = kakaoLoginBO.getAuthorizationUrl(session);
	            model.addAttribute("connecturlKakao", authUrl);
	            System.out.println("connecturlKakao: "+authUrl);
	            // Kakao 연동 처리 (이후에 identifier와 refreshToken 설정)
	    		//oauthToken=kakaoLoginBO.getAccessToken(session, code, state);
	    		//KakaoapiResult=kakaoLoginBO.getUserProfile(oauthToken);
	    		System.out.println(KakaoapiResult);
	    		//System.out.println(oauthToken);
	    		
	    		jsonElement = JsonParser.parseString(KakaoapiResult);
	    	    jsonObject = jsonElement.getAsJsonObject();
	    	    identifier = jsonObject.get("id").getAsString();
	    	    //refreshToken = oauthToken.getRefreshToken();
	    	    
	    	    type = "Kakao";
	    	    System.out.println("버튼 입력성공: "+KakaoapiResult);
	            break;
	        case "google":
	        	googleOAuth2Parameters.set("access_type", "offline");
	            googleOAuth2Parameters.set("approval_prompt", "force");
	    		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	    		authUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
	    		model.addAttribute("urlConnectSns", authUrl);
	            // Google 연동 처리 (이후에 identifier와 refreshToken 설정)
	            break;
	    }
	    
	    
	    SnsLoginVO snsLogin = socialservice.findSnsLoginByidentifier(identifier);

	    
	    if (snsLogin == null) {
	        // 신규 연동인 경우 DB에 연동 정보를 저장
	        String userid = ((UserVO) userObj).getUserid(); // 현재 로그인된 사용자의 ID
	        socialservice.saveSnsLogin(userid, type, identifier, refreshToken);
	        System.out.println("연동 성공: "+userid);
	        return "user/modify"; // 연동 성공 페이지로 리다이렉션
	    } else {
	        // 이미 연동되어 있는 경우, 로그인 상태 설정 후 메인 페이지로 리다이렉션
	        String userid = snsLogin.getUserid(); // 기존 연동 사용자의 userid 가져오기
	        UserVO loginUser = userservice.getUserById(userid); // 여기서 기존 사용자 정보 가져오기
	        session.setAttribute("loginUser", loginUser);
	        return "redirect:/"; // 메인 페이지로 리다이렉션
	    }
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();        
	    return "redirect:/";
	}
}
