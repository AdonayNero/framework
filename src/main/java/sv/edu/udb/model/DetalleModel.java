
package sv.edu.udb.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sv.edu.udb.pojo.DetalleCupon;

/**
 *
 * @author Edwin Bonilla
 */
public class DetalleModel extends Conexion{
    OfertaModel emp = new OfertaModel();
    SucursalModel emp2 = new SucursalModel();
    CategoriaModel emp3 = new CategoriaModel();
    
    public int insertar(DetalleCupon dC) throws SQLException{
        int filasAffec = 0;
        this.conectar();
        String sql = "INSERT INTO `detallecupon`(`idOferta`, `idSucursal`, `idCategoria`, `estado`, `cantidad`, `FechHorInicio`, `FechHorFin`) VALUES (?,?,?,?,?,?,?)";
        st = conexion.prepareStatement(sql);
        st.setInt(1, dC.getIdOferta());
        st.setInt(2, dC.getIdSucursal());
        st.setInt(3, dC.getIdCategoria());
        st.setString(4, dC.getEstado());
        st.setInt(5, dC.getCantidad());
        st.setDate(6, dC.getFechaInicio());
        st.setDate(7, dC.getFechaFin());
        
        filasAffec = st.executeUpdate();
        this.desconectar();
        return filasAffec;
    
    }
    public List<DetalleCupon> listar() throws SQLException{
        DetalleCupon dC = null;
        List<DetalleCupon> detalles = new ArrayList<>();
        this.conectar();
        String sql = "SELECT `idDetalle`, `idOferta`, `idSucursal`, `idCategoria`, `estado`, `cantidad`, `FechHorInicio`, `FechHorFin` FROM `detallecupon";
        st = conexion.prepareStatement(sql);
        rs = st.executeQuery();
        
        while (rs.next()) {
            dC = new DetalleCupon();
            dC.setId(rs.getInt(1));
            dC.setIdOferta(rs.getInt(2));
            dC.setIdSucursal(rs.getInt(3));
            dC.setIdCategoria(rs.getInt(4));
            dC.setEstado(rs.getString(5));
            dC.setCantidad(rs.getInt(6));
            dC.setFechaInicio(rs.getDate(7));
            dC.setFechaFin(rs.getDate(8));
            dC.setOferta(emp.findById(rs.getInt("idOferta")));
            dC.setSucursal(emp2.findById(rs.getInt("idSucursal")));
            dC.setCategoria(emp3.findById(rs.getInt("idCategoria")));
            detalles.add(dC);
        }
        
        this.desconectar();
        return detalles;
    }
    
    public int eliminar(int id) throws SQLException{
        int filasAffec = 0;
        this.conectar();
        String sql = "DELETE FROM `detallecupon` WHERE idDetalle = ?";
        st = conexion.prepareStatement(sql);
        st.setInt(1, id);
        filasAffec = st.executeUpdate();
        this.desconectar();
        return filasAffec;
    }
    
    public int update(DetalleCupon dC) throws SQLException{
        int filasAffec = 0;
        this.conectar();
        String sql ="UPDATE `detallecupon` SET `estado`=?,`cantidad`=?,`FechHorInicio`=?,`FechHorFin`=? WHERE idDetalle = ?";
        st = conexion.prepareStatement(sql);
        st.setString(1, dC.getEstado());
        st.setInt(2, dC.getCantidad());
        st.setDate(3, dC.getFechaInicio());
        st.setDate(4, dC.getFechaFin());
        st.setInt(5, dC.getId());
        
        filasAffec =  st.executeUpdate();
        this.desconectar();
        return filasAffec;
        
    }
    
    public DetalleCupon findById(int id) throws SQLException{
        this.conectar();
        String sql ="SELECT `idDetalle`, `idOferta`, `idSucursal`, `idCategoria`, `estado`, `cantidad`, `FechHorInicio`, `FechHorFin` FROM `detallecupon` WHERE idDetalle = ?";
        st = conexion.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            
            DetalleCupon dC = new DetalleCupon();
            dC.setId(rs.getInt(1));
            dC.setIdOferta(rs.getInt(2));
            dC.setIdSucursal(rs.getInt(3));
            dC.setIdCategoria(rs.getInt(4));
            dC.setEstado(rs.getString(5));
            dC.setCantidad(rs.getInt(6));
            dC.setFechaInicio(rs.getDate(7));
            dC.setFechaFin(rs.getDate(8));
            
            this.desconectar();
            return dC;
        }
        this.desconectar();
        return null;
    }
    
}
