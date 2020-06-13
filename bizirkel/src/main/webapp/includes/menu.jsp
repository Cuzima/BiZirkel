<link rel="stylesheet" href="css/menu.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="topnav" id="myTopnav">

  <a href="home" class="right"> <img src="img/logo.png"
		class="d-inline-block align-top" alt="" id="logo">
  </a>
  
   <a href="rent" id="link">Rent a Bike</a>
  <a href="start" id="link">Startpunkt</a>
  <a href="about" id="link">Über uns</a>
  <a href="impressum" id="link">Impressum</a>
  <a href="cart" id="link">
	  <svg class="bi bi-bag" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M14 5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5zM1 4v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4H1z"/>
	  <path d="M8 1.5A2.5 2.5 0 0 0 5.5 4h-1a3.5 3.5 0 1 1 7 0h-1A2.5 2.5 0 0 0 8 1.5z"/>
	</svg>
  </a>
  <a href="javascript:void(0);" class="icon"  onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>


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