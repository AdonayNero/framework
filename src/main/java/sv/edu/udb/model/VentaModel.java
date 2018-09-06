
package sv.edu.udb.model;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import sv.edu.udb.pojo.Venta;
import static sv.edu.udb.model.Conexion.conexion;

/**
 *
 * @author Manuel Orellana
 */
public class VentaModel extends Conexion{
 
    UsuarioModel emp = new UsuarioModel();

    
    /* Metodo para mostrar las ventas existentes */
    public List<Venta> listar() throws  SQLException{
        Venta tmp = null;
        List<Venta> ventas = new ArrayList();
       
            this.conectar();
            st = conexion.prepareStatement("select `CodigoCupon`, `idCliente`, `idDetalleCupon`, `FechHrVenta`, `Formapago`, `Estado` from venta");
            rs = st.executeQuery();

            while(rs.next()){
                tmp = new Venta();
                tmp.setCodigo(rs.getString(1));
                tmp.setIdCliente(rs.getInt(2));
                tmp.setIdDetalleCupon(rs.getInt(3));
                tmp.setFechaVenta(rs.getDate(4));
                tmp.setFormaPago(rs.getString(5));
                tmp.setEstado(rs.getString(6));
                tmp.setCliente(emp.findById(rs.getInt(2)));
                
                ventas.add(tmp);
            }
        
        this.desconectar();
        return ventas;
        
    }
    
    
    /* Metodo para mostrar la venta por codigo */
    public Venta findById(String codigo) throws SQLException{
        
        Venta venta = null;
        try {
            conectar();
            st = conexion.prepareStatement("select CodigoCupon, idCliente, idDetalleCupon, FechHrVenta, Formapago, Estado from venta where CodigoCupon = ?");
            st.setString(1, codigo);

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
            Logger.getLogger(VentaModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para agregar venta */
    public int insertar(Venta venta) throws SQLException{
        int filasAffec=0;
       
            this.conectar();
            st = conexion.prepareStatement("insert into venta (CodigoCupon, idCliente, idDetalleCupon, FechHrVenta, Formapago, Estado) values(?,?,?,?,?,?)");
            st.setString(1, venta.getCodigo());
            st.setInt(2, venta.getIdCliente());
            st.setInt(3, venta.getIdDetalleCupon());
            st.setDate(4, venta.getFechaVenta());
            st.setString(5, venta.getFormaPago());
            st.setString(6, venta.getEstado());
            filasAffec = st.executeUpdate();    

        this.desconectar();
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
            Logger.getLogger(VentaModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
        return filasAffec;
    }
    
    
    /* Metodo para eliminar venta */
    public int eliminar(String codigo) throws SQLException{
        int filasAffec =0;
      
            this.conectar();
            st = conexion.prepareStatement("delete from `venta` where CodigoCupon = ?");
            st.setString(1, codigo);
            filasAffec = st.executeUpdate();
            
        this.desconectar();
        return filasAffec;
    }
    
}