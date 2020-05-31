
<style>
    .weatherAPI{
        border:1px solid;
        border-radius:10px;
        border-color:#00537f;
        text-align:right; margin:0px auto
    }

</style>

<footer class ="footer mt-auto py-3">
    <div class="container">
        <div class = "row">
            <div class="col col-12 col-lg-8">
                <span class="text-muted">Designed and built with all the love in the world by Meikel Vielhauer and Jessica Binder.<br>
                Currently v1.0.0. </span> 
            </div>
            <div class="col col-12 col-lg-4" id=wheaterGrid>
                <iframe class="weatherAPI" marginheight='0' marginwidth='0' scrolling='no' width='300' height='255' name='FC1' src='https://api.wetteronline.de/wetterwidget?gid=10734&modeid=FC1&seourl=heidelberg&locationname=Heidelberg&lang=de'></iframe>
            </div>
        </div>
    </div>
</footer>