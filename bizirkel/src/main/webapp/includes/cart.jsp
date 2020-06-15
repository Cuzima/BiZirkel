<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<link rel="stylesheet" href="css/cart.css">

<!-- for the daterangepicker -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header">
				<h2>Artikel nicht verf&uuml;gbar</h2>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<button type="button" class="btn btn-default" data-dismiss="modal">Okay</button>
			</div>

		</div>

	</div>
</div>
<div class="modal fade" id="reservationModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h2>Reservierung erfolgreich</h2>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p>Reservierung wurde erfolgreich ausgef&uuml;hrt. Es wurde Ihnen eine Mail gesendet, in dieser Sie weitere Informationen erhalten.</p>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="formModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h2>Festgestellte Probleme:</h2>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p id="formProblems"></p>
			</div>
		</div>
	</div>
</div>

<input id="avail" type="hidden" value="${avail}" />
<input id="daysbetween" type="hidden" value="${daysbetween}" />
<%
	request.getSession().setAttribute("avail", "");
%>
<div class="container-fluid bg-white" id="content">
	<h1 class="showcase-btn2"
		style="color: darkslategray; text-align: center">
		<img src="img/logoOhneSchrift.png" height="60px"></img>
		&nbsp;Warenkorb
	</h1>
	<hr />

	<c:if test="${empty cartbikes}">
		<h2 class="showcase-btn" style="text-align: center">Warenkorb ist
			leer!</h2>
	</c:if>
	<c:forEach items="${cartbikes}" var="cartbike" varStatus="loop">
		<c:choose>
			<c:when test="${(loop.index mod 2) == 0}">
				<div class="row bikeforcookie rowAdjust">
			</c:when>
			<c:otherwise>
				<div class="row bikeforcookie rowAdjust bg-light">
			</c:otherwise>
		</c:choose>
		<input class="bikeid" type="hidden" value="${cartbike.id}" />
		<div class="showcase-left col col-2 col-md-1 my-auto mz-auto">
			<div class="showcase-btn2  delete" type="button">
				<div class="delete2">
					<svg onClick="deleteCartbike(${cartbike.id})"
						class="bi bi-x-circle text-dark" width="2em" height="2em"
						viewBox="0 0 16 16" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
		  					<path fill-rule="evenodd"
							d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
		  					<path fill-rule="evenodd"
							d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z" />
		  					<path fill-rule="evenodd"
							d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z" />
						</svg>
				</div>
			</div>
		</div>
		<div class="showcase-left col col-10 col-md-3">
			<img src="${cartbike.img}" id="images">
		</div>
		<div class="namePriceAmount showcase-right col col-12  col-md-8">
			<div class="row">
				<div class="col col-12" id="bikeName">
					<h2>${cartbike.name}</h2>
				</div>
				<div class="col col-12">
					<h5 class="types">${cartbike.type}</h5>
				</div>
			</div>
			<div class="row priceandamount">
				<div class="col col-4" id="columnHeight">
					<h5 id="input1" class="price">${cartbike.price}&euro;/Tag</h5>
				</div>
				<div class="col col-4" id="columnHeight">
					<input class="availableBikes" type="hidden"
						value="${bikesafterre[cartbike.id-1].amount}" />

					<c:choose>
						<c:when test="${bikesafterre[cartbike.id-1].amount ge 1}">
							<h5 id="input3" class="amount"
								style="color: <c:choose><c:when test="${bikesafterre[cartbike.id-1].amount ge 5}">green</c:when><c:otherwise>orange</c:otherwise></c:choose>">${bikesafterre[cartbike.id-1].amount}
								auf Lager</h5>

						</c:when>
						<c:otherwise>
							<h5 style="color: red">Nicht auf Lager</h5>

						</c:otherwise>
					</c:choose>



					
				</div>
				<div class="col col-4" id="columnHeight">
					<input id="amount${cartbike.id}" class="inputField inputamount"
						value="${cartbike.amount}" placeholder="Menge"
						onkeyup="calculate()" style="width: 100px"></input>
				</div>
			</div>
		</div>
</div>

</c:forEach>
<hr />
<div class="row">
	<div class="col col-0 col-lg-6"></div>
	<div class="showcase-right col col-12 col-lg-6" id="totalAmount">
		<div class="row">
			<div class=" showcase-left col col-6">
				<h3>Gesamtpreis</h3>
			</div>
			<form name="test">
				<div class="showcase-right col col-6">
					<h3 id="totalAmountNumber"></h3>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Kontaktformular -->

<hr />

<form onsubmit="checkForm()">
	<div class="row ">
		<div class="col showcase-left">
			<h2 style="color: darkslategray">Kontaktformular</h2>
		</div>

	</div>
	<div class="row">
		<div class="form-group col-12 showcase-btn2">
			<c:choose>
				<c:when test="${not empty startdate}">
					<input type="text" class="form-control" name="daterange" id="date"
						value="${startdate} - ${enddate}" style="width: 100%" />
				</c:when>
				<c:otherwise>
					<input type="text" class="form-control" name="daterange"
						style="width: 100%" />
				</c:otherwise>
			</c:choose>
		</div>
		<div class=" form-group col-12 col-md-6 showcase-left">
			<input type="text" class="form-control" placeholder="Nachname *"
				id="lastName">
		</div>
		<div class=" form-group col-12 col-md-6 showcase-right">
			<input type="text" class="form-control" placeholder="Vorname *"
				id="firstName">
		</div>

		<div class="form-group col-md-6 showcase-left">
			<input type="text" class="form-control" id="inputEmail4"
				placeholder="E-Mail Adresse *" name="email">
		</div>
		<div class="form-group col-md-6 showcase-right">
			<input type="text" class="form-control" id="formGroupExampleInput"
				placeholder="Handynummer *">
		</div>

		<div class="form-group col-12 showcase-left">
			<textarea class="form-control" rows="5" id="comment"
				placeholder="Was wollen Sie uns noch mitteilen?"></textarea>
		</div>
	</div>
	<div class="row ">
		<div class="col showcase-left">
			<h6 style="color: #ccc; margin-top: -5pt;">* = Pflichtfelder</h6>
		</div>
	</div>
	<div class="row">
		<div class="col" style="text-align: center">
			<input class="btn btn-default btn-lg showcase-btn2" id="btnOnWhite"
				style="margin-bottom: 15px" onclick="checkForm()"
				value="Reservierung abschicken">
		</div>
	</div>
</form>

<script>
function checkForm() {
	
	console.log("In check Form angekommen");
	var formError = '';
	
	console.log($("#lastName").val());
	
	if ($("#lastName").val() == '') {
		formError += "\nTragen Sie bitte einen Nachnamen ein.";
	}

	if ($("#firstName").val() == '') {
		formError += "\nTragen Sie bitte einen Vornamen ein.";
	}

	if ($("#inputEmail4").val()== '') {
		formError += "\nTragen Sie bitte eine E-Mail Adresse ein.";
	}

	if ($("#formGroupExampleInput").val() == '') {
		formError += "\nTragen Sie bitte eine Telefonnummer ein.";
	}

	if (formError.length > 0) {
		console.log("formFehler");
		$("#formProblems").text(formError);
		console.log($("#formProblems").text());
		console.log($("#formProblems").val());
 		$('#formModal').modal('show');
		//alert("Festgestellte Probleme:" + formError);
	}else{
		
		var totalPrice = $("#totalAmountNumber").text();
		totalPrice=totalPrice.substring(0, totalPrice.length -1);

		var name="";
		var amount="";
		var price="";
		var bikeId="";
		
	 	$(".bikeforcookie").each(function(index, element) {
	 		var uniquePrice = $(this).find(".price").text();
	 		
			name+= $(this).find("#bikeName").text()+';;';
			amount += $(this).find(".inputamount").val()+';;';
			price += parseFloat(uniquePrice.substring(0, uniquePrice.length - 1))+';;';
			bikeId += $(this).find(".bikeid").val() + ";;";			
		}); 	 	
	 	
	 	var boolProceed = 'true';
	 	$(".bikeforcookie").each(function(index, element) {
	 		var inputamount = parseInt($(this).find(".inputamount").val());
			var maxamount = parseInt($(this).find(".availableBikes").val());
			if(inputamount > maxamount){
				boolProceed = 'false';	
			}
	 	});
	 
	 	if(boolProceed == 'true'){
	 		$('#reservationModal').modal('show');
	 		window.location.href = '/mail?name='+name
            +'&amount='+amount
            +'&price='+price
            +'&firstName='+$("#firstName").val()
            +'&lastName='+$("#lastName").val()
            +'&email='+$("#inputEmail4").val()
            +'&number='+$("#formGroupExampleInput").val()
            +'&note='+$("#comment").val()
            +'&totalPrice='+totalPrice
            +'&bikeId='+bikeId
            +'&date='+ $("#date").val();
	 	}else{
	 		$('#myModal').modal('show');
	 	}
	 	
		
		//window.location.replace('mail');
		
		//daterange hinzufügen 
	}
	
	
	
	
}

$(function() {
	$('input[name="daterange"]').daterangepicker(
			{
				opens : 'left'
			},
			function(start, end, label) {
				var date = $('input[name="daterange"]').val()
				var startdate = date.substring(0, 10);
				var enddate = date.substring(13, 23);
				document.cookie = "date=" + start.format('YYYY/MM/DD') + '' + end.format('YYYY/MM/DD');
				console.log("A new date selection was made: "
						+ start.format('YYYY-MM-DD') + ' to '
						+ end.format('YYYY-MM-DD'));
				location.reload();

			});
});
	function calculate() {
		var totalprice = 0;
		var totalamount = 0;
		$(".bikeforcookie").each(function(index, element) {
			var amount = $(this).find(".inputamount").val();
			var price = $(this).find(".price").text();

			amount = parseInt(amount);
			price = parseFloat(price.substring(0, price.length - 1));

			if (Number.isNaN(amount)) amount = 0;
			totalprice += price * amount;
			
			var bikeid = $(this).find(".bikeid").val();
			document.cookie = bikeid+"=x";
			document.cookie = bikeid+"="+amount;

			var inputamount = parseInt($(this).find(".inputamount").val());
			var maxamount = parseInt($(this).find(".availableBikes").val());
			if(inputamount > maxamount){
				$(this).find(".inputamount").css('background-color', '#ff000029');
				$(this).find(".inputamount").css('border-color', 'black');
			}else{
				$(this).find(".inputamount").css('background-color', 'white');
				$(this).find(".inputamount").css('border-color', '#ccc');
			}
			

		});
		totalprice *= parseInt($('#daysbetween').val());
		$('#totalAmountNumber').text(totalprice + "\u20ac");
				
	}
	
	function deleteCartbike(bikeid) {
		document.cookie = bikeid+"=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
		location.reload();
	}

	$(document).ready(function() {
        calculate();
        console.log(getCookie("date"));
    });

    function getCookie(cname) {
          var name = cname + "=";
          var decodedCookie = decodeURIComponent(document.cookie);
          var ca = decodedCookie.split(';');
          for(var i = 0; i <ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
              c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
              return c.substring(name.length, c.length);
            }
          }
          return "";
        }
</script>