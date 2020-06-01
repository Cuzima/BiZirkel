<!doctype html>
<html lang="en">
<head>
<title>BiZirkel</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7CRoboto%7CJosefin+Sans:100,300,400,500"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7CRoboto%7CJosefin+Sans:100,300,400,500"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
</head>
<body>
<style>
p {
	color: grey
}

h1{
	font-family: Poppins;
	font-size: 50;
	font-weight: 500;
	line-height: 1.1;
	color: darkslategray
}

h2{
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
#btnOnWhite{
	background-color: #f8f9fa;
}
 
#btnOnWhite:hover{
	background-color: #e6e6e6;
}
</style>

	<div class="container-fluid bg-light text-dark">
		<br>
		<div class="container">
			<div class="row">
				<jsp:include page="includes/menu.jsp"></jsp:include>
			</div>

			<div class="row" id="site">
				<div class="col col-12">				
			
				<%Object pages = request.getAttribute("page");%> 
				<%if(pages == "home"){%>
					<jsp:include page="includes/home.jsp"></jsp:include>
				<%}else if(pages =="rent"){%>
					<jsp:include page="includes/rent.jsp"></jsp:include>
				<%}else if(pages =="start"){%>
					<jsp:include page="includes/start.jsp"></jsp:include>
				<%}else if(pages =="about"){%>
					<jsp:include page="includes/about.jsp"></jsp:include>
				<%}else if(pages =="impressum"){%>
					<jsp:include page="includes/impressum.jsp"></jsp:include>
				<%}else{%>
					<jsp:include page="includes/home.jsp"></jsp:include>
				<%}%>
				</div>
			</div>
			<jsp:include page="includes/footer.jsp"></jsp:include>
		</div>
	</div>
	
	
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	sr.reveal('.showcase-btn', {
		duration : 2000,
		delay : 1000,
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
</script>

<script>
	$(function() {
		// Smooth Scrolling
		$('a[href*="#"]:not([href="#"])').click(
				function() {
					if (location.pathname.replace(/^\//, '') == this.pathname
							.replace(/^\//, '')
							&& location.hostname == this.hostname) {
						var target = $(this.hash);
						target = target.length ? target : $('[name='
								+ this.hash.slice(1) + ']');
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