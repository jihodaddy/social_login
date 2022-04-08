//카카오

Kakao.init('470599fc86d89a3f20bf25996824355c'); //발급받은 키 중 javascript키를 사용해준다.
//console.log(Kakao.isInitialized()); // sdk초기화여부판단

//로그인
function kakaoLogin() {
	Kakao.Auth.login({
		success: function(response) {
			//console.log(JSON.stringify(response));
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(response) {
					//console.log("성공resopnse");
					//console.log(response)
					/*const email = response.kakao_account.email;*/
					const name = response.properties.nickname;
					const profile = response.kakao_account.profile.thumbnail_image_url;
					const email = (response.kakao_account.email != undefined ? response.kakao_account.email : '');
					console.log(name);
					console.log(profile); 
					console.log(email);

					$('input[id=kakaoName]').val(name);
					$('input[id=kakaoEmail]').val(email);
					$('input[id=kakaoProfile]').val(profile);
					$('#loginKakao').submit();
	
				},
				fail: function(error) {
					console.log(error)
				},
			})
		},
		fail: function(error) {
			console.log(error)
		},
	})
}

//로그아웃
function kakaoLogout(){	
	Kakao.Auth.logout(function(){
		console.log('로그아웃');
	});
	location.href="/login";
}

//탈퇴
function kakaoOut() {
	if (Kakao.Auth.getAccessToken()) {
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function(response) {
				console.log(response)
				return kakaoLogout();
			},
			fail: function(error) {
				console.log(error)
			},
		})
		Kakao.Auth.setAccessToken(undefined)
	}
}  