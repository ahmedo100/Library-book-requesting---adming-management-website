import Engine.Auteur;

import javax.json.Json;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ModifierAuteur extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id_auteur = req.getParameter("id_auteur");
        if(id_auteur != null){
            try {
                Auteur auteur = new Auteur(Integer.parseInt(id_auteur));
                String response = Json.createObjectBuilder().add("nom_auteur",auteur.getNom_auteur()).add("prenom_auteur",auteur.getPrenom_auteur()).toString();
                resp.getWriter().print(response);

            } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
                e.printStackTrace();
            }
        }else {
            resp.sendError(300);
        }
    }
}
