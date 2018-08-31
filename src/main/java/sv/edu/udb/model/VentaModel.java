
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
    public ArrayList<Venta> getVenta() throws  SQLException{
        
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
    public Venta getVentaById(int codigo) throws SQLException{
        
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
    public void addVenta(Venta venta) throws SQLException{
        try {
            conectar();
            st = conexion.prepareStatement("insert into venta (idCliente, idDetalleCupon, FechHrVenta, Formapago, Estado) values(?,?,?,?,?)");
            st.setInt(1, venta.getIdCliente());
            st.setInt(2, venta.getIdDetalleCupon());
            st.setDate(3, venta.getFechaVenta());
            st.setString(4, venta.getFormaPago());
            st.setString(5, venta.getEstado());
            st.executeUpdate();    

        desconectar();
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
    }
    
    
    /* Metodo para actualizar venta */
    public void updateCategoria(Venta venta) throws SQLException{
        try {
            conectar();
            st = conexion.prepareStatement("update venta set idCliente = ?, idDetalleCupon = ?, FechHrVenta = ?, Formapago = ?, Estado = ? where CodigoCupon = ?");
            st.setInt(1, venta.getIdCliente());
            st.setInt(2, venta.getIdDetalleCupon());
            st.setDate(3, venta.getFechaVenta());
            st.setString(4, venta.getFormaPago());
            st.setString(5, venta.getEstado());
            st.setString(6, venta.getCodigo());
            st.executeUpdate();
        
        desconectar();   
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
    }
    
    
    /* Metodo para eliminar venta */
    public void deleteVenta(int codigo) throws SQLException{
        try {
            conectar();
            st = conexion.prepareStatement("delete from venta where CodigoCupon = ?");
            st.setInt(1, codigo);
            st.execute();
            
        desconectar();
            
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
    }
    
}