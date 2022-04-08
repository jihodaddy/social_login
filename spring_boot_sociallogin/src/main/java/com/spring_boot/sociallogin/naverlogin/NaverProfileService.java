package com.spring_boot.sociallogin.naverlogin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class NaverProfileService {


	public NaverloginVO naverProfile(Model model) {
	     String token = "AAAAOJBBmaCENpwvbszy-mlmXkwECVVJPriqm0cIBUCJQLLcc2h58gl0C3guP390dn3rzUYUWIsGpgZ32cftEFNdlKs"; // 네이버 로그인 접근 토큰;
	     String header = "Bearer " + token; // Bearer 다음에 공백 추가
	
	
	     String apiURL = "https://openapi.naver.com/v1/nid/me";
	
	
	     Map<String, String> requestHeaders = new HashMap<>();
	     requestHeaders.put("Authorization", header);
	     String responseBody = get(apiURL,requestHeaders);
	
	     
	     //System.out.println(responseBody);
	     NaverloginVO vo = new NaverloginVO();
	     
	     vo = jsonToVO(responseBody.toString());
	     System.out.println(vo.getName());
	     
	     
	     return vo;
	 }
	
	
	 private static String get(String apiUrl, Map<String, String> requestHeaders){
	     HttpURLConnection con = connect(apiUrl);
	     try {
	         con.setRequestMethod("GET");
	         for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	             con.setRequestProperty(header.getKey(), header.getValue());
	         }
	
	
	         int responseCode = con.getResponseCode();
	         if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	             return readBody(con.getInputStream());
	         } else { // 에러 발생
	             return readBody(con.getErrorStream());
	         }
	     } catch (IOException e) {
	         throw new RuntimeException("API 요청과 응답 실패", e);
	     } finally {
	         con.disconnect();
	     }
	 }
	
	
	 private static HttpURLConnection connect(String apiUrl){
	     try {
	         URL url = new URL(apiUrl);
	         return (HttpURLConnection)url.openConnection();
	     } catch (MalformedURLException e) {
	         throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	     } catch (IOException e) {
	         throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	     }
	 }
	
	
	 private static String readBody(InputStream body){
	     InputStreamReader streamReader = new InputStreamReader(body);
	
	
	     try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	         StringBuilder responseBody = new StringBuilder();
	
	
	         String line;
	         while ((line = lineReader.readLine()) != null) {
	             responseBody.append(line);
	         }
	
	
	         return responseBody.toString();
	     } catch (IOException e) {
	         throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	     }
	 }
	 
	 public static NaverloginVO jsonToVO(String jsonResultStr) {
		NaverloginVO vo = new NaverloginVO();
		String name;
		String mobile;
		String email;
	
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj;
			jsonObj = (JSONObject) jsonParser.parse(jsonResultStr);
			JSONObject response = (JSONObject) jsonObj.get("response");			
			
			name = (String)response.get("name");
			mobile = (String)response.get("mobile");
			email = (String)response.get("email");
			
			vo.setName(name);
			vo.setEmail(email);
			vo.setMobile(mobile);

		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
	 }
	 
}

