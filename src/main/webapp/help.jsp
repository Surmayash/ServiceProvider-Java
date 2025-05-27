<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Help & Support</title>

<!-- ========== All CSS files linkup ========= -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/lineicons.css" />
<link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
<link rel="stylesheet" href="assets/css/fullcalendar.css" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 20px auto;
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1, h2 {
    color: #333;
}

.accordion-item {
    border-bottom: 1px solid #ddd;
}

.accordion-header button {
    width: 100%;
    text-align: left;
    font-size: 18px;
    background: #e3f2fd;
    border: none;
    padding: 10px;
    cursor: pointer;
}

.accordion-content {
    display: none;
    padding: 10px;
    background: #fff;
}

.active .accordion-content {
    display: block;
}
</style>
<body>
<section class="tab-components">
    <div class="container-fluid">
        <div class="title-wrapper pt-30">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="title">
                        <h2>Help & Support</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="accordion">
                <div class="accordion-item">
                    <div class="accordion-header">
                        <button onclick="toggleAccordion(this)">How can I subscribe to a plan?</button>
                    </div>
                    <div class="accordion-content">
                        <p>You can subscribe by navigating to the 'Subscription' section in your profile and selecting a plan.</p>
                    </div>
                </div>
                <div class="accordion-item">
                    <div class="accordion-header">
                        <button onclick="toggleAccordion(this)">I forgot my password. What should I do?</button>
                    </div>
                    <div class="accordion-content">
                        <p>Click on 'Forgot Password' on the login page and follow the instructions to reset your password.</p>
                    </div>
                </div>
                <div class="accordion-item">
                    <div class="accordion-header">
                        <button onclick="toggleAccordion(this)">How can I contact support?</button>
                    </div>
                    <div class="accordion-content">
                        <p>Email: support@servicesystem.com <br> Phone: +91 8789562456</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<footer class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 order-last order-md-first">
                <div class="copyright text-center text-md-start">
                    <p class="text-sm">Service System © 2025</p>
                </div>
            </div>
        </div>
    </div>
</footer>

<script>
function toggleAccordion(element) {
    const parent = element.parentElement.parentElement;
    parent.classList.toggle("active");
}
</script>
</body>
</html>
