<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/js/kakaoLoginout.js"></script>
	<title>Insert title here</title>
		<style>
		.successBtn{
			 width: 465px;
		     height: 48px;
		     margin-bottom: 10px;
		     border: solid 1px black;
		     background: white;
		     cursor: pointer;
		     }
	</style>
	</head>
		<body>
			<h2>카카오 로그인 완료</h2>
			<div>
				<img src="${loginMember.profile}" width="100" height="100">	
				<span>${loginMember.name}</span>
			</div>
			<div>
				<button class="successBtn" onclick="location.href='/myPage' "><span>마이페이지</span></button>
				 <!-- <a href="/myPage">MyPage</a>   -->
			</div>
			<div>
				<button class="successBtn" onclick="kakaoLogout()"><span>로그아웃</span></button>
				<!-- <a href="#" onclick="kakaoLogout()">로그아웃</a> -->
			</div>
			<div>
				<button class="successBtn" onclick="kakaoOut()"><span>탈퇴</span></button>
				<!-- <a href="#" onclick="kakaoOut()">탈퇴</a> --> 
			</div>
		</body>
</html>