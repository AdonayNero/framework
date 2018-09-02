
package sv.edu.udb.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sv.edu.udb.pojo.Oferta;

/**
 *
 * @author Manuel Orellana
 */
public class OfertaModel extends Conexion{
    
    /* Metodo para mostrar las ofertas existentes */
    public ArrayList<Oferta> listar() throws  SQLException{
        
        ArrayList<Oferta> ofertas = new ArrayList();
        try {
            conectar();
            st = conexion.prepareStatement("select * from oferta");
            rs = st.executeQuery();

            while(rs.next()){
                Oferta tmp = new Oferta();
                tmp.setId(rs.getInt("idOferta"));
                tmp.setTitulo(rs.getString("Titulo"));
                tmp.setSubTitulo(rs.getString("subTitulo"));
                tmp.setImagen(rs.getString("img"));
                tmp.setDetalles(rs.getString("detalleGenerales"));
                tmp.setDescripcion(rs.getString("descripcion"));
                tmp.setValor(rs.getDouble("valorNormal"));
                tmp.setValorOferta(rs.getDouble("valorOferta"));
                tmp.setEstado(rs.getString("Estado"));
                tmp.setObservaciones(rs.getString("Observaciones"));

                ofertas.add(tmp);
            }
        
        desconectar();
        return ofertas;
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para mostrar las ofertas por id */
    public Oferta findById(int id) throws SQLException{
        
        Oferta oferta = null;
        try {
            conectar();
            st = conexion.prepareStatement("select idOferta, Titulo, subTitulo, img, detalleGenerales, descripcion, valorNormal, valorOferta, Estado, Observaciones from oferta where idOferta = ?");
            st.setInt(1, id);

            rs = st.executeQuery();

            while(rs.next()){
                oferta = new Oferta();
                oferta.setId(rs.getInt(1));
                oferta.setTitulo(rs.getString(2));
                oferta.setSubTitulo(rs.getString(3));   
                oferta.setImagen(rs.getString(4));
                oferta.setDetalles(rs.getString(5));
                oferta.setDescripcion(rs.getString(6));
                oferta.setValor(rs.getDouble(7));
                oferta.setValorOferta(rs.getDouble(8));   
                oferta.setEstado(rs.getString(9));
                oferta.setObservaciones(rs.getString(10));
            }
        
        desconectar();
        return oferta;
     
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para agregar oferta */
    public int insertar(Oferta oferta) throws SQLException{
        int filasAffec = 0;
        try {
            conectar();
            st = conexion.prepareStatement("insert into oferta (Titulo, subTitulo, img, detalleGenerales, descripcion, valorNormal, valorOferta, Estado, Observaciones) values(?,?,?,?,?,?,?,?,?)");
            st.setString(1, oferta.getTitulo());
            st.setString(2, oferta.getSubTitulo());
            st.setString(3, oferta.getImagen());
            st.setString(4, oferta.getDetalles());
            st.setString(5, oferta.getDescripcion());
            st.setDouble(6, oferta.getValor());
            st.setDouble(7, oferta.getValorOferta());
            st.setString(8, oferta.getEstado());
            st.setString(9, oferta.getObservaciones());
            filasAffec= st.executeUpdate();    

        desconectar();
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
        return filasAffec;
    }
    
    
    /* Metodo para actualizar oferta */
    public void update(Oferta oferta) throws SQLException{
        try {
            conectar();
            st = conexion.prepareStatement("update oferta set Titulo = ?, subTitulo = ?, img = ?, detalleGenerales = ?, descripcion = ?, valorNormal = ?, valorOferta = ?, Estado = ?, Observaciones = ? where idOferta = ?");
            st.setString(1, oferta.getTitulo());
            st.setString(2, oferta.getSubTitulo());
            st.setString(3, oferta.getImagen());
            st.setString(4, oferta.getDetalles());
            st.setString(5, oferta.getDescripcion());
            st.setDouble(6, oferta.getValor());
            st.setDouble(7, oferta.getValorOferta());
            st.setString(8, oferta.getEstado());
            st.setString(9, oferta.getObservaciones());
            st.setInt(10, oferta.getId());
            st.executeUpdate();
        
        desconectar();   
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
    }
    
    
    /* Metodo para eliminar oferta */
    public void eliminar(int id) throws SQLException{
        try {
            conectar();
            st = conexion.prepareStatement("delete from oferta where idOferta = ?");
            st.setInt(1, id);
            st.execute();
            
        desconectar();
            
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
    }
    
}
