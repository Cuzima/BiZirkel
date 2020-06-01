<link rel="stylesheet" href="css/about.css">

    <div class="shadow mb-3">
        <div class="grid-image">
            <img src="img/aboutUsPic.png" class="aboutUsPic"></img>
            <div id="caption">
                <h2 class='title'>BiZirkel - &Uuml;ber uns</h2>
            </div>
        </div>
    </div>
    


    <div class="shadow mb-3">
        <div class ="row bg-dark" id="rowConfig">
            <div class="col col-12 col-lg-3 bg-dark" id="headingAboutUs">Unser Motto</div>  
                <div class="col col-12 col-lg-9 bg-dark"><blockquote class="blockquote" id="quoteAndHistory">
                    <p class="mb-0">Radfahren kommt dem Flug der V&ouml;gel am n&auml;chsten.</p>
                    <footer class="blockquote-footer">Louis J. Halle, 1910 - 1998</footer>
                    </blockquote>
                    <br>
            </div>
        </div>
    </div>
    

    <div class="shadow mb-3">
        <div class ="row bg-dark" id="rowConfig">
            <div class="col col-12 col-lg-3" id="headingAboutUs">Unsere Geschichte</div>
            <div class="col col-12 col-lg-9" id="quoteAndHistory">
                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aperiam error voluptas repellendus? Iusto incidunt ipsam assumenda cumque rem odio ex sapiente quod officia, hic enim illum veniam totam quo consectetur!
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam aspernatur voluptate doloremque laborum, repudiandae non. Totam voluptatibus dicta enim illum dolorem accusamus provident. Deleniti adipisci atque eius eveniet, ab corporis?
            </div>
                
        </div>
    </div>



    <canvas id="canvas" width="800" height="200"></canvas>

    <script>
        var img = new Image();

// User Variables - customize these to change the image being scrolled, its
// direction, and the speed.

img.src = 'img/panorama.png';
var CanvasXSize = 800;
var CanvasYSize = 200;
var speed = 30; // lower is faster
var scale = 1.05;
var y = -4.5; // vertical offset

// Main program

var dx = 0.75;
var imgW;
var imgH;
var x = 0;
var clearX;
var clearY;
var ctx;

img.onload = function() {
    imgW = img.width * scale;
    imgH = img.height * scale;
    
    if (imgW > CanvasXSize) {
        // image larger than canvas
        x = CanvasXSize - imgW;
    }
    if (imgW > CanvasXSize) {
        // image width larger than canvas
        clearX = imgW;
    } else {
        clearX = CanvasXSize;
    }
    if (imgH > CanvasYSize) {
        // image height larger than canvas
        clearY = imgH;
    } else {
        clearY = CanvasYSize;
    }
    
    // get canvas context
    ctx = document.getElementById('canvas').getContext('2d');
 
    // set refresh rate
    return setInterval(draw, speed);
}

function draw() {
    ctx.clearRect(0, 0, clearX, clearY); // clear the canvas
    
    // if image is <= Canvas Size
    if (imgW <= CanvasXSize) {
        // reset, start from beginning
        if (x > CanvasXSize) {
            x = -imgW + x;
        }
        // draw additional image1
        if (x > 0) {
            ctx.drawImage(img, -imgW + x, y, imgW, imgH);
        }
        // draw additional image2
        if (x - imgW > 0) {
            ctx.drawImage(img, -imgW * 2 + x, y, imgW, imgH);
        }
    }

    // image is > Canvas Size
    else {
        // reset, start from beginning
        if (x > (CanvasXSize)) {
            x = CanvasXSize - imgW;
        }
        // draw aditional image
        if (x > (CanvasXSize-imgW)) {
            ctx.drawImage(img, x - imgW + 1, y, imgW, imgH);
        }
    }
    // draw image
    ctx.drawImage(img, x, y,imgW, imgH);
    // amount to move
    x += dx;
}


    </script>



    
    



