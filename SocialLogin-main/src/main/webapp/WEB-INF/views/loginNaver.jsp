<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후</title>
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
	<h2>네이버 로그인 완료</h2>
	<div>
		<img src="${loginMember.profile}" width="100" height="100">	
		<span>${loginMember.name}</span>
	</div>
	<div>
		<button class="successBtn" onclick="location.href='/myPage' "><span>마이페이지</span></button>
		<!-- <a href="/myPage">마이 페이지</a> --> 
	</div>
	<div>
		<button class="successBtn" onclick="location.href='/logout' "><span>로그아웃</span></button>
	<!-- <a href="/logout" onclick="naverLogout()">로그아웃</a> -->
	</div>
	
	<script>
	function naverLogout(){
		//window.open("http://nid.naver.com/nidlogin.logout","_blank");
		setTimeout(function() {  
			window.close();
		}, 1000);
	}
	</script>
</body>
</html>