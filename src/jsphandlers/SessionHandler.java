package jsphandlers;

import javax.servlet.http.HttpSession;

public class SessionHandler {
    final HttpSession session ;
    public SessionHandler(HttpSession session){
        this.session = session;
    }
    public String getLoginLogoutView(){
        if(session.getAttribute("id_client")!=null)
            return "<span><a href=\"Logout\">Deconnecter</a></span>";
        else
            return "<span><a href=\"account.jsp\">Se Connecter</a></span>"+
                    "<span><a href=\"account.jsp\">Créer Un Compte</a></span>";
    }


    public String getFullNameView(){
        if(session.getAttribute("id_client")!=null)
            return "<span>"+session.getAttribute("fullName_client")+"</span>\n";
        else
            return "<span>Compte</span>\n";
    }
}
