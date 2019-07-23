package jsphandlers;

import Engine.DataBaseHandler;

import javax.swing.text.View;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class ViewHandler {
    DataBaseHandler db;
    public ViewHandler() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        db = new DataBaseHandler();
    }
public    String getAuteursTableView() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {

    String[] cols = {"id_auteur","nom_auteur","prenom_auteur"};
        String[] colsCount ={"count(*)"};
        ArrayList<HashMap<String,String>> al = db.selectValues("SELECT * from auteur ",cols);
        String rowView = "";
        for(HashMap<String,String> auteur :al){
            String id_auteur = auteur.get("id_auteur");
            int nbrLivre =  Integer.parseInt(db.selectValues("SELECT count(*) from livre WHERE id_auteur='"+id_auteur+"'",colsCount).get(0).get("count(*)"));

          rowView+= "<tr> <td>"+id_auteur+"</td> " +
                  "<td>"+auteur.get("nom_auteur")+" "+auteur.get("prenom_auteur")+"</td> " +
                  "<td>"+nbrLivre+"</td>" +
                  "<td>" +
                  " <a id='modifyBtn' class='btn btn-outline-primary modifyBtn' value =\"./ModifierAuteur?id_auteur="+id_auteur+"\">Modifier</a>" +
                  " <a class='btn btn-outline-danger' href= \"./RemoveAuteur?id_auteur="+id_auteur+"\">Supprimer</a> ";
        }

        return rowView;
    }

}
