<%-- 
    Document   : login
    Created on : 10/09/2020, 14:30:05
    Author     : Edgard Oliveira
--%>

<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html lang="pt-br" 
      class="wf-lato-n3-active wf-lato-n4-active wf-lato-n7-active wf-lato-n9-active wf-flaticon-n4-inactive wf-fontawesome5solid-n4-active wf-fontawesome5regular-n4-active wf-fontawesome5brands-n4-active wf-simplelineicons-n4-active wf-active">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Login</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport">
        <link rel="icon" href="assets/img/icon.ico" type="image/x-icon">

        <!-- Fonts and icons -->
        <script src="assets/login/webfont.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="assets/login/css" media="all">
        <link rel="stylesheet" href="assets/login/fonts.min.css" media="all"><script>
            WebFont.load({
                google: {"families": ["Lato:300,400,700,900"]},
                custom: {"families": ["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['../assets/css/fonts.min.css']},
                active: function () {
                    sessionStorage.fonts = true;
                }
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/login/bootstrap.min.css">
        <link rel="stylesheet" href="assets/login/atlantis.css">
        <style type="text/css"></style>
    </head>
    <body class="login">
        <div class="wrapper wrapper-login">
            <div class="container container-login animated fadeIn" style="display: block;">
                <h3 class="text-center">Identifique-se!</h3>               
                <form class="login-form" action="LoginController" method="POST">
                    <div class="form-group form-floating-label">
                        <input id="txtEmail" name="txtEmail" type="email" class="form-control input-border-bottom" required>
                        <label for="txtEmail" class="placeholder">E-mail</label>
                    </div>
                    <div class="form-group form-floating-label">
                        <input id="txtSenha" name="txtSenha" type="password" class="form-control input-border-bottom" required>
                        <label for="txtSenha" class="placeholder">Senha</label>
                        <div class="show-password">
                            <i class="icon-eye"></i>
                        </div>
                    </div>
                    <div class="form-action mb-3">
                        <button class="btn btn-primary btn-rounded btn-login" type="submit">Verificar</button>                           
                    </div>
                </form>
            </div>

        </div>
        <script src="assets/login/jquery.3.2.1.min.js"></script>
        <script src="assets/login/jquery-ui.min.js"></script>
        <script src="assets/login/popper.min.js"></script>
        <script src="assets/login/bootstrap.min.js"></script>
        <script src="assets/login/atlantis.min.js"></script>
    </body>
</html>