<!doctype html>

<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Paymemate </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <!-- Place favicon.ico in the root directory -->
        <link rel="stylesheet" href=css/vendor.css">
        <!-- Theme initialization -->
        <link rel="stylesheet" href="css/app.css">
        
         <link rel="icon" href="img/core-img/NZ_dollar.png">
    </head>
    <body>
        <div class="app blank sidebar-opened">
            <article class="content">
                <div class="error-card global">
                    <div class="error-title-block" style="color: white;">
                       <!--  <h1 class="error-title">500</h1> -->
                        <!-- <h2 class="error-sub-title"> Internal Server Error. </h2> -->
                        <h4>${errordata }</h4>
                    </div>
                    <div class="error-container">
                       <!--  <p>Why not try refreshing your page? or you can contact support</p> -->
                        <!-- <a class="btn btn-primary" href="http://paymemateserver-env-1.isvbaiv2nt.us-east-1.elasticbeanstalk.com/"> -->
                        <a class="btn btn-primary" href="${returnTo}" >
                            <i class="fa fa-angle-left"> </i> Return</a>
                    </div>
                </div>
            </article>
        </div>
        <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>
        <script>
            (function(i, s, o, g, r, a, m)
            {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function()
                {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-80463319-4', 'auto');
            ga('send', 'pageview');
        </script>
        <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>