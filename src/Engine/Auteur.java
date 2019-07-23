package Engine;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class Auteur {


    public Auteur(HashMap<String, String> cl) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        this.id_auteur = Integer.parseInt(cl.get("id_auteur"));
        this.nom_auteur = cl.get("nom_auteur");
        this.prenom_auteur = cl.get("prenom_auteur");
        db  = new DataBaseHandler();
    }

    public Auteur() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        db = new DataBaseHandler();
        this.id_auteur = 0;
        this.nom_auteur = "";
        this.prenom_auteur ="";
    }

    public Auteur(int id_auteur) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        db = new DataBaseHandler();
        String[] columns ={"nom_auteur","prenom_auteur"};
        HashMap<String,String> auteur  = db.selectValues("SELECT nom_auteur,prenom_auteur FROM auteur WHERE id_auteur='"+id_auteur+"'",columns).get(0);
        this.id_auteur = id_auteur;
        this.nom_auteur = auteur.get("nom_auteur");
        this.prenom_auteur = auteur.get("prenom_auteur");
    }
    private int id_auteur;
    private String nom_auteur;
    private String prenom_auteur;
    private static DataBaseHandler db;
    public int getId_auteur() {
        return id_auteur;
    }

    public void setId_auteur(int id_auteur) {
        this.id_auteur = id_auteur;
    }

    public String getNom_auteur() {
        return nom_auteur;
    }

    public void setNom_auteur(String nom_auteur) {
        this.nom_auteur = nom_auteur;
    }

    public String getPrenom_auteur() {
        return prenom_auteur;
    }

    public void setPrenom_auteur(String prenom_auteur) {
        this.prenom_auteur = prenom_auteur;
    }


    public  ArrayList<HashMap<String,String>> getAllAuteurs () throws SQLException {
        String [] cols = {"id_auteur","nom_auteur","prenom_auteur"};
        ArrayList <HashMap<String,String>> tmp = db.selectValues("SELECT * from auteur",cols);


       return tmp;
    }


}
