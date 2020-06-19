
<link rel="stylesheet" href="css/menu.css">

<div class="row" style="width: 100%" id=small>
	<div class="col col-4 col-md-2 icon" type="button" href="home">
		<a href="home" class="menuStyle"> <img src="img/logo.png"
			class="d-inline-block align-top" alt="" id="logo">
		</a>
	</div>
	<div class="col col-6 col-md-1"></div>
	<div class="col col-2 col-md-0 icon">
		<button onclick="clickMe()" id="menuButton">
            <svg width="2em" height="2em"
                viewBox="0 0 16 16" fill="darkslategray">
             <rect x ="1" y ="2" width ="15" height ="2" rx ="20" ry ="20" />
               <rect x ="1" y ="7" width ="15" height ="2" rx ="20" ry ="20" />
               <rect x ="1" y ="12" width ="15" height ="2" rx ="20" ry ="20" />
        </svg> 
        </button>
	</div>
	<div id="hideTopPlaceSmall">
		<div class="col col-12 col-md-2 topPlaceSmall" onclick="location.href='/rent'">
			<a href="rent" class="menuStyle">
				<div class="link">Rent a Bike</div>
			</a>
		</div>
		<div class="col col-12 col-md-2 topPlaceSmall" onclick="location.href='/start'">
			<a href="start" class="menuStyle">
				<div class="link">Startpunkt</div>
			</a>
		</div>
		<div class="col col-12 col-md-2 topPlaceSmall" onclick="location.href='/about'">
			<a href="about" class="menuStyle">
				<div class="link">Über uns</div>
			</a>
		</div>
		<div class="col col-12 col-md-2 topPlaceSmall" onclick="location.href='/impressum'">
			<a href="impressum" class="menuStyle">
				<div class="link">Impressum</div>
			</a>
		</div>
		<div class="col col-12 col-md-1 topPlaceSmall cartButton" onclick="location.href='/cart'">
			<a href="cart" class="menuStyle"> <svg
					class="bi bi-bag cartHover" width="1em" height="1em"
					viewBox="0 0 16 16" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
		  		<path fill-rule="evenodd"
						d="M14 5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5zM1 4v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4H1z" />
		  		<path
						d="M8 1.5A2.5 2.5 0 0 0 5.5 4h-1a3.5 3.5 0 1 1 7 0h-1A2.5 2.5 0 0 0 8 1.5z" />
		  </svg>
			</a>
		</div>
	</div>
</div>

<div class="row" style="width: 100%" id="large">
	<div class="col col-4 col-md-2 icon" type="button" href="home"
		style="padding-top: 0px">
		<a href="home" class="menuStyle"> <img src="img/logo.png"
			class="d-inline-block align-top" alt="" id="logo">
		</a>
	</div>
	<div class="col col-6 col-md-1"></div>
	<div class="col col-2 col-md-0 icon">
		<!-- <button onclick="clickMe()">Click me</button> -->
		<button onclick="clickMe()">
			<svg class="bi bi-justify" width="2em" height="2em"
				viewBox="0 0 16 16" fill="darkslategray"
				xmlns="http://www.w3.org/2000/svg">
		 	<path fill-rule="evenodd"
					d="M2 12.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
		</svg>
		</button>
	</div>
	<div class="col col-12 col-md-2 topPlace" onclick="location.href='/rent'">
		<a href="rent" class="menuStyle">
			<div class="link">Rent a Bike</div>
		</a>
	</div>
	<div class="col col-12 col-md-2 topPlace" onclick="location.href='/start'">
		<a href="start" class="menuStyle">
			<div class="link">Startpunkt</div>
		</a>
	</div>
	<div class="col col-12 col-md-2 topPlace" onclick="location.href='/about'">
		<a href="about" class="menuStyle">
			<div class="link">Über uns</div>
		</a>
	</div>
	<div class="col col-12 col-md-2 topPlace" onclick="location.href='/impressum'">
		<a href="impressum" class="menuStyle">
			<div class="link">Impressum</div>
		</a>
	</div>
	<div class="col col-12 col-md-1 topPlace cartButton" onclick="location.href='/cart'">
		<a href="cart" class="menuStyle"> <svg class="bi bi-bag cartHover"
				width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
		  		<path fill-rule="evenodd"
					d="M14 5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5zM1 4v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4H1z" />
		  		<path
					d="M8 1.5A2.5 2.5 0 0 0 5.5 4h-1a3.5 3.5 0 1 1 7 0h-1A2.5 2.5 0 0 0 8 1.5z" />
		  </svg>
		</a>
	</div>

</div>


<script>
	function clickMe() {
		console.log("In check Form angekommen");
		if (document.getElementById('hideTopPlaceSmall').style.display == "block") {
			document.getElementById("hideTopPlaceSmall").style.display = "none";
		} else {
			document.getElementById("hideTopPlaceSmall").style.display = "block";
		}
	}
</script>
