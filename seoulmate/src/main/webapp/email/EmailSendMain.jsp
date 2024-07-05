<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>문의 페이지</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/img/user/seungho.jpg"" />
        
        <!-- 인덱스 페이지 폰트 Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
<title>SMTP 유저에게 메일 보내기</title>
</head>
 <body class="d-flex flex-column">
<h2>이메일 전송하기</h2>
<main class="flex-shrink-0">
 <div class="divider-custom"></div>
        <div class="divider-custom"></div>
        <div class="divider-custom"></div>

<jsp:include page="../MainLayoutElements/header.jsp"></jsp:include>

<form method="post" action="EmailSendProcess.jsp">
<table border=1>
   <tr>    
        <td>
            받는 사람 : <input type="text" name="auth" value="seoulmate01@naver.com" readonly  />
        </td>
    </tr>
    <tr>    
        <td>
            보내는 사람 : <input type="text" name="user" value="" />
        </td>
    </tr>
    <tr>    
        <td>
            제목 : <input type="text" name="title" size="50" value="" />
        </td>
    </tr>
    <tr>
        <td>
            <textarea name="content" cols="60" rows="10"></textarea>
        </td>
    </tr>
    <tr>
        <td>
            <button type="submit">전송하기</button>
        </td>
    </tr>
</table>
</form>
                </div>
                
                
                    </div>
                </div>
            </section>
        </main>
        <jsp:include page="../MainLayoutElements/footer.jsp"></jsp:include>
	
	<!-- Core theme JS-->
       <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>