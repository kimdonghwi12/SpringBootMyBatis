<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    String msg = CmmUtil.nvl((String) request.getAttribute("msg"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정 결과</title>
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
            text-align: center;
        }

        .result-message {
            font-size: 16px;
            color: #333;
            text-align: center;
            line-height: 1.6;
            word-break: keep-all;
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
            $("#btnLogin").on("click", function () {
                location.href = "/user/login";
            });
        });
    </script>
</head>
<body>
<div class="result-box">
    <h2>🔐 비밀번호 재설정 결과</h2>
    <div class="result-message">
        <%=msg %>
    </div>
    <button id="btnLogin" class="login-button">로그인</button>
</div>
</body>
</html>
