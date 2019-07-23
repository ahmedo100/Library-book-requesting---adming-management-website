import Engine.Administrateur;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class RemoveAuteur extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id_auteur = req.getParameter("id_auteur");
        if(id_auteur!=null){
            try {
                Administrateur admin = new Administrateur(1);

                if(admin.removeAuteur(Integer.parseInt(id_auteur))){
                    resp.sendRedirect("./auteurs.jsp");
                }else {
                    resp.sendError(500);
                }


            } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
                e.printStackTrace();
            }
        }else {
            resp.sendError(500);
        }
    }
}
