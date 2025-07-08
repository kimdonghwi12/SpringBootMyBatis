<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    UserInfoDTO rDTO = (UserInfoDTO) request.getAttribute("rDTO");
    String newPassword = CmmUtil.nvl((String) session.getAttribute("NEW_PASSWORD"));

    String msg = "";
    if (CmmUtil.nvl(rDTO.getUserId()).length() > 0) {
        if (newPassword.length() == 0) {
            msg = "비정상적인 접근입니다.\\n비밀번호 재설정 화면에 접근할 수 없습니다.";
        }
    } else {
        msg = "회원정보가 존재하지 않습니다.";
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title><%=CmmUtil.nvl(rDTO.getUserName())%> 회원님의 비밀번호 재설정</title>
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

        .form-box {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 360px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-box h2 {
            color: #ff9800;
            font-size: 22px;
            text-align: center;
            margin-bottom: 0;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-group label {
            font-size: 14px;
            color: #444;
        }

        .form-group input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .button-area {
            display: flex;
            gap: 10px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .button-area button {
            padding: 10px 20px;
            background-color: #ffcc80;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 14px;
            cursor: pointer;
            color: #333;
            transition: background-color 0.3s;
        }

        .button-area button:hover {
            background-color: #ffb74d;
        }
    </style>

    <script>
        <% if (msg.length() > 0) { %>
        alert("<%=msg%>");
        history.back();
        <% } %>

        $(document).ready(function () {
            $("#btnLogin").click(function () {
                location.href = "/user/login";
            });

            $("#btnSearchPassword").click(function () {
                const f = document.getElementById("f");

                if (f.password.value === "") {
                    alert("새로운 비밀번호를 입력하세요.");
                    f.password.focus(); return;
                }

                if (f.password2.value === "") {
                    alert("검증을 위한 새로운 비밀번호를 입력하세요.");
                    f.password2.focus(); return;
                }

                if (f.password.value !== f.password2.value) {
                    alert("입력한 비밀번호가 일치하지 않습니다.");
                    f.password.focus(); return;
                }

                f.method = "post";
                f.action = "/user/newPasswordProc";
                f.submit();
            });
        });
    </script>
</head>
<body>
<form id="f" class="form-box">
    <h2>🔐 <%=CmmUtil.nvl(rDTO.getUserName())%> 회원님의 비밀번호 재설정</h2>

    <div class="form-group">
        <label for="password">새로운 비밀번호</label>
        <input type="password" name="password" id="password" placeholder="새로운 비밀번호 입력" />
    </div>

    <div class="form-group">
        <label for="password2">검증용 비밀번호</label>
        <input type="password" name="password2" id="password2" placeholder="비밀번호 재입력" />
    </div>

    <div class="button-area">
        <button id="btnSearchPassword" type="button">비밀번호 재설정</button>
        <button id="btnLogin" type="button">로그인</button>
    </div>
</form>
</body>
</html>
