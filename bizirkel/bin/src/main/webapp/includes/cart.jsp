<%-- <style>
#images {
	width: 100%;
	min-height: 100px;
	border-radius: 5px;
}

#bikeName {
	text-align: center;
}

.types {
	color:lightgrey;
	text-align: center;
	margin-top: -5pt;
}


#button {
	border: 1px solid black;
	text-align: center;
}

#button:hover {
	background: rgba(0, 0, 0, 0.1);
}

.rowAdjust {
	margin-top: 10px;
}


 #columnHeight{
	margin-top:20px;
	text-align:center;
}
 
</style>

<!-- x button hinzufügen!! 
gesamtsumme -->




<div class="container-fluid bg-white" id="content">
<div class="row rowAdjust">
	<div class="showcase-left col col-12 col-lg-4">
		<img
			src="https://www.kreidler.com/de/shop/image/cache/catalog/bikes-2020/122020881-43_Dice_26er_1.0_Street_Shimano_21g_679-1320x824.png"
			id="images">
	</div>
	<div class="showcase-right col col-12 col-lg-8">
		<div class="row">
			<div class="col col-10" id="bikeName">
				<h2>Canyon Mountain Bike</h2>
			</div>
			<div class="col col-2">
				<svg class="bi bi-x-circle" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>
  <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>
</svg>
			</div>
			<div class="col col-10" >
				<h5 class="types">Mountainbike</h5>
			</div>
		</div>
		
		<div class="row">
			<div class="col col-6" id="columnHeight">
				<h5>25&euro; / Tag</h5>
			</div>
			<div class="col col-6" id="columnHeight">
				<input id ="inputField" placeholder="Menge"></input>
			</div>
		</div>
	</div>
</div>
</div>
 --%>

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

<div class="container-fluid bg-white" id="content">
	<h2 class="showcase-btn2"
		style="color: darkslategray; text-align: center">Warenkorb</h2>
	<hr />
	<c:forEach items="${cartbikes}" var="cartbike">
		<div class="row bikeforcookie">
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
				<div class="row ">
					<div class="col col-12" id="bikeName">
						<h2>${cartbike.name}</h2>
					</div>
					<div class="col col-12">
						<h5 class="types">${cartbike.type}</h5>
					</div>
				</div>
				<div class="row priceandamount">
					<div class="col col-6" id="columnHeight">
						<h5 id="input1" class="price" name="price">${cartbike.price}&euro;</h5>
					</div>
					<div class="col col-6" id="columnHeight">
						<input id="input2" class="inputField inputamount"
							value="${cartbike.amount}" placeholder="Menge"
							onkeyup="calculate()" style="width: 100px" name="amount"></input>
					</div>
				</div>
			</div>
		</div>

	</c:forEach>
	<hr />
	<div class="row">
		<div class="col col-12 col-lg-6" id="date">
			<div class="row showcase-left" >
				<div class="col col-12">
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

		</div>
		<div class="showcase-right col col-12 col-lg-6" id="totalAmount">
			<div class="row">
				<div class=" showcase-right col col-6">
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

	<form onsubmit="checkForm()" method="post">
		<div class="row ">
			<div class="col showcase-left">
				<h2 style="color: darkslategray">Kontaktformular</h2>
			</div>

		</div>
		<div class="row">
		<div class="form-group col-12 showcase-btn2">
			<c:choose>
				<c:when test="${not empty startdate}">
					<input type="text" class="form-control" name="daterange"
						value="${startdate} - ${enddate}" style="width: 100%" />
				</c:when>
				<c:otherwise>
					<input type="text" class="form-control" name="daterange" style="width: 100%" />
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
			<div class="form-group col-12 showcase-btn2">
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
					style="margin-bottom: 15px" type="submit"
					value="Reservierung abschicken" name="totalAmount">
			</div>
		</div>
	</form>
</div>
<script>
	function checkForm() {
		
		console.log("In check Form angekommen");
		var formError = '';
		
		console.log($("#lastName").val());
		
		if ($("#lastName").val() == "") {
			formError += "\nTragen Sie bitte einen Nachnamen ein.";
		}

		if ($("#firstName").val() == "") {
			formError += "\nTragen Sie bitte einen Vornamen ein.";
		}

		if ($("#inputEmail4").val()== "") {
			formError += "\nTragen Sie bitte eine E-Mail Adresse ein.";
		}

		if ($("#formGroupExampleInput").val() == "") {
			formError += "\nTragen Sie bitte eine Telefonnummer ein.";
		}

		if (formError.length > 0) {
			alert("Festgestellte Probleme:" + formError);
		}else{
			
			console.log("In else  angekommen");
			var totalPrice = $("#totalAmountNumber").text();
			totalPrice=totalPrice.substring(0, totalPrice.length -1);
			console.log(totalPrice);
			
			var name="";
			var amount="";
			var price="";
			
		 	$(".namePriceAmount").each(function(index, element) {
		 		var uniquePrice = $(this).find(".price").text();
		 		
				name+= $(this).find("#bikeName").text()+';;';
				amount += $(this).find(".inputamount").val()+';;';
				price += parseFloat(uniquePrice.substring(0, uniquePrice.length - 1))+';;';
				
				console.log('Name: ' +name);
				console.log('amount : '+ amount); 
				console.log('Preis: '+ price);
				
			}); 
		 	
			alert('Reservierung wurde erfolgreich ausgef�hrt. Es wurde Ihnen eine Mail gesendet, in dieser Sie weitere Informationen erhalten.');
		 	window.location.href = '/mail?name='+name
					+'&amount='+amount
					+'&price='+price
					+'&firstName='+$("#firstName").val()
					+'&lastName='+$("#lastName").val()
					+'&email='+$("#inputEmail4").val()
					+'&number='+$("#formGroupExampleInput").val()
					+'&note='+$("#comment").val()
					+'&totalPrice='+totalPrice;
			//daterange hinzuf�gen 
		}
		
		
		
		
	}
</script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<script>
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

	

			});
});
	function calculate() {
		/*  	var input1 = (document.getElementById("input1").textContent).split(" ");
		 var input2 = parseInt(document.querySelector("#input2").value);
		 var erg=parseInt(input1[0])*input2;
		 document.getElementById("totalAmountNumber").style.opacity = 1;
		 var euro = document.getElementById("totalAmountNumber").textContent;
		 document.getElementById("totalAmountNumber").textContent=String(erg)+euro; */

		var totalprice = 0;
		var totalamount = 0;
		$(".priceandamount").each(function(index, element) {
			var amount = $(this).find(".inputamount").val();
			var price = $(this).find(".price").text();

			amount = parseInt(amount);
			price = parseFloat(price.substring(0, price.length - 1));

			if (Number.isNaN(amount))
				amount = 0;
			totalprice += price * amount;
		});
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