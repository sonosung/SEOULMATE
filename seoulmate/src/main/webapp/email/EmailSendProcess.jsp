<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="smtp.NaverSMTP"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 폼값(이메일 내용) 저장
Map<String, String> emailInfo = new HashMap<String, String>();
emailInfo.put("user", request.getParameter("user"));  // 보내는 사람
emailInfo.put("auth", request.getParameter("auth"));      // 받는 사람
emailInfo.put("title", request.getParameter("title"));  // 제목

String content = request.getParameter("content");  // 내용

emailInfo.put("content", content);
emailInfo.put("format", "text/plain;charset=UTF-8");

try {
	NaverSMTP smtpServer = new NaverSMTP();  // 메일 전송 클래스 생성
    smtpServer.emailReceiving(emailInfo);      // 전송
    out.print("이메일 전송 성공");
}
catch (Exception e) {
    out.print("이메일 전송 실패");
    e.printStackTrace();
}
%>