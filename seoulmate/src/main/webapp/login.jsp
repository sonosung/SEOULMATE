<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
    <form action="login" method="post">
        <label for="user_id">아이디:</label>
        <input type="text" id="user_id" name="user_id" required><br>
        <label for="user_password">비밀번호:</label>
        <input type="password" id="user_password" name="user_password" required><br>
        <button type="submit">로그인</button>
    </form>
</body>
</html>