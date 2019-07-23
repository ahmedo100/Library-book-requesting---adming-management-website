$("#loginButton").click(function (e) {
    var loginButton = $("#loginButton");
    $.ajax({
        type: "post",
        url: "/tpcaw/Login",
        data: $("#loginForm").serialize(),
        beforeSend: function () {

            $("#loginButton").html("Connexion en cours .. ");
        },
        success: function (response) {
            if (response == "success") {
                setStyle(loginButton, "btn-primary", "btn-success", "Connecté");
                console.log("connecté! ");
               // setTimeout(function () { location.replace("index.jsp") }, 1500);
            } else {
                setTimeout(function () {
                    setStyle(loginButton, "btn-danger", "btn-success btn-primary", "Connection");
                }, 1500);



            }

        },
        error: function (err) {
            console.log(err);
        }
    });
});

function setStyle(loginButton, removedClass, addedClass, html) {
    loginButton.removeClass(removedClass);
    loginButton.addClass("btn-success");
    loginButton.removeAttr("style");
    loginButton.html(html);
}
