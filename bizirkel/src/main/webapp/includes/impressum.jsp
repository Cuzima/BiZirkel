<style>


    .impressum{
        margin-right:auto;
        margin-left:auto;
        margin-top: 50px;
        font-size:14pt;
        text-align:center;
        color:white;
    }

    .heading{
        font-weight:bold;
        font-size:16pt;
    }

    /* Das darunter ist eigentlich von about.php */

    .aboutUsPic{
        width:100%;
        border-radius:2pt;
    }


    .grid-image {
        
        margin: 0;
        padding: 0;
        position: relative;
        margin-top:12pt;
    }


    .grid-image #caption {
        position: absolute;
        top: 0em;
        bottom: 0em;
        right: 0em;
        left: 0em;
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 1;
    }

    .grid-image .title {
        text-transform: uppercase;
        color: #F0FFF0;
        line-height: 1;
        text-align: center;
        background: rgba(0, 0, 0, 0.6);
        padding:3px;
        border-radius:5px;
    }


    #headingAboutUs{
        margin-top:10px;
        margin-bottom:10px;
        text-align:center;
        font-size:25pt;
        text-transform:uppercase;
        height:100%;
        color:white;
        
    }


    #rowConfig{
        margin-left:0pt;
        margin-right:0pt;
        border-radius:2pt;
    }

    #border{
        border-radius:2pt;
    }


</style>

    <div class="shadow mb-3">
        <div class="grid-image">
            <img src="img/aboutUsPic.png" class="aboutUsPic"></img>
            <div id="caption">
                <h2 class='title'>Impressum</h2>
            </div>
        </div>
    </div>
    


    <div class="shadow mb-3">
        <div class ="row bg-dark" id="rowConfig">
            <div class="col col-12 bg-dark" id="border">
                <div class="impressum">
                    <p class="heading">Anbieter:<br></p>
                    <p>Max Mustermann<br></p>
                    <p>Musterstraße 1<br></p> 
                    <p>80999 München</p>
                <p> </p>
                <p class="heading">Kontakt:<br></p>
                    <p>Telefon: 089/1234567-8<br></p>
                    <p>Telefax: 089/1234567-9<br></p> 
                    <p>E-Mail: mail@mustermann.de</p>
                    <p>Website: www.mustermann.de</p>
                <p> </p>
                <p class="heading">Bei redaktionellen Inhalten:</p>
                <p>Verantwortlich nach § 55 Abs.2 RStV<br></p>
                    <p>Moritz Schreiberling<br> </p> 
                    <p>Musterstraße 2<br> </p> 
                    <p>80999 München</p>
                </div>
            </div>  
        </div>
    </div>
    
