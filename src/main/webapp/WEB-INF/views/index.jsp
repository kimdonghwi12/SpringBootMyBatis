<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>홈페이지 메인</title>
	<style>
		body {
			text-align: center;
			font-family: Arial, sans-serif;
			margin-top: 50px;
		}
		h1 {
			color: #333;
		}
		button {
			margin: 10px;
			padding: 10px 20px;
			font-size: 16px;
		}
	</style>
</head>
<body>
<h1>🌟 환영합니다 🌟</h1>
<p>SpringBoot MyBatis 회원관리 시스템</p>

<div>
	<button onclick="location.href='/user/login'">로그인</button>
	<button onclick="location.href='/user/userRegForm'">회원가입</button>
	<button onclick="location.href='/user/searchUserId'">아이디 찾기</button>
	<button onclick="location.href='/user/searchPassword'">비밀번호 찾기</button>
</div>
</body>
</html>