<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<%
    String userEmail = request.getParameter("from"); // 사용자 이메일 주소
    String subject = request.getParameter("subject"); // 이메일 제목
    String content = request.getParameter("content"); // 이메일 내용
    String to = "seoulmate01@naver.com"; // 관리자 이메일 주소 (여기에 실제 관리자 이메일 주소를 입력하세요)

    // 관리자 이메일 계정 설정
    String host = "smtp.naver.com";
    final String adminEmail = "seoulmate01@naver.com"; // 관리자 이메일 주소
    final String adminPassword = "seoulmate0!"; // 관리자 이메일 비밀번호

    // SMTP 서버 설정
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", "465");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.ssl.enable", "true");
    props.put("mail.smtp.debug", "true");
    props.put("mail.smtp.socketFactory.port", "465");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.socketFactory.fallback", "false");
    props.put("mail.smtp.ssl.protocols", "TLSv1.2");
    

    // 인증 설정
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(adminEmail, adminPassword);
        }
    });

    try {
        // 이메일 메시지 설정
        Message message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(adminEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject("문의: " + subject);
        message.setText("문의자 이메일: " + userEmail + "\n\n내용:\n" + content);

        // 이메일 전송
        Transport.send(message);

        out.println("이메일 전송 성공");

    } catch (MessagingException e) {
        throw new RuntimeException(e);
    }
%>