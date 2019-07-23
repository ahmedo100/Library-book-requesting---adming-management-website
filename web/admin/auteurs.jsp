<%@ page import="jsphandlers.ViewHandler" %>
<%@ page import="java.sql.SQLException" %>
<%
    ViewHandler vh = null;
    try {
        vh = new ViewHandler();
    } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auteur</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/admin-navbar.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/bulma.min.css">
    <link rel="stylesheet" href="assets/css/dropzone.css">
    <link rel="stylesheet" href="../assets/css/jquery.dataTables.min.css">
</head>

<body>

    <nav class="navbar navbar-light navbar-expand-md  bg-light navigation-clean-button">
        <div class="container"><a class="navbar-brand" href="index.jsp">Admin</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav mr-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="auteurs.jsp">Gestion des auteurs</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="livres.jsp">Gestion des livres</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="commandes.jsp">Gestion des commandes</a></li>
                </ul><span class="navbar-text actions"> <a class="btn btn-light action-button" role="button" href="#">Deconnexion</a></span></div>
        </div>
    </nav>
    <div>
        <div class="container">
            <div class="row" style="margin-top:0px;padding-top:12px;">
                <div class="col-md-4"></div>
                <div class="col-md-4"><button class="btn btn-outline-primary btn-block btn-lg" id="addLivreBtn"  type="button">Ajouter un auteur</button></div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </div>
    <div class="table-responsive table-bordered" style="margin:0px;margin-top:47px;margin-left:0px;margin-right:0px;padding-right:54px;padding-left:54px;">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>IdAuteur</th>
                    <th>Nom et prenom</th>
                    <th>Nombre de livres</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                            out.print(vh.getAuteursTableView());

                    } catch (ClassNotFoundException |IllegalAccessException | SQLException | InstantiationException e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
    <form method="post" action="AddActeur">
    <div class="modal">
        <div class="modal-background"></div>

        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Ajouter un auteur</p>
                <button  class="delete dismissModal" aria-label="close"></button>
            </header>
            <section class="modal-card-body">


                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">Nom</span></div><input name="nom_auteur" type="text" class="form-control" />
                            <div class="input-group-append"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">Prenom</span></div><input name="prenom_auteur" type="text" class="form-control" />
                            <div class="input-group-append"></div>
                        </div>
                    </div>



                           </section>
            <footer class="modal-card-foot">
                <button class="button is-success">Valider</button>
                <button class="button dismissModal">Annuler</button>
            </footer>

        </div>
    </div>
    </form>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/ajaxHandler.js"></script>
    <script>
    $("#addLivreBtn").click(function (e) {
        $(".modal").addClass("is-active");
    })

    $(".dismissModal").click(function () {
        $(".modal").removeClass("is-active");
    })

        $("table").DataTable();
    </script>
</body>

</html>