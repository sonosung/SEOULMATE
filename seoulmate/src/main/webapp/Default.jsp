<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="seoulmate.membership.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
    <h2>게시판</h2>
    <a href="userlist.do">USER 게시판 목록 바로가기</a>
	<a href="feslist.do">Admin 게시판 목록 바로가기</a>
    <h1>환영합니다!</h1>
    <%
    // 세션에서 사용자 정보를 가져옵니다.
    MemberDTO user = (MemberDTO) session.getAttribute("user");
    
    // 사용자가 로그인된 상태인지 확인합니다.
    if (user != null) {
        out.println("안녕하세요, " + user.getUSERNAME() + "님!");
    } else {
        // 사용자가 로그인되지 않은 경우 로그인 페이지로 리디렉션합니다.
        response.sendRedirect("login.jsp");
    }
    %>
</body>
</html>
