<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
        
            <jsp:include page="../MainLayoutElements/header.jsp"></jsp:include>
        
        <div class="divider-custom"></div>
        <div class="divider-custom"></div>
        <div class="divider-custom"></div>
            
            <!-- Page content-->
            <section class="py-5" style="background-color:#D4F1F4;">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-4 py-5 px-4 px-md-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">Get in touch</h1>
                            <p class="lead fw-normal text-muted mb-0">무엇이든 물어보세요!</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                                
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                        <label for="name">Full name</label>
                                        <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                                    </div>
                                    
                                    <!-- Email address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                        <label for="email">Email address</label>
                                        <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                        <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                                    </div>
                                    
                                    <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                        <label for="phone">Phone number</label>
                                        <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                                    </div>
                                    
                                    <!-- Message input-->
                                    <div class="form-floating mb-3">
                                        <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                        <label for="message">Message</label>
                                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                                    </div>
                                    
                                    <!-- Submit success message-->
                                    <!-- This is what your users will see when the form has successfully submitted -->
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">메시지가 성공적으로 전달되었습니다!</div>
                                            <br />
                                            <a href="../boards/festivalList.jsp">서울에서 열리는 행사가 궁금하다면?</a>
                                        </div>
                                    </div>
                                    
                                    <!-- Submit error message-->
                                    <!-- This is what your users will see when there is an error submitting the form-->
                                    <div class="d-none" id="submitErrorMessage">
                                    	<div class="text-center text-danger mb-3">
                                    		Error sending message!
                                    	</div>
                                    </div>
                                    
                                    <!-- Submit Button-->
                                    <div class="d-grid">
                                    	<button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">
                                    		Submit
                                    	</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
	<script>
		document.getElementsByTagName("BODY")[0].onpageshow = function() {
			myFunction()
		};

		function myFunction() {
			document.getElementById("demo").innerHTML = "Welcome To My Homepage!";
		};

		/* This is equivalent to assigning the event to the window object:
		 window.onpageshow = function() {
		 document.getElementById("demo").innerHTML = "Welcome To My Homepage!";
		 };
		 */
	</script>
	
	<!-- Footer -->
	
	<jsp:include page="../MainLayoutElements/footer.jsp"></jsp:include>
	
	<!-- Core theme JS-->
       <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>