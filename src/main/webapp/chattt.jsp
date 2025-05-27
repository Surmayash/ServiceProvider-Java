<%@ page import="java.util.Base64"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession sessionUser = request.getSession(false);
if (sessionUser == null || sessionUser.getAttribute("userEmail") == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chat</title>
<!-- ========== All CSS files linkup ========= -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/lineicons.css" />
<link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
<link rel="stylesheet" href="assets/css/fullcalendar.css" />
<link rel="stylesheet" href="assets/css/main.css" />

<style>
.round-image {
	width: 50px;
	height: 45px;
	border-radius: 50%;
	object-fit: cover;
}

body {
	background-image: url('assets/images/profile/chat.jpg');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

/* Chat Container */
.chat-container {
	width: 350px;
	background: #f8f9fa;
	border-radius: 10px;
	border: 2px solid #6a9ecf; /* Darker border color */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Slightly darker shadow */
	overflow: hidden;
	margin: 50px auto;
	font-family: Arial, sans-serif;
}

/* Chat Header */
.chat-header {
	background: #6a9ecf;
	color: white;
	padding: 10px;
	display: flex;
	align-items: center;
}

/* Profile Image */
.profile-image {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-right: 10px;
	border: 2px solid white;
}

.worker-name {
	color: white;
}

/* Chat Body */
.chat-body {
	height: 300px;
	overflow-y: auto;
	padding: 10px;
	display: flex;
	flex-direction: column;
}

/* Messages */
.bot-message, .user-message {
	padding: 8px 12px;
	border-radius: 10px;
	margin: 5px 0;
	max-width: 75%;
	word-wrap: break-word;
	opacity: 0;
	transform: translateY(10px);
	animation: fadeIn 0.5s ease-in-out forwards;
}

.bot-message {
	background: #bed8ef;
	align-self: flex-start;
}

.user-message {
	background: #6a9ecf;
	color: white;
	align-self: flex-end;
}

/* Hover Effects */
.user-message:hover, .bot-message:hover {
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
	transition: 0.3s ease;
}

/* Chat Footer */
.chat-footer {
	display: flex;
	padding: 10px;
	background: #ffffff;
	border-top: 1px solid #ddd;
	align-items: center;
}

/* Input Field */
.chat-footer input {
	flex: 1;
	padding: 10px;
	border: 2px solid #ddd;
	outline: none;
	border-radius: 20px;
	transition: all 0.3s ease;
}

/* Input Field Hover & Focus */
.chat-footer input:hover, .chat-footer input:focus {
	border-color: #6a9ecf;
	box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
}

.chat-footer button, .emoji-btn, .file-btn {
	padding: 8px 10px;
	background: #6a9ecf;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 5px;
	transition: 0.3s ease;
}

.file-btn {
	background: transparent;
}

.file-input {
	display: none;
}

/* Hover Effect on Buttons */
.chat-footer button:hover, .emoji-btn:hover, .file-btn:hover {
	opacity: 0.8;
}

/* File Message */
.file-message a {
	color: #ffffff;
	text-decoration: none;
	font-weight: bold;
}

/* Smooth Message Animation */
@keyframes fadeIn {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

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

		<!-- ========== tab components start ========== -->
		<section class="tab-components">
			<div class="container-fluid">
				<!-- ========== title-wrapper start ========== -->
				<div class="title-wrapper pt-30">
					<div class="row align-items-center">
						<div class="col-md-6">
							<div class="title">
								<h2>Chat</h2>
							</div>
						</div>
					</div>
					<!-- end row -->
				</div>

				<div class="chat-container">
					<div class="chat-header">
						<img src="assets/images/profile/profile-image.png" alt="ChatBot"
							class="profile-image">
						<h3 class="worker-name">Vipin Jain</h3>
					</div>
					<div class="chat-body" id="chatBody">
						<div class="bot-message">Nameste! Yash 😊</div>
						<div class="bot-message">Worker jald he connect honge.</div>
						<div class="bot-message">
							<strong>⚠️ NOTE -</strong><br> <br> Don't share
							your personal detail's with worker.
						</div>
						<div class="bot-message">
							<strong>⚠️ NOTE -</strong><br> <br> कृपया
							अपनी व्यक्तिगत जानकारी
							Worker के साथ साझा न करें।
						</div>
					</div>
					<div class="chat-footer">
						<input type="text" id="userInput" placeholder="Type a message...">
						<button class="file-btn"
							onclick="document.getElementById('fileInput').click()">📎</button>
						<input type="file" id="fileInput" class="file-input"
							onchange="sendFile()">
						<button onclick="sendMessage()">Send</button>
					</div>
				</div>

				<script> 
        function sendMessage() {
            let userInput = document.getElementById("userInput").value;
            let chatBody = document.getElementById("chatBody");

            if (userInput.trim() === "") return; 

            // Add User Message
            let userMessage = document.createElement("div");
            userMessage.className = "user-message";
            userMessage.innerText = userInput;
            chatBody.appendChild(userMessage);

            // Auto Reply (Basic Bot Response)
            setTimeout(() => {
                let botMessage = document.createElement("div");
                botMessage.className = "bot-message";
                botMessage.innerText = "I'm just a bot! 😃";
                chatBody.appendChild(botMessage);
                chatBody.scrollTop = chatBody.scrollHeight;
            }, 1000);

            document.getElementById("userInput").value = "";
            chatBody.scrollTop = chatBody.scrollHeight;
        }

        function addEmoji() {
            document.getElementById("userInput").value += "😊";
        }

        function sendFile() {
            let fileInput = document.getElementById("fileInput");
            let chatBody = document.getElementById("chatBody");

            if (fileInput.files.length > 0) {
                let file = fileInput.files[0];
                let fileURL = URL.createObjectURL(file);

                let fileMessage = document.createElement("div");
                fileMessage.className = "user-message file-message";
                fileMessage.innerHTML = `<a href="${fileURL}" target="_blank" download>${file.name} 📂</a>`;
                chatBody.appendChild(fileMessage);

                chatBody.scrollTop = chatBody.scrollHeight;
            }
        }
    </script>

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
							<p class="text-sm">Service System � 2025</p>
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
</body>
</html>

