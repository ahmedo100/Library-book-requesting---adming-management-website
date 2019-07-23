import Engine.Administrateur;
import Engine.Livre;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
@MultipartConfig(maxFileSize = 16177215)

public class AddLivre extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String [] requiredInputs = {"issn_livre","titre_livre","id_auteur","qte_livre","dateEdition_livre","resume_livre","nbrPage_livre"};


        Collection<Part> livreImageParts = req.getParts();

        assert livreImageParts != null;

        ArrayList<InputStream> livreImageStreams = new ArrayList<>();

        // create array of input streams
        for(Part tmp :livreImageParts){
            if(tmp.getSize()> 1000)
                livreImageStreams.add(tmp.getInputStream());

        }

        //livre info
        HashMap<String,String> livre = new HashMap<>();
        for (final String inputIndex : requiredInputs) {

            livre.put(inputIndex, req.getParameter(inputIndex));
        }

        //categorie info

        String[] categories = req.getParameterValues("nom_categorie");

        ArrayList<HashMap<String,String>> catMap = new ArrayList<>();

        System.out.println(catMap);
        for(String categorie:categories){
            HashMap<String,String> tmp = new HashMap<>();
            tmp.put("nom_categorie",categorie);

            tmp.put("id_livre",req.getParameter("issn_livre"));
            catMap.add(tmp);
        }


        try {
            Administrateur admin = new Administrateur(1);
            admin.addLivre(livre);
           int id_livre =  Integer.parseInt(req.getParameter("issn_livre"));
           admin.db.insertImages(id_livre,"image_livre",livreImageStreams);
            admin.addCategorie(catMap);
            System.out.println("TRUUUUUE");

            resp.sendRedirect("livres.jsp");
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }


    }
}
