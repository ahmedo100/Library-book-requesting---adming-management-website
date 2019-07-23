package Engine;

import java.sql.Blob;
import java.util.HashMap;

public class Livre {

    public Livre (){}

    public Livre( HashMap<String, String> cl) {
        this.issn = Integer.parseInt(cl.get("issn_livre"));
        this.titre = cl.get("titre_livre");
        this.resume = cl.get("resume_livre");
        this.nbrpage = Integer.parseInt(cl.get("nbrpage_livre"));
        this.id_auteur = Integer.parseInt(cl.get("id_auteur"));
        this.quantite = Integer.parseInt(cl.get("qte_livre"));
    }
    private int issn ;
    private String titre;
    private String resume;
    private int nbrpage ;
    private int id_auteur ;
    private int quantite;
    private String image;
    private String nomAuteur;
    private String prenomAuteur;

    public int getIssn() {
        return issn;
    }

    public void setIssn(int issn) {
        this.issn = issn;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public int getNbrpage() {
        return nbrpage;
    }

    public void setNbrpage(int nbrpage) {
        this.nbrpage = nbrpage;
    }

    public int getId_auteur() {
        return id_auteur;
    }

    public void setId_auteur(int id_auteur) {
        this.id_auteur = id_auteur;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPrenomAuteur() {
        return prenomAuteur;
    }

    public void setPrenomAuteur(String prenomAuteur) {
        this.prenomAuteur = prenomAuteur;
    }

    public String getNomAuteur() {
        return nomAuteur;
    }

    public void setNomAuteur(String nomAuteur) {
        this.nomAuteur = nomAuteur;
    }
}
