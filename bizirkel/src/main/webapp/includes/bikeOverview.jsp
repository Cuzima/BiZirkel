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

<!-- Filter -->
<div class="row showcase-btn2">
	<div class="col col-1">
		<svg style="float:right;" class="bi bi-funnel" width="2em" height="2em" viewBox="0 0 16 16"
			fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd"
				d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z" />
		</svg>
	</div>

	<div class="col col-2">
		<select class="custom-select" id="inputGroupSelect01">
			<option selected>E-Bike / Non E-Bike...</option>
			<option value="ebike">E-Bike</option>
			<option value="nonebike">Non E-Bike</option>
		</select>
	</div>

	<div class="col col-1">
		<svg style="float:right;" class="bi bi-filter" width="2em" height="2em" viewBox="0 0 16 16"
			fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
				d="M6 10.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
</svg>
	</div>

	<div class="col col-2">
		<select class="custom-select" id="inputGroupSelect01">
			<option selected>Preis...</option>
			<option value="ebike">Preis absteigend</option>
			<option value="nonebike">Preis aufsteigend</option>
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
	<c:forEach items="${bikesafterre}" var="bike">
		<c:choose>
			<c:when test="${(bike.id mod 2) == 0}">
				<div class="row rowAdjust bg-light">
			</c:when>
			<c:otherwise>
				<div class="row rowAdjust">
			</c:otherwise>
		</c:choose>

		<!--  <div class="row rowAdjust">  -->
		<div class=" showcase-left col col-12 col-lg-6">
			<img src="${bike.img}" id="images">
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
					<c:when test="${bike.amount ge 20}">
						<div class="col col-2">

							<h5>Auf Lager</h5>
						</div>
						<div class="col col1">
							<svg class="bi bi-battery-full" style="margin-top: 3px"
								width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
	  							<path fill-rule="evenodd"
									d="M12 5H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V6a1 1 0 0 0-1-1zM2 4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2H2z" />
	  							<path d="M2 6h10v4H2V6zm12.5 3.5a1.5 1.5 0 0 0 0-3v3z" />
							</svg>

						</div>
					</c:when>
					<c:when test="${bike.amount lt 1}">
						<div class="col col-2">

							<h5>Nicht auf Lager</h5>
						</div>
						<div class="col col1">
							<svg class="bi bi-battery" style="margin-top: 3px" width="2em"
								height="2em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
									d="M12 5H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V6a1 1 0 0 0-1-1zM2 4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2H2z" />
  <path d="M14.5 9.5a1.5 1.5 0 0 0 0-3v3z" />
</svg>

						</div>
					</c:when>
					<c:otherwise>
						<div class="col col-2">

							<h5>${bike.amount}auf Lager</h5>
						</div>
						<div class="col col1">
							<svg class="bi bi-battery-half" style="margin-top: 3px"
								width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
	  							<path fill-rule="evenodd"
									d="M12 5H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V6a1 1 0 0 0-1-1zM2 4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2H2z" />
							  	<path d="M2 6h5v4H2V6zm12.5 3.5a1.5 1.5 0 0 0 0-3v3z" />
							</svg>
						</div>
					</c:otherwise>
				</c:choose>



				<div class="col col-1"></div>
				<a class="col col-4 btn btn-default btn-lg showcase-btn"
					href="fillCartCookie?setCk=yes&bikeid=${bike.id}"> <svg
						class="bi bi-bag" width="1em" height="1em" viewBox="0 0 16 16"
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
						onclick="window.location.href='/cart'">Zum Warenkorb</button>
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
	$(function() {
		$('input[name="daterange"]').daterangepicker(
				{
					opens : 'left'
				},
				function(start, end, label) {
					console.log("A new date selection was made: "
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));

					window.location.href = '/bikeOverview?date='
							+ start.format('YYYY-MM-DD')
							+ end.format('YYYY-MM-DD');
				});
	});
	if ("${decide}" == "yes") {
		var counter = 100;
		$('#myModal').modal('show');
		check();

		/* sleep(10000);
		console.log("hide");
		 $('#myModal').modal('hide');*/
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

	/* $(function() {
		$('input[name="daterange"]').daterangepicker(
				{
					opens : 'left'
				},
				function(start, end, label) {
					console.log("A new date selection was made: "
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));
				});
	}); */
</script>