<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    String ssUserName = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
    String ssUserId = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 성공</title>
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

        .success-box {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 400px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        .success-box h2 {
            color: #ff9800;
            font-size: 24px;
            margin-bottom: 0;
        }

        .info-text {
            font-size: 16px;
            color: #333;
            text-align: center;
            line-height: 1.6;
        }

        .main-button {
            padding: 16px 32px;
            background-color: #ffcc80;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            color: #333;
            transition: background-color 0.3s;
        }

        .main-button:hover {
            background-color: #ffb74d;
        }
    </style>

    <script>
        $(document).ready(function () {
            $("#btnSend").click(function () {
                location.href = "/html/index.html";
            });
        });
    </script>
</head>
<body>
<div class="success-box">
    <h2>🎉 로그인 성공</h2>
    <div class="info-text">
        <%=ssUserName%> 님이 로그인하였습니다.<br/>
        아이디는 <strong><%=ssUserId%></strong> 입니다.
    </div>
    <button id="btnSend" class="main-button">메인 화면 이동</button>
</div>
</body>
</html>
