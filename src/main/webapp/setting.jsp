<%@ page import="java.util.Base64"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession sessionUser = request.getSession(false);
if (sessionUser == null || sessionUser.getAttribute("userEmail") == null) {
	response.sendRedirect("signin.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Settings</title>

<!-- ========== All CSS files linkup ========= -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/lineicons.css" />
<link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
<link rel="stylesheet" href="assets/css/fullcalendar.css" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<style>
.round-image {
	width: 50px;
	height: 45px;
	border-radius: 50%;
	object-fit: cover;
}

.navbar-logo img {
	width: 110px; /* Adjust as needed */
	height: auto; /* Maintain aspect ratio */
}

.nav-item .icon {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	vertical-align: middle; /* Align icon with text */
	margin-right: 8px; /* Adjust spacing */
	position: relative;
	top: 2px; /* Moves icon slightly down */
}
</style>
<body>
	<!-- ======== Preloader =========== -->
	<div id="preloader">
		<div class="spinner"></div>
	</div>
	<!-- ======== Preloader =========== -->

	<!-- ======== sidebar-nav start =========== -->
	<aside class="sidebar-nav-wrapper">
		<div class="navbar-logo">
			<a href="#0"> <img src="assets/images/logo/logo.png" alt="logo" />
			</a>
		</div>

		<nav class="sidebar-nav">
			<ul id="ddmenu_1" class="collapse show dropdown-nav">
				<li class="nav-item "><a href="userDash.jsp"> <span
						class="icon"> <i class="lni lni-briefcase"></i>
					</span> <span class="text">Services</span>
				</a></li>

				<li class="nav-item"><a href="bookings.jsp"> <span
						class="icon"> <i class="lni lni-calendar"></i>
					</span> <span class="text">Bookings</span>
				</a></li>

				<span class="divider"><hr /></span>
				<li class="nav-item"><a href="profile.jsp"> <span
						class="icon"> <i class="lni lni-user"></i>
					</span> <span class="text">Profile</span>
				</a></li>
				<!-- Settings Icon -->
				<li class="nav-item active"><a href="setting.jsp"> <span
						class="icon"> <i class="lni lni-cog"></i>
					</span> <span class="text">Settings</span>
				</a></li>

				<li class="nav-item"><a href="notification.jsp"> <span
						class="icon"> <i class="lni lni-alarm"></i>
					</span> <span class="text">Notifications</span>
				</a></li>

				<span class="divider"><hr /></span>
				<li class="nav-item"><a href="help.jsp"> <span class="icon">
							<i class="lni lni-comments"></i>
					</span> <span class="text">Help & Support</span>
				</a></li>

				<li class="nav-item"><a href="signin.jsp"> <span
						class="icon"> <i class="lni lni-exit"></i>
					</span> <span class="text">Sign Out</span>
				</a></li>

				<span class="divider"><hr /></span>
				<li class="nav-item "><a> <span class="icon"> </span> <span
						class="text">Thank's for Visiting.&#128512;</span>
				</a></li>
			</ul>
		</nav>
	</aside>
	<div class="overlay"></div>
	<!-- ======== sidebar-nav end =========== -->

	<!-- ======== main-wrapper start =========== -->
	<main class="main-wrapper">
		<!-- ========== header start ========== -->
		<header class="header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-5 col-md-5 col-6">
						<div class="header-left d-flex align-items-center">
							<div class="menu-toggle-btn mr-15">
								<button id="menu-toggle" class="main-btn primary-btn btn-hover">
									<i class="lni lni-chevron-left me-2"></i> Menu
								</button>
							</div>
							<div class="header-search d-none d-md-flex">
								<form action="#">
									<input type="text" placeholder="Search..." />
									<button>
										<i class="lni lni-search-alt"></i>
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="col-lg-7 col-md-7 col-6">
						<div class="header-right">
							<!-- message start -->
							<div class="header-message-box ml-15 d-none d-md-flex">
								<button class="dropdown-toggle" type="button" id="message"
									data-bs-toggle="dropdown" aria-expanded="false">
									<svg width="22" height="22" viewBox="0 0 22 22" fill="none"
										xmlns="http://www.w3.org/2000/svg">
                      <path
											d="M7.74866 5.97421C7.91444 5.96367 8.08162 5.95833 8.25005 5.95833C12.5532 5.95833 16.0417 9.4468 16.0417 13.75C16.0417 13.9184 16.0364 14.0856 16.0259 14.2514C16.3246 14.138 16.6127 14.003 16.8883 13.8482L19.2306 14.629C19.7858 14.8141 20.3141 14.2858 20.129 13.7306L19.3482 11.3882C19.8694 10.4604 20.1667 9.38996 20.1667 8.25C20.1667 4.70617 17.2939 1.83333 13.75 1.83333C11.0077 1.83333 8.66702 3.55376 7.74866 5.97421Z"
											fill="" />
                      <path
											d="M14.6667 13.75C14.6667 17.2938 11.7939 20.1667 8.25004 20.1667C7.11011 20.1667 6.03962 19.8694 5.11182 19.3482L2.76946 20.129C2.21421 20.3141 1.68597 19.7858 1.87105 19.2306L2.65184 16.8882C2.13062 15.9604 1.83338 14.89 1.83338 13.75C1.83338 10.2062 4.70622 7.33333 8.25004 7.33333C11.7939 7.33333 14.6667 10.2062 14.6667 13.75ZM5.95838 13.75C5.95838 13.2437 5.54797 12.8333 5.04171 12.8333C4.53545 12.8333 4.12504 13.2437 4.12504 13.75C4.12504 14.2563 4.53545 14.6667 5.04171 14.6667C5.54797 14.6667 5.95838 14.2563 5.95838 13.75ZM9.16671 13.75C9.16671 13.2437 8.7563 12.8333 8.25004 12.8333C7.74379 12.8333 7.33338 13.2437 7.33338 13.75C7.33338 14.2563 7.74379 14.6667 8.25004 14.6667C8.7563 14.6667 9.16671 14.2563 9.16671 13.75ZM11.4584 14.6667C11.9647 14.6667 12.375 14.2563 12.375 13.75C12.375 13.2437 11.9647 12.8333 11.4584 12.8333C10.9521 12.8333 10.5417 13.2437 10.5417 13.75C10.5417 14.2563 10.9521 14.6667 11.4584 14.6667Z"
											fill="" />
                    </svg>
									<span></span>
								</button>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="message">
									<li><a href="#0">
											<div class="image">
												<img src="assets/images/lead/lead-5.png" alt="" />
											</div>
											<div class="content">
												<h6>Jacob Jones</h6>
												<p>Hey!I can across your profile and ...</p>
												<span>10 mins ago</span>
											</div>
									</a></li>
									<li><a href="#0">
											<div class="image">
												<img src="assets/images/lead/lead-3.png" alt="" />
											</div>
											<div class="content">
												<h6>John Doe</h6>
												<p>Would you mind please checking out</p>
												<span>12 mins ago</span>
											</div>
									</a></li>
									<li><a href="#0">
											<div class="image">
												<img src="assets/images/lead/lead-2.png" alt="" />
											</div>
											<div class="content">
												<h6>Anee Lee</h6>
												<p>Hey! are you available for freelance?</p>
												<span>1h ago</span>
											</div>
									</a></li>
								</ul>
							</div>
							<!-- message end -->
							<!-- profile start -->
							<div class="profile-box ml-15">
								<button class="dropdown-toggle bg-transparent border-0"
									type="button" id="profile" data-bs-toggle="dropdown"
									aria-expanded="false">
									<div class="profile-info">
										<div class="info">
											<div class="image">
												<img
													src="data:image/jpeg;base64,<%=sessionUser.getAttribute("userPhoto")%>"
													class="round-image">
											</div>
											<div>
												<h6 class="fw-500"><%=sessionUser.getAttribute("firstName")%>
													<%=sessionUser.getAttribute("lastName")%></h6>
												<p>User</p>
											</div>
										</div>
									</div>
								</button>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="profile">
									<li>
										<div class="author-info flex items-center !p-1">
											<div class="image">
												<img
													src="data:image/jpeg;base64,<%=sessionUser.getAttribute("userPhoto")%>"
													class="profile-photo">
											</div>
											<div class="content">
												<h4 class="text-sm"><%=sessionUser.getAttribute("firstName")%>
													<%=sessionUser.getAttribute("lastName")%></h4>
												<a
													class="text-black/40 dark:text-white/40 hover:text-black dark:hover:text-white text-xs"
													href="#"><%=sessionUser.getAttribute("userEmail")%></a>
											</div>
										</div>
									</li>
									<li class="divider"></li>
									<li><a href="profile.jsp"> <i class="lni lni-user"></i>
											View Profile
									</a></li>
									<li><a href="notification.jsp"> <i
											class="lni lni-alarm"></i> Notifications
									</a></li>
									<li><a href="bookings.jsp"> <i class="lni lni-inbox"></i>
											Bookings
									</a></li>
									<li><a href="setting.jsp"> <i class="lni lni-cog"></i>
											Settings
									</a></li>
									<li class="divider"></li>
									<li><a href="signin.jsp"> <i class="lni lni-exit"></i>
											Sign Out
									</a></li>
								</ul>
							</div>
							<!-- profile end -->
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- ========== header end ========== -->

		<!-- ========== tab components start ========== -->
		<section class="tab-components">
			<div class="container-fluid">
				<!-- ========== title-wrapper start ========== -->
				<div class="title-wrapper pt-30">
					<div class="row align-items-center">
						<div class="col-md-6">
							<div class="title">
								<h2>Settings</h2>
							</div>
						</div>
					</div>
					<!-- end row -->
				</div>
				<!-- ========== title-wrapper end ========== -->

				<div class="form-elements-wrapper">
					<div class="row">
						<div class="col-lg-6">
							<!-- ========== Contact Us Start ========== -->
							<div class="card-style mb-30">
								<h6 class="mb-25">Contact Us!</h6>
								<form action="ContactServlet" method="post">
									<div class="input-style-1">
										<label>Email</label> <input type="email" name="email"
											placeholder="Email" required />
									</div>
									<div class="input-style-1">
										<label>Message</label>
										<textarea name="message" placeholder="Type here" rows="6"
											required></textarea>
									</div>
									<div class="col-12">
										<button type="submit" class="main-btn primary-btn btn-hover">Send</button>
									</div>
								</form>
							</div>
							<!-- ========== Contact Us End ========== -->


							<!-- ======= Delete Account Start ======= -->
							<div class="card-style mb-30">
								<h6 class="mb-25">Delete Account</h6>
								<form action="DeleteAccountServlet" method="post">
									<div class="input-style-1">
										<label style="color: red;">Once you delete your
											account, you can't login again.</label> <label>Why are you
											deleting your account?</label>
										<textarea name="reason" placeholder="Write your reason here"
											rows="5" required></textarea>
									</div>
									<input type="hidden" name="email"
										value="<%=session.getAttribute("userEmail")%>" />
									<div class="col-12">
										<button type="submit" class="main-btn primary-btn btn-hover">Delete</button>
									</div>
								</form>
							</div>
							<!-- ======= Delete Account End ======= -->

						</div>


						<div class="col-lg-6">
							<!-- ======= Password Change Start ======= -->
							<div class="card-style mb-30">
								<h6 class="mb-25">Change Password</h6>
								<form action="/ServiceSystemApp/ChangePasswordServlet"
									method="post">
									<!-- Current Password -->
									<div class="input-style-1">
										<label>Current Password</label> <input type="password"
											name="currentPassword" placeholder="Enter Current Password"
											required>
									</div>

									<!-- New Password -->
									<div class="input-style-1">
										<label>New Password</label> <input type="password"
											name="newPassword" placeholder="Enter New Password" required>
									</div>

									<!-- Confirm New Password -->
									<div class="input-style-1">
										<label>Confirm New Password</label> <input type="password"
											name="confirmPassword" placeholder="Re-enter New Password"
											required>
									</div>

									<input type="hidden" name="email"
										value="<%=session.getAttribute("userEmail")%>" />

									<div class="col-12">
										<button type="submit" class="main-btn primary-btn btn-hover">Save
											Password</button>
									</div>
								</form>
							</div>
							<!-- ======= Password Change End ======= -->
						
							<!-- ======= checkbox style start ======= -->
							<div class="card-style mb-30">
								<h6 class="mb-25">Checkbox</h6>
								<div class="form-check checkbox-style mb-20">
									<input class="form-check-input" type="checkbox" value=""
										id="checkbox-1" /> <label class="form-check-label"
										for="checkbox-1"> Default Checkbox</label>
								</div>
								<!-- end checkbox -->
								<div class="form-check checkbox-style mb-20">
									<input class="form-check-input" type="checkbox" value=""
										id="checkbox-2" disabled /> <label class="form-check-label"
										for="checkbox-2"> Disabled Checkbox</label>
								</div>
								<!-- end checkbox -->
								<div class="form-check checkbox-style checkbox-success mb-20">
									<input class="form-check-input" type="checkbox" value=""
										id="checkbox-3" /> <label class="form-check-label"
										for="checkbox-3"> Success Checkbox</label>
								</div>
								<!-- end checkbox -->
								<div class="form-check checkbox-style checkbox-warning mb-20">
									<input class="form-check-input" type="checkbox" value=""
										id="checkbox-4" /> <label class="form-check-label"
										for="checkbox-4"> Warning Checkbox</label>
								</div>
								<!-- end checkbox -->
								<div class="form-check checkbox-style checkbox-danger mb-20">
									<input class="form-check-input" type="checkbox" value=""
										id="checkbox-5" /> <label class="form-check-label"
										for="checkbox-5"> Danger Checkbox</label>
								</div>
								<!-- end checkbox -->
							</div>
							<!-- ======= checkbox style end ======= -->

						</div>
						<!-- end col -->
					</div>
					<!-- end row -->
				</div>
				<!-- ========== form-elements-wrapper end ========== -->
			</div>
			<!-- end container -->
		</section>
		<!-- ========== tab components end ========== -->

		<!-- ========== footer start =========== -->
		<footer class="footer">
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
							The only one platform for booking Unlimited Service.</div>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</footer>
		<!-- ========== footer end =========== -->
	</main>
	<!-- ======== main-wrapper end =========== -->

	<!-- ========= All Javascript files linkup ======== -->
	<script>
    // Function to show alert popup
    function showAlert(message, type) {
        let bgColor = type === "error" ? "red" : "green";  // Error: Red | Success: Green
        let alertBox = document.createElement("div");

        alertBox.innerHTML = message;
        alertBox.style.position = "fixed";
        alertBox.style.top = "15px";
        alertBox.style.left = "50%";
        alertBox.style.transform = "translateX(-50%)";
        alertBox.style.backgroundColor = bgColor;
        alertBox.style.color = "white";
        alertBox.style.padding = "10px 20px";
        alertBox.style.borderRadius = "5px";
        alertBox.style.zIndex = "1000";

        document.body.appendChild(alertBox);

        setTimeout(() => {
            alertBox.remove();  // Hide popup after 3 seconds
        }, 3000);
    }

    // Check if error or success message exists in URL
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
