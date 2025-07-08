<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>어린이 안심귀가길</title>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<style>
		body {
			margin: 0;
			font-family: 'Gowun Dodum', sans-serif;
			background-color: #fafafa;
		}

		.container {
			display: flex;
			height: 100vh;
		}

		.left {
			flex: 1.2; /* 이미지 영역을 조금 더 넓게 */
			background-color: #f0f0f0;
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 0;
		}

		.left img {
			height: 100%;
			width: auto;
			object-fit: contain;
		}

		.right {
			flex: 1;
			padding: 40px;
			position: relative;
			display: flex;
			flex-direction: column;
			align-items: flex-end;
			justify-content: center;
		}

		.button-box {
			position: absolute;
			top: 30px;
			right: 30px;
			display: flex;
			flex-direction: column;
			gap: 10px;
		}

		.button-box form button {
			padding: 10px 15px;
			border: none;
			border-radius: 8px;
			background-color: #ffcc80;
			color: #333;
			font-size: 14px;
			cursor: pointer;
			transition: background-color 0.3s;
		}

		.button-box form button:hover {
			background-color: #ffb74d;
		}

		.title {
			font-size: 32px;
			font-weight: bold;
			margin-bottom: 10px;
			text-align: center;
		}

		.subtitle {
			font-size: 18px;
			color: #666;
			text-align: center;
		}
	</style>
</head>
<body>
<div class="container">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/jv12331697.jpg" alt="안심귀가 캐릭터">
	</div>
	<div class="right">
		<div class="button-box">
			<form action="/user/login">
				<button type="submit">로그인</button>
			</form>
			<form action="/user/userRegForm">
				<button type="submit">회원가입</button>
			</form>
			<form action="/user/searchUserId">
				<button type="submit">아이디 찾기</button>
			</form>
			<form action="/user/searchPassword">
				<button type="submit">비밀번호 찾기</button>
			</form>
		</div>
		<div class="title"> 어린이 안심귀가시스템 </div>
		<div class="subtitle">사고지역 우회 및 안심귀가안내</div>
	</div>
</div>
</body>
</html>
