/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stuff;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author betio_000
 */
public class dbConnect {
        
    private Connection con;
    private PreparedStatement consulta;
    private ResultSet datos;
    private String server,user,db,table,pass;
    
    
    public dbConnect(){
        this.server = "localhost";
        this.db = "db_traductor";
        this.table = "tb_traduccion";
        this.user = "root";
        this.pass = "";  
    }
    
    public void con() throws SQLException{
            try {
			//Class.forName("com.mysql.jdbc.driver");
			Class.forName("com.mysql.jdbc.Driver");//jdbc:mysql://localhost/test
			this.con=DriverManager.getConnection("jdbc:mysql://"+this.server+"/"+this.db,this.user,this.pass);
                       // System.out.println("WE GON' BE ALRIGHT");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public void desconectar() throws SQLException 
    {
        this.con.close();
    }
    
    public String mostrar_traduccion(String pal_ingles, String categoria, String hint) throws SQLException//este metodo funciona? No lo he probado aun comence con el insert
    {//donde esta la carpeta de librerias? De cual proyecto? No esta en el modo de antes.
        this.con();
        this.consulta = this.con.prepareStatement("SELECT UPPER(traduccion) AS traduccion FROM db_traductor.tb_traduccion WHERE pal_ingles='"+pal_ingles+"' AND categoria='"+categoria+"' AND hint='"+hint+"'");
        this.datos = this.consulta.executeQuery();
        String s = "";
        while (datos.next()) {
             s = datos.getString("traduccion");
            //System.out.println(s);
        }
        return s;
    }
    
    
    
        public ResultSet mostrar() throws SQLException//este metodo funciona? No lo he probado aun comence con el insert
    {//donde esta la carpeta de librerias? De cual proyecto? No esta en el modo de antes.
        this.con();
        this.consulta = this.con.prepareStatement("SELECT * FROM tb_user");
        this.datos = this.consulta.executeQuery();
        return this.datos;
    }
    
    public boolean insert(String pal_ingles, String traduccion, String categoria, String hint) throws SQLException{
        this.con();
        try{
        this.consulta=this.con.prepareStatement("INSERT INTO `db_traductor`.`tb_traduccion` (`pal_ingles`, `traduccion`, `categoria`, `hint`) "
                + "VALUES ('"+pal_ingles+"', '"+traduccion+"', '"+categoria+"', '"+hint+"');");
        
        boolean resultado = this.consulta.execute();
        return true;
        }catch(Exception ex){
            out.println(ex.getMessage());
            return false;
        }
    }

   
}
