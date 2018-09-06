package sv.edu.udb.model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sv.edu.udb.pojo.Empresa;
import sv.edu.udb.pojo.Sucursal;
import static sv.edu.udb.model.Conexion.conexion;

import sv.edu.udb.model.EmpresaModel;
/**
 *
 * @author Manuel Orellana
 */
public class SucursalModel extends Conexion {
        
    /* Metodo para mostrar las sucursals existentes */
    EmpresaModel emp = new EmpresaModel();
    UsuarioModel emp2 = new UsuarioModel();
    public ArrayList<Sucursal> listar() throws  SQLException{
        Sucursal tmp = null;
        ArrayList<Sucursal> sucursales = new ArrayList();
        try {
            this.conectar();
            st = conexion.prepareStatement("select * from sucursal");
            rs = st.executeQuery();

            while(rs.next()){
                tmp = new Sucursal();
                tmp.setId(rs.getInt("idSucursal"));
                tmp.setIdEmpresa(rs.getInt("idEmpresa"));
                tmp.setCorreo(rs.getString("Correo"));
                tmp.setTelefono(rs.getString("Telefono"));
                tmp.setDireccion(rs.getString("Direccion"));
                tmp.setIdEncargado(rs.getInt("idEncargado"));
                tmp.setEmpresa(emp.findById(rs.getInt("idEmpresa")));
                tmp.setUsuario(emp2.findById(rs.getInt("idEncargado")));
                sucursales.add(tmp);
                
            }
        
        this.desconectar();
        return sucursales;
        
        } catch (SQLException ex) {
            Logger.getLogger(SucursalModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para mostrar las sucursal por id */
    public Sucursal findById(int id) throws SQLException{
        
        Sucursal sucursal = null;
        try {
            conectar();
            st = conexion.prepareStatement("select idSucursal, idEmpresa, Correo, Telefono, Direccion, idEncargado from sucursal where idSucursal = ?");
            st.setInt(1, id);

            rs = st.executeQuery();

            while(rs.next()){
                sucursal = new Sucursal();
                sucursal.setId(rs.getInt(1));
                sucursal.setIdEmpresa(rs.getInt(2));
                sucursal.setCorreo(rs.getString(3));   
                sucursal.setTelefono(rs.getString(4));
                sucursal.setDireccion(rs.getString(5));   
                sucursal.setIdEncargado(rs.getInt(6));
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
            st = conexion.prepareStatement("insert into sucursal (idEmpresa, correo, telefono, direccion, idEncargado) values(?,?,?,?,?)");
            st.setInt(1, sucursal.getIdEmpresa());
            st.setString(2, sucursal.getCorreo());
            st.setString(3, sucursal.getTelefono());
            st.setString(4, sucursal.getDireccion());
            st.setInt(5, sucursal.getIdEncargado());
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
                   this.conectar();
            st = conexion.prepareStatement("update sucursal set Correo = ?, Telefono = ?, Direccion = ? where idSucursal = ?");
            st.setString(1, sucursal.getCorreo());
            st.setString(2, sucursal.getTelefono());
            st.setString(3, sucursal.getDireccion());
            st.setInt(4, sucursal.getId());
            filasAffect=st.executeUpdate();
        
        this.desconectar();   
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