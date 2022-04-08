function init(){
	gapi.load('auth2', function() {
    	gapi.auth2.init({
    		//client_id: '5536746642-l180c0rr0siskrqlo16pq2s8u2o47m92.apps.googleusercontent.com',
		});
		console.log('init success');
	});

}

//로그인
function onSignIn(){
	var auth2 = gapi.auth2.getAuthInstance();
	console.log(auth2);
	auth2.then(
		function(){
			
			console.log(auth2.isSignedIn.get());
			if (auth2.isSignedIn.get()){
				var profile = auth2.currentUser.get().getBasicProfile();
				/* console.log('Name: ' + profile.getName());
				console.log('Email: ' + profile.getEmail());
				console.log('profile: '+ profile.getImageUrl()); */
					
				$('input[id=googleName]').val(profile.getName());
				$('input[id=googleEmail]').val(profile.getEmail());
				$('input[id=googleProfile]').val(profile.getImageUrl());
				$('#loginGoogle').submit();
			}
		}
	);
}

// 로그아웃
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
		console.log('User signed out.');
	});
	location.href='/login';
}

// 탈퇴
function googleOut(){
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.disconnect().then(function(){
		console.log("탈퇴");
	});
	return signOut();
}
