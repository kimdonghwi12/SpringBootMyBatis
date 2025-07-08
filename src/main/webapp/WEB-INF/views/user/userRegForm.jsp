<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        body {
            margin: 0;
            font-family: 'Gowun Dodum', sans-serif;
            background-color: #fffde7;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 420px;
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .form-container h2 {
            color: #ff9800;
            margin-bottom: 10px;
            font-size: 24px;
            text-align: center;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-group label {
            font-size: 14px;
            color: #555;
        }

        .form-group input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .form-group button {
            margin-top: 6px;
            align-self: flex-start;
            padding: 8px 12px;
            font-size: 13px;
            border: none;
            background-color: #e0f7fa;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-group button:hover {
            background-color: #b2ebf2;
        }

        .submit-button {
            background-color: #ffcc80;
            color: #333;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            padding: 12px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #ffb74d;
        }
    </style>

    <script>
        let userIdCheck = "Y";
        let emailAuthNumber = "";

        $(document).ready(function () {
            let f = document.getElementById("f");

            $("#btnUserId").click(() => userIdExists(f));
            $("#btnEmail").click(() => emailExists(f));
            $("#btnAddr").click(() => kakaoPost(f));
            $("#btnSend").click(() => doSubmit(f));
        });

        function userIdExists(f) {
            if (f.userId.value === "") {
                alert("아이디를 입력하세요.");
                f.userId.focus(); return;
            }
            $.post("/user/getUserIdExists", $("#f").serialize(), function (json) {
                if (json.existsYn === "Y") {
                    alert("이미 가입된 아이디가 존재합니다.");
                    f.userId.focus();
                } else {
                    alert("가입 가능한 아이디입니다.");
                    userIdCheck = "N";
                }
            }, "json");
        }

        function emailExists(f) {
            if (f.email.value === "") {
                alert("이메일을 입력하세요.");
                f.email.focus(); return;
            }
            $.post("/user/getEmailExists", $("#f").serialize(), function (json) {
                if (json.existsYn === "Y") {
                    alert("이미 가입된 이메일 주소가 존재합니다.");
                    f.email.focus();
                } else {
                    alert("이메일로 인증번호가 발송되었습니다.\n받은 인증번호를 입력해주세요.");
                    emailAuthNumber = json.authNumber;
                }
            }, "json");
        }

        function kakaoPost(f) {
            new daum.Postcode({
                oncomplete: function (data) {
                    f.addr1.value = "(" + data.zonecode + ") " + data.address;
                }
            }).open();
        }

        function doSubmit(f) {
            if (f.userId.value === "") return alert("아이디를 입력하세요."), f.userId.focus();
            if (userIdCheck !== "N") return alert("아이디 중복 체크가 필요합니다."), f.userId.focus();
            if (f.userName.value === "") return alert("이름을 입력하세요."), f.userName.focus();
            if (f.password.value === "") return alert("비밀번호를 입력하세요."), f.password.focus();
            if (f.password2.value === "") return alert("비밀번호 확인을 입력하세요."), f.password2.focus();
            if (f.password.value !== f.password2.value) return alert("비밀번호가 일치하지 않습니다."), f.password.focus();
            if (f.email.value === "") return alert("이메일을 입력하세요."), f.email.focus();
            if (f.authNumber.value === "") return alert("인증번호를 입력하세요."), f.authNumber.focus();
            if (f.authNumber.value !== emailAuthNumber) return alert("인증번호가 일치하지 않습니다."), f.authNumber.focus();
            if (f.addr1.value === "") return alert("주소를 입력하세요."), f.addr1.focus();
            if (f.addr2.value === "") return alert("상세주소를 입력하세요."), f.addr2.focus();

            $.post("/user/insertUserInfo", $("#f").serialize(), function (json) {
                alert(json.msg);
                if (json.result === 1) location.href = "/user/login";
            }, "json");
        }
    </script>
</head>
<body>
<form id="f" class="form-container">
    <h2>🎉 회원가입</h2>

    <div class="form-group">
        <label>* 아이디</label>
        <input type="text" name="userId" placeholder="아이디" />
        <button id="btnUserId" type="button">아이디 중복체크</button>
    </div>

    <div class="form-group">
        <label>* 이름</label>
        <input type="text" name="userName" placeholder="이름" />
    </div>

    <div class="form-group">
        <label>* 비밀번호</label>
        <input type="password" name="password" placeholder="비밀번호" />
    </div>

    <div class="form-group">
        <label>* 비밀번호 확인</label>
        <input type="password" name="password2" placeholder="비밀번호 확인" />
    </div>

    <div class="form-group">
        <label>* 이메일</label>
        <input type="email" name="email" placeholder="이메일 주소" />
        <button id="btnEmail" type="button">인증 요청</button>
    </div>

    <div class="form-group">
        <label>* 인증번호</label>
        <input type="text" name="authNumber" placeholder="메일로 받은 인증번호 입력" />
    </div>

    <div class="form-group">
        <label>* 주소</label>
        <input type="text" name="addr1" placeholder="주소" />
        <button id="btnAddr" type="button">우편번호</button>
    </div>

    <div class="form-group">
        <label>* 상세주소</label>
        <input type="text" name="addr2" placeholder="상세 주소" />
    </div>

    <button id="btnSend" type="button" class="submit-button">회원가입</button>
</form>
</body>
</html>
