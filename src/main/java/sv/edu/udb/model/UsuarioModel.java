/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sv.edu.udb.pojo.Usuario;

/**
 *
 * @author Edwin Bonilla
 */
public class UsuarioModel extends Conexion{
    
    public int insertar( Usuario user) throws SQLException{
        int filasAffec = 0;
        String sql = "INSERT INTO `usuario`(`nombre`, `telefono`, `email`, `pass`, `estado`, `tipoAcceso`, `fotoPerfil`, `token`, `dui`, `direccion`) VALUES (?,?,?,?,?,?,?,?,?,?)";
        this.conectar();
        st = conexion.prepareStatement(sql);
        st.setString(1, user.getNombre());
        st.setString(2, user.getTelefono());
        st.setString(3, user.getEmail());
        st.setString(4, user.getPass());
        st.setString(5, user.getEstado());
        st.setInt(6, user.getTipoAcceso());
        st.setString(7, user.getFoto());
        st.setString(8, user.getToken());
        st.setString(9, user.getDui());
        st.setString(10, user.getDireccion());
        
        filasAffec = st.executeUpdate();
        this.desconectar();
        return filasAffec;
        
    }
    
    public List<Usuario> listar() throws SQLException{
        Usuario user = null;
        List<Usuario> usuarios = new ArrayList<>();
        
        this.conectar();
        String sql = "SELECT `idUsuario`, `nombre`, `telefono`, `email`, `pass`, `estado`, `tipoAcceso`, `fotoPerfil`, `token`, `dui`, `direccion` FROM `usuario";
        st = conexion.prepareStatement(sql);
        rs = st.executeQuery();
        while (rs.next()) {
            user = new Usuario();
            user.setId(rs.getInt(1));
            user.setNombre(rs.getString(2));
            user.setTelefono(rs.getString(3));
            user.setEmail(rs.getString(4));
            user.setPass(rs.getString(5));
            user.setEstado(rs.getString(6));
            user.setTipoAcceso(rs.getInt(7));
            user.setFoto(rs.getString(8));
            user.setToken(rs.getString(9));
            user.setDui(rs.getString(10));
            user.setDireccion(rs.getString(11));
            usuarios.add(user);
        }
        
        this.desconectar();
        return usuarios;
        
    }
    public int eliminar(int id) throws SQLException{
        
        int filasAffec;
        
        String sql = "DELETE FROM `usuario` WHERE idUsuario = ?";
        this.conectar();
        st = conexion.prepareStatement(sql);
        st.setInt(1, id);
        filasAffec = st.executeUpdate();
        this.desconectar();
        return filasAffec;
    
    }
    
    public int update(int id , Usuario user) throws SQLException{
        int filasAffec=0;
        this.conectar();
        String sql = "UPDATE `usuario` SET `nombre`=?,`telefono`=?,`email`=?,`pass`=?,`estado`=?,`tipoAcceso`=?,`fotoPerfil`=?,`token`=?,`dui`=?,`direccion`=? WHERE id=?";
        st = conexion.prepareStatement(sql);
        st.setString(1, user.getNombre());
        st.setString(2, user.getTelefono());
        st.setString(3, user.getEmail());
        st.setString(4, user.getPass());
        st.setString(5, user.getEstado());
        st.setInt(6, user.getTipoAcceso());
        st.setString(7, user.getFoto());
        st.setString(8, user.getToken());
        st.setString(9, user.getDui());
        st.setString(10, user.getDireccion());
        
        filasAffec = st.executeUpdate();
        this.desconectar();
        return filasAffec;
    }
    
    public Usuario findById(int id) throws SQLException{
        String sql = "SELECT `id`, `nombre`, `descripcion` FROM `roles` WHERE id = ?";
        this.conectar();
        st= conexion.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            Usuario user = new Usuario();
            
            user.setId(rs.getInt(1));
            user.setNombre(rs.getString(2));
            user.setTelefono(rs.getString(3));
            user.setEmail(rs.getString(4));
            user.setPass(rs.getString(5));
            user.setEstado(rs.getString(6));
            user.setTipoAcceso(rs.getInt(7));
            user.setFoto(rs.getString(8));
            user.setToken(rs.getString(9));
            user.setDui(rs.getString(10));
            user.setDireccion(rs.getString(11));
            
            this.desconectar();
            return user;
            
        }
        this.desconectar();
        return null;
    }
    
}
