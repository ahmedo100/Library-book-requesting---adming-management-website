
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.Statement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("testn");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String user = request.getParameter("username");
            String pass = request.getParameter("pass");
            
            boolean loginStatus = checkLogin(user,pass);
            if(loginStatus){
                pw.write("success");
            }
            else pw.write("fail");
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }

    }


    protected boolean checkLogin(String user , String pass ) throws SQLException, ClassNotFoundException, IllegalAccessException, InstantiationException {

        Connection connexion;
        Statement preparedStatement;
        ResultSet queryResult  = null;
        try{
            
        connexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tp-bib","root","");
        
         preparedStatement = (Statement) connexion.createStatement();
         String query ="Select * from administrateur where username ='"+user+"' AND password ='"+pass+"';";
            System.out.println(query);
         queryResult = (ResultSet) preparedStatement.executeQuery(query);
        
       

        
        } catch(Exception e){
            e.printStackTrace();
        }
        
        return queryResult.next();
        
    }
}
