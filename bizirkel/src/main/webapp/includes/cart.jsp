<style>
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

#inputField{
    border: 1px solid #ccc;
    border-radius: 5px;
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
