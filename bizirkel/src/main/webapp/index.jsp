<!doctype html>
<html lang="en">
<head>
<title>BiZirkel</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="icon" type="image/png" href="img/logoOhneSchrift.png">
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7CRoboto%7CJosefin+Sans:100,300,400,500"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7CRoboto%7CJosefin+Sans:100,300,400,500"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">



<style>
p {
	color: grey
}

h1 {
	font-family: Poppins;
	font-size: 50;
	font-weight: 500;
	line-height: 1.1;
	color: darkslategray
}

h2 {
	font-family: Poppins;
	font-size: 30;
	font-weight: 500;
	line-height: 1.1;
	color: darkslategray
}

#content {
	border-radius: 10px;
	margin-top: 20px;
	-webkit-box-shadow: 0px 0px 36px -17px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0px 0px 36px -17px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 0px 36px -17px rgba(0, 0, 0, 0.3);
	color: black;
}

#btnOnWhite {
	background-color: #f8f9fa;
}

#btnOnWhite:hover {
	background-color: #e6e6e6;
}

hr {
	margin-top: 1rem;
	margin-bottom: 1rem;
	border: 0;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
}

body {
	background-color: #f8f9fa
}

input {
	border: 1px solid #ccc;
	border-radius: 5px;
	text-align: center
}

.paddingRow {
	padding: 20px;
}
</style>

</head>
<body>


	<div class="container-fluid bg-light text-dark">
		<br>
		<div class="container">
			<div class="row">
				<jsp:include page="includes/menu.jsp"></jsp:include>
			</div>

			<div class="row" id="site">
				<div class="col col-12">

					<%
						Object pages = request.getAttribute("page");
					%>
					<%
						if (pages == "home") {
					%>
					<jsp:include page="includes/home.jsp"></jsp:include>
					<%
						} else if (pages == "rent") {
					%>
					<jsp:include page="includes/rent.jsp"></jsp:include>
					<%
						} else if (pages == "bikeOverview") {
					%>
					<jsp:include page="includes/bikeOverview.jsp"></jsp:include>
					<%
						} else if (pages == "start") {
					%>
					<jsp:include page="includes/start.jsp"></jsp:include>
					<%
						} else if (pages == "cart") {
					%>
					<jsp:include page="includes/cart.jsp"></jsp:include>
					<%
						} else if (pages == "about") {
					%>
					<jsp:include page="includes/about.jsp"></jsp:include>
					<%
						} else if (pages == "impressum") {
					%>
					<jsp:include page="includes/impressum.jsp"></jsp:include>
					<%
						} else {
					%>
					<jsp:include page="includes/home.jsp"></jsp:include>
					<%
						}
					%>
				</div>
			</div>
			<jsp:include page="includes/footer.jsp"></jsp:include>
		</div>
	</div>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script>
		window.sr = ScrollReveal();
		sr.reveal('.navbar', {
			duration : 2000,
			origin : 'bottom'
		});
		sr.reveal('.showcase-left', {
			duration : 2000,
			origin : 'left',
			distance : '40px'
		});
		sr.reveal('.showcase-right', {
			duration : 2200,
			origin : 'right',
			delay : 200,
			distance : '40px'
		});
		sr.reveal('.showcase-bottom', {
			duration : 2000,
			origin : 'bottom',
			delay : 200,
			distance : '20px'
		});
		sr.reveal('.showcase-top', {
			duration : 2000,
			origin : 'top',
			delay : 200,
			distance : '20px'
		});
		sr.reveal('.showcase-btn', {
			duration : 2000,
			delay : 1000,
			origin : 'bottom'
		});
		sr.reveal('.showcase-btn2', {
			duration : 2000,
			delay : 500,
			origin : 'bottom'
		});
		sr.reveal('.heading', {
			duration : 2000,
			origin : 'bottom'
		});
		sr.reveal('#testimonial div', {
			duration : 2000,
			origin : 'bottom'
		});
		sr.reveal('.info-left', {
			duration : 2000,
			origin : 'left',
			distance : '40px',
			viewFactor : 0.2
		});
		sr.reveal('.info-right', {
			duration : 2200,
			origin : 'right',
			delay : 200,
			distance : '40px',
			viewFactor : 0.2
		});

		$(function() {
			// Smooth Scrolling
			$('a[href*="#"]:not([href="#"])')
					.click(
							function() {
								if (location.pathname.replace(/^\//, '') == this.pathname
										.replace(/^\//, '')
										&& location.hostname == this.hostname) {
									var target = $(this.hash);
									target = target.length ? target
											: $('[name=' + this.hash.slice(1)
													+ ']');
									if (target.length) {
										$('html, body').animate({
											scrollTop : target.offset().top
										}, 1000);
										return false;
									}
								}
							});
		});
	</script>
</body>
</html>