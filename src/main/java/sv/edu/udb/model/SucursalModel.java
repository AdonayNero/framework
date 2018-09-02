package sv.edu.udb.model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sv.edu.udb.pojo.Sucursal;

/**
 *
 * @author Manuel Orellana
 */
public class SucursalModel extends Conexion {
        
    /* Metodo para mostrar las sucursals existentes */
    public ArrayList<Sucursal> listar() throws  SQLException{
        
        ArrayList<Sucursal> sucursales = new ArrayList();
        try {
            conectar();
            st = conexion.prepareStatement("select * from sucursal");
            rs = st.executeQuery();

            while(rs.next()){
                Sucursal tmp = new Sucursal();
                tmp.setId(rs.getInt("idSucursal"));
                tmp.setIdEmpresa(rs.getInt("idEmpresa"));
                tmp.setCorreo(rs.getString("correo"));
                tmp.setTelefono(rs.getString("telefono"));
                tmp.setDireccion(rs.getString("direccion"));
                tmp.setIdEncargado(rs.getInt("idEncargado"));

                sucursales.add(tmp);
            }
        
        desconectar();
        return sucursales;
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para mostrar las sucursal por id */
    public Sucursal findById(int id) throws SQLException{
        
        Sucursal sucursal = null;
        try {
            conectar();
            st = conexion.prepareStatement("select idSucursal, idEmpresa, correo, telefono, direccion from sucursal where idSucursal = ?");
            st.setInt(1, id);

            rs = st.executeQuery();

            while(rs.next()){
                sucursal = new Sucursal();
                sucursal.setId(rs.getInt(1));
                sucursal.setIdEmpresa(rs.getInt(2));
                sucursal.setCorreo(rs.getString(3));   
                sucursal.setTelefono(rs.getString(4));
                sucursal.setDireccion(rs.getString(5));   
            }
        
        desconectar();
        return sucursal;
     
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para agregar sucursal */
    public int insertar(Sucursal sucursal) throws SQLException{
        int filasAffec = 0;
        try {
            conectar();
            st = conexion.prepareStatement("insert into sucursal (idEmpresa, correo, telefono, direccion) values(?,?,?,?)");
            st.setInt(1, sucursal.getIdEmpresa());
            st.setString(2, sucursal.getCorreo());
            st.setString(3, sucursal.getTelefono());
            st.setString(4, sucursal.getDireccion());
            filasAffec = st.executeUpdate();    

        desconectar();
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
        return filasAffec;
    }
    
    
    /* Metodo para actualizar sucursal */
    public int update(Sucursal sucursal) throws SQLException{
        int filasAffect = 0;
        try {
            conectar();
            st = conexion.prepareStatement("update sucursal set idEmpresa = ?, correo = ?, telefono = ?, direccion = ? where idSucursal = ?");
            st.setInt(1, sucursal.getIdEmpresa());
            st.setString(2, sucursal.getCorreo());
            st.setString(3, sucursal.getTelefono());
            st.setString(4, sucursal.getDireccion());
            st.setInt(5, sucursal.getId());
            filasAffect=st.executeUpdate();
        
        desconectar();   
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
        return filasAffect;
    }
    
    
    /* Metodo para eliminar sucursal */
    public int eliminar(int id) throws SQLException{
        int filasAffec = 0;
        try {
            conectar();
            st = conexion.prepareStatement("delete from sucursal where idSucursal = ?");
            st.setInt(1, id);
            filasAffec = st.executeUpdate();
            
        desconectar();
            
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
        return filasAffec;
    }
    
}