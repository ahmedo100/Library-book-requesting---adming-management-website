package Engine;//TODO add file upload mecanism

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class Administrateur {
    private int id ;

    public DataBaseHandler db;

    public Administrateur(int id) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        this.id= id;
        db = new DataBaseHandler();
    }

   public boolean addAuteur(String nom , String prenom) throws SQLException {
      return db.insertValues(this.createAuteurMap(nom,prenom),"auteur");
}

    private HashMap<String,String> createAuteurMap(String nom, String prenom){

        HashMap<String,String> hm = new HashMap<>();

        hm.put("nom_auteur",nom);
        hm.put("prenom_auteur",prenom);

        return hm;
    }



    public boolean removeAuteur(int id_auteur) throws SQLException {
        return db.deleteValues("DELETE from auteur WHERE id_auteur='"+id_auteur+"'");
    }


    public boolean addLivre (HashMap<String,String> livre  ) throws SQLException {

        return (db.insertValues(livre,"livre"));

    }

    public void removeLivre(int id_livre) throws SQLException {
        db.deleteValues("DELETE from livre WHERE issn_livre='"+id_livre+"';");
    }

    public void addCategorie(ArrayList<HashMap<String,String>> categories) throws SQLException {
        db.insertMultipleValues(categories,"categorie");
    }
}
