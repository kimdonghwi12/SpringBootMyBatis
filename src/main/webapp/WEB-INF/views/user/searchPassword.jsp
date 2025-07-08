<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
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
            font-size: 24px;
            text-align: center;
            margin-bottom: 8px;
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
        $(document).ready(function () {
            $("#btnLogin").on("click", function () {
                location.href = "/user/login";
            });

            $("#btnSearchPassword").on("click", function () {
                let f = document.getElementById("f");

                if (f.userId.value === "") {
                    alert("아이디를 입력하세요.");
                    f.userId.focus();
                    return;
                }
                if (f.userName.value === "") {
                    alert("이름을 입력하세요.");
                    f.userName.focus();
                    return;
                }
                if (f.email.value === "") {
                    alert("이메일을 입력하세요.");
                    f.email.focus();
                    return;
                }

                f.method = "post";
                f.action = "/user/searchPasswordProc";
                f.submit();
            });
        });
    </script>
</head>
<body>
<form id="f" class="form-box">
    <h2>🔐 비밀번호 찾기</h2>

    <div class="form-group">
        <label for="userId">아이디</label>
        <input type="text" name="userId" id="userId" placeholder="아이디 입력" />
    </div>

    <div class="form-group">
        <label for="userName">이름</label>
        <input type="text" name="userName" id="userName" placeholder="이름 입력" />
    </div>

    <div class="form-group">
        <label for="email">이메일</label>
        <input type="email" name="email" id="email" placeholder="이메일 입력" />
    </div>

    <div class="button-area">
        <button id="btnSearchPassword" type="button">비밀번호 찾기</button>
        <button id="btnLogin" type="button">로그인</button>
    </div>
</form>
</body>
</html>
