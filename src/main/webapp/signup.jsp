<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="assets/images/favicon.svg"
	type="image/x-icon" />
<title>Sign Up</title>

<!-- ========== All CSS files linkup ========= -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/lineicons.css" />
<link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
<link rel="stylesheet" href="assets/css/fullcalendar.css" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<style>
.navbar-logo img {
	width: 300px;
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
								<h1>Nameste!</h1>
								<p class="text-medium">
									Let's book your unlimited service here. <br class="d-sm-block" />
								</p>
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
					<div class="signup-wrapper">
						<div class="form-wrapper">
							<h6 class="mb-15">Sign Up</h6>
							<form action="SignupServlet" method="post" enctype="multipart/form-data">
								<div class="row">
									<div class="col-12">
										<div class="input-style-1">
											<label>First Name</label> <input type="text"
												name="first_name" placeholder="First Name" required />
										</div>
									</div>
									<div class="col-12">
										<div class="input-style-1">
											<label>Last Name</label> <input type="text" name="last_name"
												placeholder="Last Name" required />
										</div>
									</div>
									<div class="col-12">
										<div class="input-style-1">
											<label>Email</label> <input type="email" name="email"
												placeholder="Email" required />
										</div>
									</div>
									<div class="col-12">
										<div class="input-style-1">
											<label>Contact</label> <input type="number" name="contact"
												placeholder="Contact" required />
										</div>
									</div>
									<div class="col-12">
										<div class="input-style-1">
											<label>Photo</label> <input type="file" name="photo" />
										</div>
									</div>
									<div class="col-12">
										<div class="input-style-1">
											<label>Password</label> <input type="password"
												name="password" placeholder="Password" required />
										</div>
									</div>
									<div class="col-12">
										<div class="input-style-1">
											<label>Address</label> <input type="text" name="address"
												placeholder="Address" required />
										</div>
									</div>
									<div class="col-xxl-4">
										<div class="input-style-1">
											<label>City</label> <input type="text" name="city"
												placeholder="City" required />
										</div>
									</div>
									<div class="col-xxl-4">
										<div class="input-style-1">
											<label>Pin Code</label> <input type="text" name="pin_code"
												placeholder="Pin Code" required />
										</div>
									</div>
									<div class="col-xxl-4">
										<div class="select-style-1">
											<label>Country</label>
											<div class="select-position">
												<select class="light-bg" name="country" required>
													<option value="">Select country</option>
													<option value="India">India</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-xxl-4">
										<div class="select-style-1">
											<label>State</label>
											<div class="select-position">
												<select class="light-bg" name="state" required>
													<option value="">Select category</option>
													<option value="MP">MP</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-12">
										<button
											class="main-btn primary-btn btn-hover w-100 text-center">Sign
											Up</button>
									</div>
								</div>
							</form>
							<div class="singin-option pt-40">
								<p class="text-sm text-medium text-dark text-center">
									Already have any account. <a href="signin.jsp">Signin</a>
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
