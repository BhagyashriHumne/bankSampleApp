<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Login </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" href="css/app.css">
    </head>
    <body>
	</div>
        <div class="auth">
            <div class="auth-container">
                <div class="card">
                    <header class="auth-header">
                        <h1 class="auth-title">
                         Easy Banking</h1>
                    </header>
                    <div class="auth-content">
                        <p class="text-center">LOGIN</p>
                        <form id="login-form" action="login">
                            <input type="hidden" name="timezone" id="timezone">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="email" class="form-control underlined" name="username" id="username" placeholder="Your email address" required> </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control underlined" name="password" id="password" placeholder="Your password" required> </div>
                                <p style="color:red;">${message}</p>
                            <div class="form-group">
                             
                            </div>
                            <div class = "row">
                            <hr>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-block btn-primary">Login</button>
                            </div>
                         
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>
      
               <script src="js/vendor.js"></script>
        <script src="js/app.js"></script>
         
    </body>
</html>