import Engine.Client;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class AccountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String submitButton =req.getParameter("inscription");
        if(submitButton!= null){
            String nom = req.getParameter("nom_inscription");
            String prenom = req.getParameter("prenom_inscription");
            String email = req.getParameter("email_inscription");
            String password = req.getParameter("password_inscription");

            try {
                Client cl = new Client();

                cl.inscription(nom,prenom,password,email);

                Cookie email_c = new Cookie("email",email);

                email_c.setMaxAge(24*3600);

                resp.addCookie(email_c);

                resp.sendRedirect("/tpcaw/account.jsp");



            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            String email = req.getParameter("email_login");
            String password = req.getParameter("password_login");

            try {
                Client cl = new Client();
                Client ncl;
                if(cl.login(email,password)){
                    ncl = cl.getClientByEmail(email);
                    HttpSession session = req.getSession();
                    String fullname =ncl.getNom()+" "+ncl.getPrenom();
                    System.out.println(fullname);
                    session.setAttribute("id_client",cl.getId());
                    session.setAttribute("fullName_client",fullname);
                    resp.sendRedirect("index.jsp");
                }else {
                    RequestDispatcher rd  =req.getRequestDispatcher("account.jsp");
                    req.setAttribute("error","");
                    rd.include(req,resp);

                }

            } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
                e.printStackTrace();
            }

        }
    }
}
