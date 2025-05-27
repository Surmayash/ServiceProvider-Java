<%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession sessionUser = request.getSession(false);
if (sessionUser == null || sessionUser.getAttribute("userEmail") == null) {
	response.sendRedirect("signin.jsp");
}
%>
<%
String workerType = request.getParameter("type"); // Get type from URL parameter
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="assets/images/favicon.svg"
	type="image/x-icon" />
<title><%=workerType%> Available</title>

<!-- ========== All CSS files linkup ========= -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/lineicons.css" />
<link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
<link rel="stylesheet" href="assets/css/fullcalendar.css" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<style>
/*VIEW PROFILE START*/
/* Container for profile image */
.profile-container {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Rotating Border */
.profile-container::before {
    content: "";
    position: absolute;
    width: 106px;  /* Slightly larger than image */
    height: 106px;
    border-radius: 50%;
    background: conic-gradient(#28a745 0deg, #007bff 120deg, #28a745 240deg, #007bff 360deg);
    animation: rotateBorder 2s linear infinite;
    padding: 2px;  /* Thinner border */
}

/* Profile Image */
#profileImage {
    width: 100px;  
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    display: block;
    position: relative;
    z-index: 1;  /* Keeps the image above the border */
}

/* Thin Line Below the Image */
.profile-container::after {
    content: "";
    position: absolute;
    width: 50px; /* Adjust width as needed */
    height: 2px; /* Thin line */
    background: linear-gradient(to right, #28a745, #007bff); /* Gradient effect */
    bottom: -10px; /* Positioning below the image */
    left: 50%;
    transform: translateX(-50%);
    border-radius: 10px;
}

/* Border Rotation Animation */
@keyframes rotateBorder {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/*CARD IMAGE START*/
.card-imagee {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Rotating Border */
.card-imagee::before {
    content: "";
    position: absolute;
    width: calc(min(20vw, 120px) + 6px);  /* Slightly larger than image */
    height: calc(min(20vw, 120px) + 6px);
    border-radius: 50%;
    background: conic-gradient(#28a745 0deg, #007bff 120deg, #28a745 240deg, #007bff 360deg);
    animation: rotateBorder 2s linear infinite;
    padding: 2px;  /* Thinner border */
}

/* Image */
.card-imagee img {
    width: min(20vw, 120px);  
    height: min(20vw, 120px);
    min-width: 50px;
    min-height: 50px;
    border-radius: 50%;
    object-fit: cover;
    display: block;
    margin: auto;
    position: relative;
    z-index: 1;  /* Keeps the image above the border */
}

/* Thin Line Below the Image */
.card-imagee::after {
    content: "";
    position: absolute;
    width: 50%; /* Adjust width as needed */
    height: 2px; /* Thin line */
    background: linear-gradient(to right, #28a745, #007bff); /* Gradient effect */
    bottom: -10px; /* Positioning below the image */
    left: 50%;
    transform: translateX(-50%);
    border-radius: 10px;
}

/* Border Rotation Animation */
@keyframes rotateBorder {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}



.round-image {
	width: 50px;
	height: 45px;
	border-radius: 50%;
	object-fit: cover;
}

.action-buttons {
	margin-top: 10px;
	display: flex;
	gap: 10px; /* Adds space between buttons */
}

.small-btn {
	padding: 5px 10px;
	font-size: 12px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

.chat-btn {
	background-color: #007bff;
	color: white;
}

.call-btn {
	background-color: #28a745 ;
	color: white;
}

.small-btn:hover {
	opacity: 0.8;
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
				<li class="nav-item"><a href="setting.jsp"> <span
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

		<!-- ========== card components start ========== -->
		<section class="card-components">
			<div class="container-fluid">
				<!-- ========== title-wrapper start ========== -->
				<div class="title-wrapper pt-30">
					<div class="row align-items-center">
						<div class="col-md-6">
							<div class="title">
								<h2><%=workerType%>
									Available
								</h2>
							</div>
						</div>
						<!-- end col -->
					</div>
					<!-- end row -->
				</div>
				<!-- ========== title-wrapper end ========== -->

				<!-- ========== cards-styles start ========== -->
				<div class="cards-styles">
					<!-- ========= card-style-2 start ========= -->
					<div class="row">
						<%
						Connection con = null;
						PreparedStatement pst = null;
						ResultSet rs = null;

						try {
							Class.forName("com.mysql.cj.jdbc.Driver");
							con = DriverManager.getConnection("jdbc:mysql://localhost:3306/service_system", "root", "vipin0987654321");

							String query = "SELECT first_name, last_name, email, contact, address, city, state, country, type, photo FROM workers WHERE type=?";
							pst = con.prepareStatement(query);
							pst.setString(1, workerType);
							rs = pst.executeQuery();

							boolean hasWorkers = false;

							while (rs.next()) {
								hasWorkers = true;
								String firstName = rs.getString("first_name");
								String lastName = rs.getString("last_name");
								String email = rs.getString("email");
								String contact = rs.getString("contact");
								String address = rs.getString("address");
								String city = rs.getString("city");
								String state = rs.getString("state");
								String country = rs.getString("country");
								String type = rs.getString("type");
								byte[] photoData = rs.getBytes("photo");

								String base64Image = "";
								if (photoData != null) {
							base64Image = Base64.getEncoder().encodeToString(photoData);
								}
						%>
						<!-- Worker Card -->
						<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
							<div class="card-style-2 mb-30">
								<div class="card-imagee">
									<%
									if (!base64Image.isEmpty()) {
									%>
									<img src="data:image/jpeg;base64,<%=base64Image%>"
										alt="Worker Photo">
									<%
									} else {
									%>
									<img src="assets/images/profile/worker.jpg"
										" alt="Default Photo">
									<%
									}
									%>
								</div><br>
								<div class="card-content">
									<h4><%=firstName%>
										<%=lastName%></h4>
									<br>
									<p>Religion : Hindu</p>
									<p>
										Type :
										<%=type%></p>
									<p>
										City :
										<%=city%></p>

									<!-- Chat & View Profile Buttons -->
									<div class="action-buttons">
									
										<!-- Chat Button - Opens Modal -->
										<button class="small-btn chat-btn"
    onclick="openChat('<%=firstName%>', '<%=lastName%>', '<%=email%>', '<%=base64Image%>')">
    <i class="lni lni-comments"></i> Chat & Book
</button>



										<!-- View Profile Button - Opens Modal -->
										<button class="small-btn call-btn view-profile-btn"
											onclick="openProfileModal('<%=firstName%>', '<%=lastName%>', '<%=type%>', '<%=contact%>', '<%=address%>', '<%=city%>', '<%=state%>', '<%=country%>', '<%=base64Image%>')">
											<i class="lni lni-user"></i> View Profile
										</button>
									</div>
								</div>
							</div>
						</div>
						<%
						}

						if (!hasWorkers) {
						%>
						<h3 style="text-align: center; color: red;">
							No
							<%=workerType%>
							available at the moment.
						</h3>
						<%
						}
						} catch (Exception e) {
						e.printStackTrace();
						} finally {
						if (rs != null)
						rs.close();
						if (pst != null)
						pst.close();
						if (con != null)
						con.close();
						}
						%>
					</div>
					<!-- Bootstrap Modal for Profile Details -->
					<div class="modal fade" id="profileModal" tabindex="-1"
						aria-labelledby="profileModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="profileModalLabel">Worker
										Profile</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body text-center">
									<div class="profile-container">
									<img id="profileImage" src="your-image.jpg" alt="Worker Photo" class="rounded-circle">
									</div><br>
									<h5 id="profileName"></h5>
									<p>
										<strong>Type:</strong> <span id="profileType"></span>
									</p>
									<p>
										<strong>Contact:</strong> <span id="profileContact"></span>
									</p>
									<p>
										<strong>Address:</strong> <span id="profileAddress"></span>
									</p>
									<p>
										<strong>City:</strong> <span id="profileCity"></span>
									</p>
									<p>
										<strong>State:</strong> <span id="profileState"></span>
									</p>
									<p>
										<strong>Country:</strong> <span id="profileCountry"></span>
									</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>

					<!-- end row -->
					<!-- ========= card-style-2 end ========= -->
				</div>
				<!-- ========== cards-styles end ========== -->
			</div>
			<!-- end container -->
		</section>
		<!-- ========== card components end ========== -->

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
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/Chart.min.js"></script>
	<script src="assets/js/dynamic-pie-chart.js"></script>
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/fullcalendar.js"></script>
	<script src="assets/js/jvectormap.min.js"></script>
	<script src="assets/js/world-merc.js"></script>
	<script src="assets/js/polyfill.js"></script>
	<script src="assets/js/main.js"></script>
	<!-- JavaScript to Populate and Show Modal -->
	<script>
		function openProfileModal(firstName, lastName, type, contact, address,
				city, state, country, photo) {
			document.getElementById("profileName").innerText = firstName + " "
					+ lastName;
			document.getElementById("profileType").innerText = type;
			document.getElementById("profileContact").innerText = contact;
			document.getElementById("profileAddress").innerText = address;
			document.getElementById("profileCity").innerText = city;
			document.getElementById("profileState").innerText = state;
			document.getElementById("profileCountry").innerText = country;

			if (photo && photo !== "null") {
				document.getElementById("profileImage").src = "data:image/jpeg;base64,"
						+ photo;
			} else {
				document.getElementById("profileImage").src = "assets/images/profile/worker.jpg";
			}

			var profileModal = new bootstrap.Modal(document
					.getElementById("profileModal"));
			profileModal.show();
		}
	</script>
	<script>
    function openChat(firstName, lastName, email, photo) {
        // Encode URI to prevent special character issues
        let encodedPhoto = encodeURIComponent(photo);
        let chatUrl = "chat.jsp?workerEmail=" + encodeURIComponent(email) + 
                      "&workerName=" + encodeURIComponent(firstName + " " + lastName) + 
                      "&photo=" + encodedPhoto;

        // Redirect to chat page
        window.location.href = chatUrl;
    }
</script>

	

	
	
</body>
</html>
