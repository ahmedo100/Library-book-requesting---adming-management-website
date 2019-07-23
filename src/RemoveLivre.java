import Engine.Administrateur;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class RemoveLivre extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!req.getParameter("id").equals("")){
            try {
                Administrateur admin = new Administrateur(1);

                admin.removeLivre(Integer.parseInt(req.getParameter("id")));

                resp.sendRedirect("livres.jsp");
            } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }
}
