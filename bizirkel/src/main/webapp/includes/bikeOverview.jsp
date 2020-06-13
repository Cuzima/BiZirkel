<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<link rel="stylesheet" href="css/bikeOverview.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- for the daterangepicker -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
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
</style>
<!-- Filter -->
<div class="row showcase-btn2">
	<div class="col col-1">
		<svg style="float: right;" class="bi bi-funnel" width="2em"
			height="2em" viewBox="0 0 16 16" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd"
				d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z" />
		</svg>
	</div>

	<div class="col col-2">
		<select class="custom-select" id="inputGroupSelect01"
			onchange="filterEbike()">
			<option selected>E-Bike / Non E-Bike...</option>
			<option value="true">E-Bike</option>
			<option value="false">Non E-Bike</option>
		</select>
	</div>

	<div class="col col-1">
		<svg style="float: right;" class="bi bi-filter" width="2em"
			height="2em" viewBox="0 0 16 16" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
				d="M6 10.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
</svg>
	</div>

	<div class="col col-2">
		<select class="custom-select" id="inputGroupSelect02"
			onchange="sortByPrice()">
			<option selected>Preis...</option>
			<option value="descending">Preis absteigend</option>
			<option value="ascending">Preis aufsteigend</option>
		</select>
	</div>
	<div class="col col-5">
		<c:choose>
			<c:when test="${not empty startdate}">
				<input type="text" name="daterange"
					value="${startdate} - ${enddate}" style="width: 100%" />
			</c:when>
			<c:otherwise>
				<input type="text" name="daterange" style="width: 100%" />
			</c:otherwise>
		</c:choose>
	</div>
</div>

<!-- Bike Overview -->


<div class="container-fluid bg-white" id="content">
	<c:forEach items="${bikesafterre}" var="bike" varStatus="loop">
		<c:choose>
			<c:when test="${(loop.index mod 2) == 0}">
				<div class="row rowAdjust">
			</c:when>
			<c:otherwise>
				<div class="row rowAdjust bg-light">
			</c:otherwise>
		</c:choose>

		<!--  <div class="row rowAdjust">  -->
		<div class=" showcase-left col col-12 col-lg-6">
			<img class="imgcartbike" src="${bike.img}" id="images">
		</div>
		<div class="showcase-right col col-12 col-lg-6">
			<div class="row">
				<div class="col col-12">
					<h2 id="bikeName">${bike.name}</h2>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col col-3 col-md-12 col-xl-3">
					<h5 id="types">Typ</h5>
				</div>
				<div class="col col-9 col-md-12 col-xl-9">
					<h5 id="text">${bike.type}</h5>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col col-3 col-xl-3">
					<h5 id="types">Beschreibung</h5>
				</div>
				<div class="col col-9 col-md-12 col-xl-9">
					<h5 id="text">${bike.description}</h5>
				</div>
			</div>
			<hr />

			<div class="row mb-4 mt-4">
				<div class="col col-3">
					<h5 id="types">${bike.price}&euro;/Tag</h5>
				</div>

				<c:choose>
					<c:when test="${bike.amount ge 1}">
						<div class="col col-2">

							<h5 style="color: <c:choose><c:when test="${bike.amount ge 5}">green</c:when><c:otherwise>orange</c:otherwise></c:choose>">${bike.amount} auf Lager</h5>
						</div>

					</c:when>
					<c:otherwise>
						<div class="col col-2">

							<h5 style="color: red">Nicht auf Lager</h5>
						</div>

					</c:otherwise>
				</c:choose>
				<div class="col col1">
					<c:if test="${bike.ebike}">
						<svg class="bi bi-battery-charging" style="margin-top: 7px"
							width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
  <path d="M14.5 9.5a1.5 1.5 0 0 0 0-3v3z" />
  <path fill-rule="evenodd"
								d="M9.585 2.568a.5.5 0 0 1 .226.58L8.677 6.832h1.99a.5.5 0 0 1 .364.843l-5.334 5.667a.5.5 0 0 1-.842-.49L5.99 9.167H4a.5.5 0 0 1-.364-.843l5.333-5.667a.5.5 0 0 1 .616-.09z" />
  <path fill-rule="evenodd"
								d="M6.332 4H2a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h2.072l.307-1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h3.391l.941-1zM4.45 6H2v4h1.313a1.5 1.5 0 0 1-.405-2.361L4.45 6zm.976 5l-.308 1H6.96l.21-.224h.001l.73-.776H6.53l-.085.09.028-.09H5.426zm1.354-1H5.733l.257-.833H4a.5.5 0 0 1-.364-.843l.793-.843L5.823 6h1.373L5.157 8.167h1.51a.5.5 0 0 1 .478.647L6.78 10zm.69 0h1.374l1.394-1.482.793-.842a.5.5 0 0 0-.364-.843h-1.99L8.933 6H7.887l-.166.54-.199.646A.5.5 0 0 0 8 7.833h1.51L7.47 10zm.725-5H9.24l.308-1H7.706l-.942 1h1.374l.085-.09-.028.09zm2.4-1l-.308 1H12a1 1 0 0 1 1 1v4a1 1 0 0 1-1 1H9.276l-.942 1H12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.405zm-.378 6H12V8.02a1.499 1.499 0 0 1-.241.341L10.217 10zM12 6.646V6h-.646a1.5 1.5 0 0 1 .646.646z" />
</svg>

					</c:if>
				</div>


				<div class="col col-1"></div>
				<a class="col col-4 btn btn-default btn-lg showcase-btn"
					onclick="fillCartCookie(${bike.id})"> <!-- href="fillCartCookie?setCk=yes&bikeid=${bike.id}&<c:if test="${not empty startdate}">date=${startdate}${enddate}</c:if>"> -->

					<svg class="bi bi-bag" width="1em" height="1em" viewBox="0 0 16 16"
						fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                    <path fill-rule="evenodd"
							d="M14 5H2v9a1 1 0 001 1h10a1 1 0 001-1V5zM1 4v10a2 2 0 002 2h10a2 2 0 002-2V4H1z"
							clip-rule="evenodd" />
	                    <path
							d="M8 1.5A2.5 2.5 0 005.5 4h-1a3.5 3.5 0 117 0h-1A2.5 2.5 0 008 1.5z" />
	                	</svg>
				</a>

				<div class="col col-1"></div>
			</div>
		</div>
</div>


</c:forEach>
</div>



<!-- Button -->
<div class="container">
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="goToCart()">Zum Warenkorb</button>
					<p></p>
					<button type="button" class="btn btn-default" data-dismiss="modal">Weiter
						reservieren</button>
					<div class="progress" style="margin-top: 10px; margin-bottom: -5px">
						<div
							class="progress-bar progress-bar-striped progress-bar-animated"
							id="progressbar" role="progressbar" aria-valuenow="100"
							aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
					</div>
				</div>

			</div>

		</div>
	</div>

</div>

<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%
	request.getSession().setAttribute("decide", "asd");
%>
<script>
	$( document ).ready(function() {
	     
	     var url = new URL(window.location.href);
	     var filterEbike = url.searchParams.get("filterEbike");
	     var sortPrice = url.searchParams.get("sortPrice");
	     if(filterEbike!=null){
	    	let element = document.getElementById('inputGroupSelect01');
		    element.value = filterEbike;
		    	
	    }
	    if(sortPrice != null){
	    	let element = document.getElementById('inputGroupSelect02');
		    element.value = sortPrice;
		    	
	    } 
		
	});


	function filterEbike(){
		window.location.href = '/bikeOverview?sortPrice='+$('#inputGroupSelect02').val()+'&filterEbike='+$('#inputGroupSelect01').val();
	}

	function sortByPrice(){
		window.location.href = '/bikeOverview?sortPrice='+$('#inputGroupSelect02').val()+'&filterEbike='+$('#inputGroupSelect01').val();
	}
	
	function fillCartCookie(bikeid){	$(function() {
		$('input[name="daterange"]').daterangepicker(
				{
					opens : 'left'
				},
				function(start, end, label) {
					var date = $('input[name="daterange"]').val();
					var startdate = date.substring(0, 10);
					var enddate = date.substring(13, 23);
					document.cookie = "date=" + start.format('YYYY/MM/DD') + '' + end.format('YYYY/MM/DD');


					window.location.href = '/bikeOverview?date='
							+ start.format('YYYY/MM/DD')
							+ end.format('YYYY/MM/DD');
				});
	});

		window.location.href = '/fillCartCookie?setCk=yes&bikeid='+bikeid;
	}
	
	$(function() {
		$('input[name="daterange"]').daterangepicker(
				{
					opens : 'left'
				},
				function(start, end, label) {
					var date = $('input[name="daterange"]').val();
					var startdate = date.substring(0, 10);
					var enddate = date.substring(13, 23);
					document.cookie = "date=" + start.format('YYYY/MM/DD') + '' + end.format('YYYY/MM/DD');


					window.location.href = '/bikeOverview?date='
							+ start.format('YYYY/MM/DD')
							+ end.format('YYYY/MM/DD');
				});
	});

	if ("${decide}" == "yes") {
		var counter = 100;
		$('#myModal').modal('show');
		check();
	}

	function check() {

		$('#progressbar').css("width", "" + counter + "%");
		counter--;
		if (counter >= 0)
			setTimeout(check, 200);
	}

	function sleep(milliseconds) {
		const date = Date.now();
		let currentDate = null;
		do {
			currentDate = Date.now();
		} while (currentDate - date < milliseconds);
	}

	function goToCart() {
		window.location.href = '/cart';
	}
</script>