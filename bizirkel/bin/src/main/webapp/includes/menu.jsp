<!-- <link rel="stylesheet" href="css/menu.css">

<nav class="navbar navbar-expand-lg navbar-light bg-faded">

	<a class="navbar-brand" href="home"> <img src="img/iconbike.png"
		height="50" class="d-inline-block align-top" alt=""
		style="margin-top: -15px">
	</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
		<ul class="navbar-nav ml-auto mt-2 mt-lg-0" id="menuBar">
			<li class="nav-item" id=header><a class="nav-link" href="rent"
				id="forLinks">Rent a Bike</a></li>
			<li class="nav-item" id=header><a class="nav-link" href="start"
				id="forLinks">Startpunkt</a></li>
			<li class="nav-item" id=header><a class="nav-link" href="about"
				id="forLinks">Über uns</a></li>
			<li class="nav-item" id=header><a class="nav-link"
				href="impressum" id="forLinks">Impressum</a></li>
		</ul>
	</div>
</nav> -->




<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
 
}


a{
color:black;
}
.topnav {
  overflow: hidden;
  color:#000;
 width:100%;
 
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: right;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;

}

/* .topnav a:hover {
  border-bottom:1px solid black;
  background-color:lightgrey;
  border-radius:5px;
} */

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 900px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 900px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}

#caption:hover{
border-bottom:1px solid black;
  background-color:lightgrey;
  border-radius:5px;
  color:black;
   text-decoration: none;
}
</style>


<div class="topnav" id="myTopnav">
 <a href="home"> <img src="img/iconbike.png"
		height="50" class="d-inline-block align-top" alt=""
		style="margin-top: -15px">
</a>
  <a href="rent" id="caption">Rent a Bike</a>
  <a href="start" id="caption">Startpunkt</a>
  <a href="about" id="caption">Über uns</a>
  <a href="impressum" id="caption">Impressum</a>
  <a href="cart">
	  <svg class="bi bi-bag" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M14 5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5zM1 4v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4H1z"/>
	  <path d="M8 1.5A2.5 2.5 0 0 0 5.5 4h-1a3.5 3.5 0 1 1 7 0h-1A2.5 2.5 0 0 0 8 1.5z"/>
	</svg>
  </a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
 <a href="home"> <img src="img/iconbike.png"
		height="50" class="d-inline-block align-top" alt=""
		style="margin-top: -15px">
</a>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar w/ text</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
    </ul>
    <span class="navbar-text">
      Navbar text with an inline element
    </span>
  </div>
</nav> -->

<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

