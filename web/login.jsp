<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Untitled</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body>
    <div class="login-clean" id ="loginPan">
        <form method="post" id="loginForm">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-book" style="color:rgb(44,5,157);"></i></div>
            <div class="form-group"><input class="form-control" type="text" name="username" required="" placeholder="Username" autofocus="" ></div>
            <div class="form-group"><input class="form-control" type="password" name="pass" required="" placeholder="Mot de passe"></div>
            <div class="form-group"><button id="loginButton" class="btn btn-primary btn-block" type="button" style="background-color:rgb(44,5,157);">Connexion</button></div><a href="#" class="forgot">Email ou mot de passe oublié ?</a></form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/loginScript.js"></script>
</body>

</html>