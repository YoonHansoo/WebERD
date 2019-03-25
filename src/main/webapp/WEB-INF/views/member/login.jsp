<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/member/login.css">

<style>
#contents{
background:#4B4B4B;
}

	
.join-title{
	margin-top:50px;
	margin-bottom:50px;
	
}

.join-btn{
	margin-left:5px;
	margin-right:5px;
}
</style>

 <div class="member">
 
 <div class="row">
	<div class="join-title col-sm-4 col-sm-offset-1">
		<h1>Login</h1>
	</div>
</div>
	
<div class="row">

		<form id="erdFrm" class="col-sm-4 col-sm-offset-2" action="${cp }/login" method="post">
			<span>이메일</span>
			<input type="text" id="memId" name="memId"/>
			<span>비밀번호</span>
			<input type="password" id="memPass" name="memPass"/>
			<div class="submit-btn btn-style1">로그인</div> <div class="btn-style3">비밀번호를 잊으셨나요?</div>
		</form>


		<form action="${cp }/logins" id="apiFrm" class="col-sm-3 col-sm-offset-1" >

			<div class="g-signin2" data-onsuccess="onSignIn"></div>
			<div class="facebook-btn btn-style1">KaKao 로그인</div>
			<div class="github-btn btn-style1" >Github 로그인</div>
		</form>
		
</div>


<div class="lable-style1 col-sm-10 col-sm-offset-1">
	계정이 필요하세요? <div class="join-btn btn-style3">지금 회원가입을 하세요.</div>
</div>
	
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script >	
	$(document).ready(function () {
		
	
		<c:if  test="${msg != null}">
		alert("${msg}");
	</c:if>
  		
		//로그인버튼 클릭시
		$(".submit-btn").on("click",function(){
			if ($("#memId").val().trim() == "") {
				alert("ID를 입력해주세요");
				$("#memId").focus();
				return false;
			}
			if ($("#memPass").val().trim() == "") {
				alert("비밀번호를 입력해주세요");
				$("#memPass").focus();
				return false;
			}
			
			$("#erdFrm").submit();
		});
		
		$(".g-signin2").on("click",function(){
			
			$("#apiFrm").submit();
		});
		
		
	});
	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile); // Do not send to your backend! Use an ID token instead.
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		 
		}

</script>

