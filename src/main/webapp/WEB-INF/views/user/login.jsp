<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인하기</title>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="/js/jquery-3.6.0.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Gowun Dodum', sans-serif;
            background-color: #fffde7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-box {
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

        .login-box h2 {
            color: #ff9800;
            margin-bottom: 10px;
            font-size: 26px;
        }

        .input-field {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .input-field label {
            font-size: 14px;
            color: #444;
        }

        .input-field input {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .button-area {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .button-area button {
            padding: 12px;
            background-color: #ffcc80;
            color: #333;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .button-area button:hover {
            background-color: #ffb74d;
        }

        .link-buttons {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .link-buttons button {
            background: none;
            border: none;
            color: #555;
            font-size: 13px;
            cursor: pointer;
            text-decoration: underline;
            padding: 4px 0;
        }

        .link-buttons button:hover {
            color: #000;
        }
    </style>

    <script>
        $(document).ready(function () {
            $("#btnUserReg").click(() => location.href = "/user/userRegForm");
            $("#btnSearchUserId").click(() => location.href = "/user/searchUserId");
            $("#btnSearchPassword").click(() => location.href = "/user/searchPassword");

            $("#btnLogin").click(function () {
                const f = document.getElementById("f");

                if (f.userId.value === "") {
                    alert("아이디를 입력하세요.");
                    f.userId.focus();
                    return;
                }

                if (f.password.value === "") {
                    alert("비밀번호를 입력하세요.");
                    f.password.focus();
                    return;
                }

                $.ajax({
                    url: "/user/loginProc",
                    type: "post",
                    dataType: "JSON",
                    data: $("#f").serialize(),
                    success: function (json) {
                        if (json.result === 1) {
                            alert(json.msg);
                            location.href = "/user/loginResult";
                        } else {
                            alert(json.msg);
                            $("#userId").focus();
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="login-box">
    <h2>👪 로그인하기</h2>
    <form id="f">
        <div class="input-field">
            <label for="userId">아이디</label>
            <input type="text" name="userId" id="userId" />
        </div>
        <div class="input-field">
            <label for="password">비밀번호</label>
            <input type="password" name="password" id="password" />
        </div>
        <div class="button-area">
            <button id="btnLogin" type="button">로그인</button>
        </div>
        <div class="link-buttons">
            <button id="btnUserReg" type="button">🆕 회원가입</button>
            <button id="btnSearchUserId" type="button">🔍 아이디 찾기</button>
            <button id="btnSearchPassword" type="button">🔑 비밀번호 찾기</button>
        </div>
    </form>
</div>
</body>
</html>
