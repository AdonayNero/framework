/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.model;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Edwin Bonilla
 */
public class Conexion {
    protected static Connection conexion=null;
    protected PreparedStatement st;
    protected ResultSet rs;

    public Conexion() {
       
        this.st = null;
        this.rs = null;
    }
    public void conectar() {
        try {
            if(conexion==null || conexion.isClosed()){
            //Obtenemos la conexion del pool de conexiones
            Context init = new InitialContext();
            Context context = (Context) init.lookup("java:comp/env");
            DataSource dataSource = (DataSource) context.lookup("jdbc/mysql");
            conexion = dataSource.getConnection();
            }

        } catch (NamingException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("falla en conexion1");
            out.println(ex.getMessage());
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("falla en conexion2");
            out.print(ex.getMessage());
        }
    }

    public void desconectar() throws SQLException {
        //Cierro los objetos en el orden inverso del que se crean
        // es decir: primero el resulset, luego el statement
        if (rs != null) {
            rs.close();
        }
        if (st != null) {
            st.close();
        }

    }
    
}
