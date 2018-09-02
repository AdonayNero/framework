
package sv.edu.udb.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sv.edu.udb.pojo.Venta;

/**
 *
 * @author Manuel Orellana
 */
public class VentaModel extends Conexion{
 
    /* Metodo para mostrar las ventas existentes */
    public ArrayList<Venta> listar() throws  SQLException{
        
        ArrayList<Venta> ventas = new ArrayList();
        try {
            conectar();
            st = conexion.prepareStatement("select * from venta");
            rs = st.executeQuery();

            while(rs.next()){
                Venta tmp = new Venta();
                tmp.setCodigo(rs.getString("CodigoCupon"));
                tmp.setIdCliente(rs.getInt("idCliente"));
                tmp.setIdDetalleCupon(rs.getInt("idDetalleCupon"));
                tmp.setFechaVenta(rs.getDate("FechaHrVenta"));
                tmp.setFormaPago(rs.getString("Formapago"));
                tmp.setEstado(rs.getString("Estado"));

                ventas.add(tmp);
            }
        
        desconectar();
        return ventas;
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para mostrar la venta por codigo */
    public Venta findById(int codigo) throws SQLException{
        
        Venta venta = null;
        try {
            conectar();
            st = conexion.prepareStatement("select CodigoCupon, idCliente, idDetalleCupon, FechHrVenta, Formapago, Estado from venta where CodigoCupon = ?");
            st.setInt(1, codigo);

            rs = st.executeQuery();

            while(rs.next()){
                venta = new Venta();
                venta.setCodigo(rs.getString(1));
                venta.setIdCliente(rs.getInt(2));
                venta.setIdDetalleCupon(rs.getInt(3)); 
                venta.setFechaVenta(rs.getDate(4)); 
                venta.setFormaPago(rs.getString(5));
                venta.setEstado(rs.getString(6)); 
            }
        
        desconectar();
        return venta;
     
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para agregar venta */
    public int insertar(Venta venta) throws SQLException{
        int filasAffec=0;
        try {
            conectar();
            st = conexion.prepareStatement("insert into venta (idCliente, idDetalleCupon, FechHrVenta, Formapago, Estado) values(?,?,?,?,?)");
            st.setInt(1, venta.getIdCliente());
            st.setInt(2, venta.getIdDetalleCupon());
            st.setDate(3, venta.getFechaVenta());
            st.setString(4, venta.getFormaPago());
            st.setString(5, venta.getEstado());
            filasAffec = st.executeUpdate();    

        desconectar();
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
        return filasAffec;
    }
    
    
    /* Metodo para actualizar venta */
    public int update(Venta venta) throws SQLException{
        int filasAffec = 0;
        try {
            conectar();
            st = conexion.prepareStatement("update venta set idCliente = ?, idDetalleCupon = ?, FechHrVenta = ?, Formapago = ?, Estado = ? where CodigoCupon = ?");
            st.setInt(1, venta.getIdCliente());
            st.setInt(2, venta.getIdDetalleCupon());
            st.setDate(3, venta.getFechaVenta());
            st.setString(4, venta.getFormaPago());
            st.setString(5, venta.getEstado());
            st.setString(6, venta.getCodigo());
            filasAffec = st.executeUpdate();
        
        desconectar();   
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
        return filasAffec;
    }
    
    
    /* Metodo para eliminar venta */
    public int eliminar(int codigo) throws SQLException{
        int filasAffec =0;
        try {
            conectar();
            st = conexion.prepareStatement("delete from venta where CodigoCupon = ?");
            st.setInt(1, codigo);
            filasAffec = st.executeUpdate();
            
        desconectar();
            
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
        return  filasAffec;
    }
    
}