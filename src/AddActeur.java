import Engine.Administrateur;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AddActeur extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nomAuteur = req.getParameter("nom_auteur");
        String prenomAuteur = req.getParameter("prenom_auteur");

        if(nomAuteur !=null && prenomAuteur!=null){
            try {
                if(addActeur(nomAuteur,prenomAuteur)){
                    resp.sendRedirect("auteurs.jsp");
                }
                else {
                    resp.sendError(500);
                }
            } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }

    private boolean addActeur(String nom, String prenom) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        Administrateur admin = new Administrateur(1);

        return admin.addAuteur(nom,prenom);
    }
}
