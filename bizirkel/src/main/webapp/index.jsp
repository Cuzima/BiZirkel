<!doctype html>
<html lang="en">
<head>
<title>BiZirkel</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
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
    
</body>
</html>