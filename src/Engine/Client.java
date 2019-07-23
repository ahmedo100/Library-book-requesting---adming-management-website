package Engine;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
public class Client {
    private int id ;
    private String email;
    private String password;
    private String nom;
    private String prenom;
    DataBaseHandler db ;
    public Client( HashMap<String, String> cl) throws SQLException, IllegalAccessException, InstantiationException, ClassNotFoundException {
        db = new DataBaseHandler();

        this.id = Integer.parseInt(cl.get("id_client"));
        this.email = cl.get("email_client");
        this.password = cl.get("password_client");
        this.nom = cl.get("nom_client");
        this.prenom = cl.get("prenom_client");
    }

    public Client( String email , String password ,String nom , String prenom ) throws SQLException, IllegalAccessException, InstantiationException, ClassNotFoundException {
        db = new DataBaseHandler();

        this.email = email;
        this.password = password;
        this.nom = nom;
        this.prenom = prenom;
    }


    public Client() throws SQLException, IllegalAccessException, InstantiationException, ClassNotFoundException {
        db= new DataBaseHandler();
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean login (String email,String password) throws SQLException {

        String []columns = {"count(*)"};
        ArrayList< HashMap<String,String>> res;
        String loginQuery ="SELECT count(*) from client WHERE email_client='"+email+"' AND password_client='"+password+"'";
        res = db.selectValues(loginQuery,columns);
      return  Integer.parseInt(res.get(0).get("count(*)"))!=0;
    }

    public boolean inscription (String nom , String prenom , String password , String email ) throws SQLException {
        HashMap<String,String> inscr = new HashMap<String,String>();
        inscr.put("nom_client",nom);
        inscr.put("prenom_client",prenom);
        inscr.put("email_client",email);
        inscr.put("password_client",password);



        return db.insertValues(inscr,"client");
    }

    public Client getClientByEmail(String email) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        DataBaseHandler db = new DataBaseHandler();

        String[] columns = {"nom_client","prenom_client","id_client"};
        return new Client(db.selectValues("SELECT nom_client,prenom_client,id_client from client WHERE email_client='" +email + "'", columns).get(0));


    }
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public int getId() {
        return id;
    }
}
