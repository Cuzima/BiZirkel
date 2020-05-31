
<html>
<head>
<title>BiZirkel</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>

	<div class="container-fluid bg-dark text-light">
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
</body>
</html>