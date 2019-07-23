<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ page import="Engine.Auteur" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Auteur auteur = null;
    try {
        auteur = new Auteur();
    } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
        e.printStackTrace();
    }

    try {
        assert auteur != null;
        ArrayList<HashMap<String,String>> auteurs = auteur.getAllAuteurs();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Untitled</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/admin-navbar.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/bulma.min.css">
    <link rel="stylesheet" href="assets/css/dropzone.css">
    <link rel="stylesheet" href="../assets/css/jquery.dataTables.min.css">

</head>

<body>

<c:set var="categorie">Historique,Romantique,Novel,Documentaire,Bande dessine,Droit,Litterature</c:set>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/tp-bib"
                   user="root"  password=""/>


<sql:query var="rs" dataSource="${db}">
    SELECT * from auteur ;
</sql:query>

<sql:query var="livresRs" dataSource="${db}">
    SELECT issn_livre ,titre_livre,nom_auteur,prenom_auteur from livre,auteur WHERE
            auteur.id_auteur = livre.id_auteur;
</sql:query>

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
                <div class="col-md-4"><button class="btn btn-outline-primary btn-block btn-lg" id="addLivreBtn"  type="button">Ajouter un livre</button></div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </div>
    <div class="table-responsive table-bordered" style="margin:0px;margin-top:47px;margin-left:0px;margin-right:0px;padding-right:54px;padding-left:54px;">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ISSN</th>
                    <th>Titre</th>
                    <th>Auteur</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
        <c:forEach items="${livresRs.rows}" var="livre">
            <tr>
            <td>${livre.issn_livre}</td>
            <td>${livre.titre_livre}</td>
            <td>${livre.nom_auteur} ${livre.prenom_auteur}</td>
            <td><a class="btn btn-outline-danger" href="<c:url value="/admin/RemoveLivre?id=${livre.issn_livre}"/>" >Supprimer</a></td>
                </tr>
                </c:forEach>

            </tbody>
        </table>
    </div>
<form method="post"  action="AddLivre" enctype="multipart/form-data">

    <div class="modal">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Ajouter un livre</p>
                <button  class="delete dismissModal" aria-label="close"></button>
            </header>
            <section class="modal-card-body">
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">ISSN</span></div><input name="issn_livre" type="text" class="form-control" />
                            <div class="input-group-append"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">Titre</span></div><input name="titre_livre" type="text" class="form-control" />
                            <div class="input-group-append"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Auteur</label>
                            </div>
                            <select class="custom-select" id="inputGroupSelect01" name="id_auteur">
                                <option selected disabled>Choisir un auteur</option>
                                <c:forEach items="${rs.rows}" var="auteur">
                                <option value="${auteur.id_auteur}">${auteur.nom_auteur} ${auteur.prenom_auteur}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Catégories</label>
                        </div>
                        <select multiple class="custom-select" id="categorie" name="nom_categorie">
                            <option selected disabled>Choisir des categories</option>
                            <c:forEach items="${categorie}" var="cat">
                                <option value="${cat}">${cat}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                    <div class="form-group">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend"><label class="input-group-text" for="inputGroupSelect01">Quantité</label></div><input class="form-control" type="number" name="qte_livre" /></div>
                    </div>
                    <div class="form-group">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend"><label class="input-group-text" for="inputGroupSelect01">Nombre page</label></div><input class="form-control" type="number" name="nbrPage_livre" /></div>
                    </div>
                    <div class="form-group">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend"><label class="input-group-text" for="inputGroupSelect01">Date d'édition</label></div><input class="form-control" type="date" name="dateEdition_livre" /></div>
                    </div>
                    <div class="form-group">
                    <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">Résumé</span></div><textarea name="resume_livre" class="form-control"></textarea></div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">Images</span></div><input name="image_livre" type="file" class="form-control file-upload" multiple accept="image/*"></div>
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