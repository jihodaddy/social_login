<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<meta name="google-signin-scope" content="profile email">
			<meta name="google-signin-client_id" content="533964162845-j21mqvso997dfk3hs4e558dfo3q23m0m.apps.googleusercontent.com">
			<script type="text/javascript" src="/js/googleLoginout.js"></script>
			<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
			<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script type="text/javascript" src="/js/kakaoLoginout.js"></script>
			<title>로그인</title>
			    <link rel="stylesheet" href="/css/login.css" type="text/css">
		</head>
		<body>

		    <div class="loginBox">
		                    <div>
		                        <div class="box">
		                           	<div><h1>로그인</h1></div>
		                           	<form id="loginForm" name="loginForm">
		                               	<div id="idBox"><input type="text" name="id" id="id" placeholder="아이디"></div>
		                               	<div id="pwBox"><input type="password" name="pwd" id="pwd" placeholder="비밀번호"></div>
		                               		<button type="submit" id="loginButton">로그인</button>
		                           	</form>
		                       	</div> 
		                        <div class="box">
		                           	<div class="socialLoginBox">
		                           		<h1>소셜 로그인</h1>
		                                <ul class="socialLoginList">
		                                    <li><button class="kakaoLoginButton" onclick="location.href='javascript:kakaoLogin()'"><span>KakaoTalk ID 로그인</span></button></li>
		                                    <li><button class="googleLoginButton"><span>Google ID 로그인</span></button></li>  
									<!-- 네이버 로그인 -->
									<%
									String clientId = "DScCq08roHfAQvUwI7ZD";//애플리케이션 클라이언트 아이디값";
									String redirectURI = URLEncoder.encode("http://localhost:8080/naverLoginAPI", "UTF-8");
									SecureRandom random = new SecureRandom();
									String state = new BigInteger(130, random).toString();
									String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
									apiURL += "&client_id=" + clientId;
									apiURL += "&redirect_uri=" + redirectURI;
									apiURL += "&state=" + state;
									session.setAttribute("state", state);
									%>
		                                    <li><button class="naverLoginButton" onclick="location.href='<%=apiURL%>' "><span>Naver ID 로그인</span></button></li>  
		                                </ul>
		                               	<p class="forgetMsg"><a href="#">아이디/비밀번호 찾기</a>  |   <a href="join.html">회원가입</a></p>
		                           	</div>
		                        </div><!-- box  -->
		                    </div>
		                </div> <!-- loginBox  -->
		
			<a href="<%=apiURL%>">
				<img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG" />
			</a>
			<!-- 네이버로그인 끝 -->
		
			<!-- 구글 로그인  -->
		<!-- 	<div class="g-signin2" onclick="onSignIn()"></div>
				<form id="loginGoogle" action="googleLogin" method="post">
					<input type="text" id="googleName" name="name" style="display: none">
					<input type="text" id="googleEmail" name="email" style="display: none">
					<input type="text" id="googleProfile" name="profile" style="display: none">
				</form> -->
			<!-- 구글 로그인 끝 -->
		
			<!-- 카카오 로그인 -->
			<a href="javascript:kakaoLogin()">
				<img src="./img/kakao_login_medium_narrow.png" />
			</a>
			<form id="loginKakao" action="kakaoLogin" method="post">
				<input type="text" id="kakaoName" name="name" style="display: none">
				<input type="text" id="kakaoEmail" name="email" style="display: none">
				<input type="text" id="kakaoProfile" name="profile" style="display: none">
			</form>
			<!-- 카카오 로그인 끝 -->
	</body>
</html>