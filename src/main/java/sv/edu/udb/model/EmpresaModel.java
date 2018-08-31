
package sv.edu.udb.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sv.edu.udb.pojo.Empresa;

/**
 *
 * @author Edwin Bonilla
 */
public class EmpresaModel extends Conexion{
    
    public int insertar(Empresa emp) throws SQLException{
        
        int filasAffec = 0;
        String sql = "INSERT INTO `empresa`(`nombreEmp`, `Estado`, `Porcentaje`) VALUES (?,?,?)";
        this.conectar();
        st = conexion.prepareStatement(sql);
        st.setString(1, emp.getNombre());
        st.setString(2, emp.getEstado());
        st.setInt(3, emp.getPorcentaje());
        
        filasAffec = st.executeUpdate();
        this.desconectar();
        return filasAffec;
    }
    
    public List<Empresa> listar() throws SQLException{
        Empresa emp = null;
        List<Empresa> empresas = new ArrayList<>();
        
        String sql = "SELECT `idEmpresa`, `nombreEmp`, `Estado`, `Porcentaje` FROM `empresa`";
        this.conectar();
        st = conexion.prepareStatement(sql);
        rs = st.executeQuery();
        
        while (rs.next()) {
            emp = new Empresa();
            emp.setId(rs.getInt(1));
            emp.setNombre(rs.getString(2));
            emp.setEstado(rs.getString(3));
            emp.setPorcentaje(rs.getInt(4));
            
            empresas.add(emp);
        }
        this.desconectar();
        return empresas;
    }
    
    public int eliminar(int id) throws SQLException{
        int filasAffec = 0;
        
        String sql = "DELETE FROM `empresa` WHERE id = ?";
        this.conectar();
        st = conexion.prepareStatement(sql);
        filasAffec = st.executeUpdate();
        this.desconectar();
        return filasAffec;
        
    }
    
    
}
