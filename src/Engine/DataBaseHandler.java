package Engine;


import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class DataBaseHandler {
    final String url ="jdbc:mysql://localhost:3306/tp-bib";
    final String username ="root";
    final String password ="";
    long lastInsertedId ;
    Connection connexionHandler ;
    Statement preparedStatement;
    ResultSet queryResult  ;

        //queryResult = (ResultSet) preparedStatement.executeQuery(query);



    public DataBaseHandler() throws SQLException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        Class.forName("com.mysql.jdbc.Driver").newInstance();

        connexionHandler =  DriverManager.getConnection(this.url,this.username,this.password);
        preparedStatement =  connexionHandler.createStatement();

    }

    public  boolean insertValues(HashMap<String,String> listChamps , String tableName ) throws SQLException {
        String champs ="";
        String values ="";
        for(String  key :listChamps.keySet()){
                champs+=key+",";
        }
        champs = champs.substring(0, champs.length() - 1);


        for(String val:listChamps.values()){
            values+= "'"+val+"',";
        }

        values = values.substring(0,values.length() - 1);

        String query = "INSERT into "+tableName +"("+champs+") VALUES ("+values+");";

       int affectedRows =  this.preparedStatement.executeUpdate(query,Statement.RETURN_GENERATED_KEYS);

       if(affectedRows == 1 && queryResult != null ){
           queryResult = this.preparedStatement.getGeneratedKeys();
           queryResult.next();
           lastInsertedId = queryResult.getLong(1);
           System.out.println(lastInsertedId+"");
       }

            return true;
    }

    public  boolean insertMultipleValues (ArrayList<HashMap<String,String>> listChamps,String tableName) throws SQLException {

        // Champs stands for the variable that's going to take all the fields of the query that we are going to execute
        String champs ="(";

        for(String key : listChamps.get(0).keySet()){
            champs+= key+",";
        }

        champs  = champs.substring(0,champs.length()-1);
        champs+=")";

        //Values is a variable that's going to take all the multiple values that we are going to insert into DB
        String values= "VALUES(";

        for(HashMap<String,String> entry :listChamps){

            for(String val:entry.values()){
                values+="'"+val+"',";
            }
            values = values.substring(0,values.length()-1);
            values+="),(";
        }
        values = values.substring(0,values.length()-2);
        String query  ="INSERT INTO "+tableName + champs +values;

        System.out.println(query);
        return this.preparedStatement.executeUpdate(query) > 0;

    }

    public  ArrayList<HashMap<String,String>>selectValues(String query,String[] columns) throws SQLException {

        this.queryResult =  this.preparedStatement.executeQuery(query);

        ArrayList<HashMap<String,String>> selectedvalues  = new ArrayList<HashMap<String,String>>();

            while(this.queryResult.next()){
                HashMap<String, String> tmp = new HashMap<>();
                for(String val : columns){
                    tmp.put(val,this.queryResult.getString(val));
                }
                selectedvalues.add(tmp);
        }

            return selectedvalues;
    }

    public  boolean deleteValues (String query) throws SQLException {
        this.preparedStatement.executeUpdate(query);

        return true;
    }

    public void insertImages (int _id , String tableName , ArrayList<InputStream> is) throws SQLException {

        String query ="INSERT INTO "+ tableName +"(id_livre,image) VALUES(?,?)";
        preparedStatement = this.connexionHandler.prepareStatement(query);
        ((PreparedStatement) preparedStatement).setInt(1,_id);

        for(InputStream tmpIs :is){
            ((PreparedStatement) preparedStatement).setBinaryStream(2,tmpIs);
            ((PreparedStatement) preparedStatement).executeUpdate();
        }

    }
}
