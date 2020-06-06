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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<c:forEach items="${cartbikes}" var="cartbike">
 	Bike: ${cartbike.id} - Amount: ${cartbike.amount} - ${cartbike.name}<br>
</c:forEach>

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

<link rel="stylesheet" href="css/cart.css">

<div class="container-fluid bg-white" id="content">
	<h2 class="showcase-btn2"
		style="color: darkslategray; text-align: center">Warenkorb</h2>
	<hr />
	<div class="row">
		<div class="showcase-left col col-2 col-md-1 my-auto mz-auto">
				<div class="showcase-btn2  delete" type="button">
					<div class="delete2">
						<svg class="bi bi-x-circle text-dark" width="2em" height="2em"
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
			<img
				src="https://www.kreidler.com/de/shop/image/cache/catalog/bikes-2020/122020881-43_Dice_26er_1.0_Street_Shimano_21g_679-1320x824.png"
				id="images">
		</div>
		<div class="showcase-right col col-12  col-md-8">
			<div class="row">
				<div class="col col-12" id="bikeName">
					<h2>Canyon Mountain Bike</h2>
				</div>
				<div class="col col-12">
					<h5 class="types">Mountainbike</h5>
				</div>
			</div>
			<div class="row">
				<div class="col col-6" id="columnHeight">
					<h5 id="input1">25 &euro;</h5>
				</div>
				<div class="col col-6" id="columnHeight">
					<input id="input2" class="inputField" placeholder="Menge" onkeyup="calculate()" style="width: 100px"></input>
				</div>
			</div>
		</div>
	</div>
	<hr />
	<div class="row">
		<div class="col col-0 col-lg-4"></div>
		<div class="showcase-right col col-12 col-lg-8" id="totalAmount">
			<div class="row">
				<div class=" showcase-left col col-6">
					<h3>Gesamtpreis</h3>
				</div>
				<form name="test">
					<div class="showcase-right col col-6">
						<h3 id="totalAmountNumber">&euro;</h3> 
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Kontaktformular -->

	<hr />

	<form action="#" onsubmit="return checkForm()">
		<div class="row ">
			<div class="col showcase-left">
				<h2 style="color: darkslategray">Kontaktformular</h2>
			</div>

		</div>
		<div class="row">
			<div class=" form-group col-12 col-md-6 showcase-left">
				<input type="text" class="form-control" placeholder="Nachname *"
					name="lastName">
			</div>
			<div class=" form-group col-12 col-md-6 showcase-right">
				<input type="text" class="form-control" placeholder="Vorname *"
					name="firstName">
			</div>

			<div class="form-group col-md-6 showcase-left">
				<input type="text" class="form-control" id="inputEmail4"
					placeholder="E-Mail Adresse *" name="email">
			</div>
			<div class="form-group col-md-6 showcase-right">
				<input type="text" class="form-control" id="formGroupExampleInput"
					placeholder="Handynummer *" name="number">
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
					style="margin-bottom: 15px" type="submit"
					value="Reservierung abschicken">
			</div>
		</div>
	</form>
</div>

<script>
	function checkForm() {
		var formError = '';
		if (document.forms[1].lastName.value == "") {
			formError += "\nTragen Sie bitte einen Nachnamen ein.";
		}

		if (document.forms[1].firstName.value == "") {
			formError += "\nTragen Sie bitte einen Vornamen ein.";
		}

		if (document.forms[1].email.value == "") {
			formError += "\nTragen Sie bitte eine E-Mail Adresse ein.";
		}

		if (document.forms[1].number.value == "") {
			formError += "\nTragen Sie bitte eine Telefonnummer ein.";
		}

		if (formError.length > 0) {
			alert("Festgestellte Probleme:" + formError);
			return (false);
		}
		return true;
	}
</script>


<script>
function calculate() {
 	var input1 = (document.getElementById("input1").textContent).split(" ");
 	var input2 = parseInt(document.querySelector("#input2").value);
 	var erg=parseInt(input1[0])*input2;
 	document.getElementById("totalAmountNumber").style.opacity = 1;
 	var euro = document.getElementById("totalAmountNumber").textContent;
 	document.getElementById("totalAmountNumber").textContent=String(erg)+euro;
	
 }
</script>


