<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    UserInfoDTO rDTO = (UserInfoDTO) request.getAttribute("rDTO");

    String msg = "";

    if (CmmUtil.nvl(rDTO.getUserId()).length() > 0) {
        msg = CmmUtil.nvl(rDTO.getUserName()) + " 회원님의 <strong>" + CmmUtil.nvl(rDTO.getUserId()) + "</strong> 아이디가 확인되었습니다.";
    } else {
        msg = "아이디가 존재하지 않습니다.";
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 결과</title>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="/js/jquery-3.6.0.min.js"></script>
    <style>
        body {
            margin: 0;
            font-family: 'Gowun Dodum', sans-serif;
            background-color: #fffde7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .result-box {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 360px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        .result-box h2 {
            color: #ff9800;
            font-size: 24px;
            margin-bottom: 0;
        }

        .result-message {
            font-size: 16px;
            color: #333;
            text-align: center;
            line-height: 1.6;
        }

        .login-button {
            padding: 12px 24px;
            background-color: #ffcc80;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 14px;
            cursor: pointer;
            color: #333;
            transition: background-color 0.3s;
        }

        .login-button:hover {
            background-color: #ffb74d;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#btnLogin").click(function () {
                location.href = "/user/login";
            });
        });
    </script>
</head>
<body>
<div class="result-box">
    <h2>🔍 아이디 찾기 결과</h2>
    <div class="result-message">
        <%=msg %>
    </div>
    <button id="btnLogin" class="login-button">로그인</button>
</div>
</body>
</html>
