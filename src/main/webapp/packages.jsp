<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon" />
<title>Packages</title>

<!-- ========== All CSS files linkup ========= -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/lineicons.css" />
<link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
<link rel="stylesheet" href="assets/css/fullcalendar.css" />
<link rel="stylesheet" href="assets/css/main.css" />

<style>
/* Background Image */
body {
    background-image: url('assets/images/profile/Payment.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}

/* Card Hover Effect */
.card-style-2 {
background: rgba(255, 255, 255, 0.85); /* Light background with slight transparency */
    border-radius: 10px;
    padding: 20px;
    transition: all 0.3s ease-in-out;
}

.card-style-2:hover {
    transform: scale(1.05);
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
}

/* Button Styling */
.action-buttons {
    margin-top: 10px;
    display: flex;
    gap: 10px;
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
    background-color: #28a745;
    color: white;
}

.small-btn:hover {
    opacity: 0.8;
    transform: scale(1.1);
}
</style>
</head>

<body>
	<!-- ========== card components start ========== -->
	<section class="card-components">
		<div class="container-fluid">
			<!-- ========== title-wrapper start ========== -->
			<div class="title-wrapper pt-30">
				<div class="row align-items-center">
					<div class="col-md-6">
						<div class="title">
							<h2>Packages</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- ========== title-wrapper end ========== -->

			<!-- ========== cards-styles start ========== -->
			<div class="cards-styles">
				<div class="row">
					<!-- Package Cards -->
					<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
						<div class="card-style-2 mb-30">
							<div class="card-content">
								<h4>99/- for 1 Month</h4>
								<p><i class="lni lni-comments"></i> Unlimited Chat's</p>
								<p><i class="lni lni-phone"></i> Unlimited Call's</p>
								<p><i class="lni lni-book"></i> Unlimited Booking's</p>
								<div class="action-buttons">
									<button class="small-btn call-btn">Pay</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
						<div class="card-style-2 mb-30">
							<div class="card-content">
								<h4>199/- for 3 Month</h4>
								<p><i class="lni lni-comments"></i> Unlimited Chat's</p>
								<p><i class="lni lni-phone"></i> Unlimited Call's</p>
								<p><i class="lni lni-book"></i> Unlimited Booking's</p>
								<div class="action-buttons">
									<button class="small-btn call-btn">Pay</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
						<div class="card-style-2 mb-30">
							<div class="card-content">
								<h4>299/- for 6 Month</h4>
								<p><i class="lni lni-comments"></i> Unlimited Chat's</p>
								<p><i class="lni lni-phone"></i> Unlimited Call's</p>
								<p><i class="lni lni-book"></i> Unlimited Booking's</p>
								<div class="action-buttons">
									<button class="small-btn call-btn">Pay</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
						<div class="card-style-2 mb-30">
							<div class="card-content">
								<h4>499/- for 12 Month</h4>
								<p><i class="lni lni-comments"></i> Unlimited Chat's</p>
								<p><i class="lni lni-phone"></i> Unlimited Call's</p>
								<p><i class="lni lni-book"></i> Unlimited Booking's</p>
								<div class="action-buttons">
									<button class="small-btn call-btn">Pay</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ========== cards-styles end ========== -->
		</div>
	</section>
	<!-- ========== card components end ========== -->

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
