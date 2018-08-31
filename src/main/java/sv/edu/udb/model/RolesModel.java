/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.model;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static sv.edu.udb.model.Conexion.conexion;
import sv.edu.udb.pojo.*;
/**
 *
 * @author Edal Bonilla
 */
public class RolesModel extends Conexion{
    
    
    
    public int insertar(Roles rol) throws SQLException{
        int filasAffec = 0;
        this.conectar();
        String sql = "INSERT INTO `roles`(`nombre`, `descripcion`) VALUES (?,?)";
        System.out.println(sql);
        st = conexion.prepareStatement(sql);
        st.setString(1, rol.getNombre());
        st.setString(2, rol.getDescripcion());        
        filasAffec = st.executeUpdate(); 
        this.desconectar();
        return filasAffec;
    
    }

    public List<Roles> listar() throws SQLException {
         Roles rol = null;
        List<Roles> categorias = new ArrayList<>();
        
        
        try {
            this.conectar();
            String sql ="SELECT * FROM `roles`";
            st = conexion.prepareStatement(sql);
            rs = st.executeQuery();
            
            while (rs.next()) {
                rol = new Roles();
                
                rol.setId(rs.getInt("id"));
                rol.setNombre(rs.getString("nombre"));
                rol.setDescripcion(rs.getString("descripcion"));
                
                categorias.add(rol);
                
            }
            this.desconectar();
            return categorias;
            
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            this.desconectar();
            return null;
        }   
    }
    
    public  int eliminar(int id) throws SQLException{
        int filasAffec = 0;
        String sql="DELETE FROM `roles` WHERE id = ?";
        this.conectar();
        st = conexion.prepareStatement(sql);
        st.setInt(1, id);
        filasAffec = st.executeUpdate();
        this.desconectar();
        
        return filasAffec;
        
    }
    
    public  int update(int id, Roles rol) throws SQLException{
        int filasAffec = 0;
        String sql ="UPDATE `roles` SET `nombre`=?,`descripcion`=? WHERE id = ?";
        this.conectar();
        st = conexion.prepareStatement(sql);
        st.setString(1, rol.getNombre());
        st.setString(2, rol.getDescripcion());
        st.setInt(3, id);
        filasAffec = st.executeUpdate();
        
        this.desconectar();
        return filasAffec;      
    
    }
    
    public Roles findById(int id) throws SQLException{
        String sql = "SELECT `id`, `nombre`, `descripcion` FROM `roles` WHERE id = ?";
        this.conectar();
        st= conexion.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            Roles rol = new Roles();
            rol.setNombre(rs.getString("nombre"));
            rol.setDescripcion(rs.getString("descripcion"));
            
            this.desconectar();
            return rol;
            
        }
        this.desconectar();
        return null;
    }
    
}
