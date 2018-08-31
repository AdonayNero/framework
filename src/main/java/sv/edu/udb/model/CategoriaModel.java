package sv.edu.udb.model;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sv.edu.udb.pojo.Categoria;

/**
 *
 * @author Manuel Orellana
 */
public class CategoriaModel extends Conexion {
        
    /* Metodo para mostrar las categorias existentes */
    public ArrayList<Categoria> getCategoria() throws  SQLException{
        
        ArrayList<Categoria> categorias = new ArrayList();
        try {
            conectar();
            st = conexion.prepareStatement("select * from categoria");
            rs = st.executeQuery();

            while(rs.next()){
                Categoria tmp = new Categoria();
                tmp.setId(rs.getInt("idCategoria"));
                tmp.setNombre(rs.getString("nombre"));
                tmp.setDescripcion(rs.getString("descripcion"));

                categorias.add(tmp);
            }
        
        desconectar();
        return categorias;
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para mostrar la categoria por idCategoria */
    public Categoria getCategoriaById(int idCategoria) throws SQLException{
        
        Categoria categoria = null;
        try {
            conectar();
            st = conexion.prepareStatement("select idCategoria, nombre, descripcion from categoria where idCategoria = ?");
            st.setInt(1, idCategoria);

            rs = st.executeQuery();

            while(rs.next()){
                categoria = new Categoria();
                categoria.setId(rs.getInt(1));
                categoria.setNombre(rs.getString(2));
                categoria.setDescripcion(rs.getString(3));                        
            }
        
        desconectar();
        return categoria;
     
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
            return null;
        }
    }
    
    
    /* Metodo para agregar categoria */
    public void addCategoria(Categoria categoria) throws SQLException{
        try {
            conectar();
            st = conexion.prepareStatement("insert into categoria (nombre, descripcion) values(?,?)");
            st.setString(1, categoria.getNombre());
            st.setString(2, categoria.getDescripcion());
            st.executeUpdate();    

        desconectar();
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
    }
    
    
    /* Metodo para actualizar categoria */
    public void updateCategoria(Categoria categoria) throws SQLException{
        try {
            conectar();
            st = conexion.prepareStatement("update categoria set nombre = ?, descripcion = ? where idCategoria = ?");
            st.setString(1, categoria.getNombre());
            st.setString(2, categoria.getDescripcion());
            st.setInt(3, categoria.getId());
            st.executeUpdate();
        
        desconectar();   
        
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
    }
    
    
    /* Metodo para eliminar categoria */
    public void deleteCategoria(int idCategoria) throws SQLException{
        try {
            conectar();
            st = conexion.prepareStatement("delete from categoria where idCategoria = ?");
            st.setInt(1, idCategoria);
            st.execute();
            
        desconectar();
            
        } catch (SQLException ex) {
            Logger.getLogger(RolesModel.class.getName()).log(Level.SEVERE, null, ex);
            desconectar();
        }
    }
    
}
