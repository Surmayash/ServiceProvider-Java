<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="assets/images/favicon.svg"
	type="image/x-icon" />
<title>Sign In</title>

<!-- ========== All CSS files linkup ========= -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/lineicons.css" />
<link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
<link rel="stylesheet" href="assets/css/fullcalendar.css" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<style>
.navbar-logo img {
	width: 200px;
	height: auto;
}
/* Tablet (max 768px) ke liye */
@media ( max-width : 768px) {
	.navbar-logo img {
		max-width: 200px; /* Thoda chhota kar diya */
	}
}

/* Mobile (max 480px) ke liye */
@media ( max-width : 480px) {
	.navbar-logo img {
		max-width: 150px; /* Aur chhota kar diya */
	}
}
</style>
<body>
	<!-- ========== signin-section start ========== -->
	<section class="signin-section">
		<div class="container-fluid">
			<div class="row g-0 auth-row">
				<div class="col-lg-6">
					<div class="auth-cover-wrapper bg-primary-100">
						<div class="auth-cover">
							<div class="title text-center">
								<div class="navbar-logo">
									<img src="assets/images/logo/logo.png" alt="logo" />
								</div>
								<br>
								<h1>Welcome Back</h1>
								<p class="text-medium">Sign in to your Existing account to
									continue</p>
							</div>
							<div class="cover-image">
								<img src="assets/images/auth/signin-image.svg" alt="" />
							</div>
							<div class="shape-image">
								<img src="assets/images/auth/shape.svg" alt="" />
							</div>
						</div>
					</div>
				</div>
				<!-- end col -->
				<div class="col-lg-6">
					<div class="signin-wrapper">
						<div class="form-wrapper">
							<h6 class="mb-15">Sign In</h6>
							<form action="LoginServlet" method="post">
								<div class="row">
									<div class="col-12">
										<div class="input-style-1">
											<label>Email</label> <input type="email" placeholder="Email"
												name="email" required />
										</div>
									</div>
									<!-- end col -->
									<div class="col-12">
										<div class="input-style-1">
											<label>Password</label> <input type="password"
												placeholder="Password" name="password" required />
										</div>
									</div>
									<!-- end col -->
									<div class="col-xxl-6 col-lg-12 col-md-6">
										<div
											class="text-start text-md-end text-lg-start text-xxl-end mb-30">
											<a href="reset-password.html" class="hover-underline">
												Forgot Password? </a>
										</div>
									</div>
									<!-- end col -->
									<div class="col-12">
										<button type="submit"
											class="main-btn primary-btn btn-hover w-100 text-center">
											Sign In</button>
									</div>
								</div>
							</form>
							<div class="singup-option pt-40">
								<p class="text-sm text-medium text-dark text-center">
									Don't have any account yet? <a href="signup.jsp">Create
										an account</a>
								</p>
							</div>
							<br> <br>
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-6 order-last order-md-first">
										<div class="copyright text-center text-md-start">
											<p class="text-sm">Service System © 2025</p>
										</div>
									</div>
									<!-- end col-->
									<div class="col-md-6">
										<div
											class="terms d-flex justify-content-center justify-content-md-end">
											<a href="term.jsp" class="text-sm">Term & Conditions</a>
										</div>
									</div>
								</div>
								<!-- end row -->
							</div>
						</div>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
	</section>
	<!-- ========== signin-section end ========== -->

	<!-- ========= All Javascript files linkup ======== -->
	<script>
    function showAlert(message, type) {
        let bgColor = type === "error" ? "red" : "green";  
        let alertBox = document.createElement("div");

        alertBox.innerHTML = message;
        alertBox.style.position = "fixed";
        alertBox.style.top = "10px";
        alertBox.style.left = "50%";
        alertBox.style.transform = "translateX(-50%)";
        alertBox.style.backgroundColor = bgColor;
        alertBox.style.color = "white";
        alertBox.style.padding = "10px 20px";
        alertBox.style.borderRadius = "5px";
        alertBox.style.zIndex = "1000";

        document.body.appendChild(alertBox);

        setTimeout(() => {
            alertBox.remove();  
        }, 3000);
    }

    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has("error")) {
        showAlert(urlParams.get("error"), "error");
    } else if (urlParams.has("success")) {
        showAlert(urlParams.get("success"), "success");
    }
</script>
	
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/Chart.min.js"></script>
	<script src="assets/js/dynamic-pie-chart.js"></script>
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/fullcalendar.js"></script>
	<script src="assets/js/jvectormap.min.js"></script>
	<script src="assets/js/world-merc.js"></script>
	<script src="assets/js/polyfill.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
