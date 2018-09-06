
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
    
    UsuarioModel uderModel = new UsuarioModel();
    
    
    public int insertar(Empresa emp) throws SQLException{
        
        int filasAffec = 0;
        String sql = "INSERT INTO `empresa`(`encargadoEmp`, `nombreEmp`, `Estado`, `Porcentaje`) VALUES (?,?,?,?)";
        this.conectar();
        st = conexion.prepareStatement(sql);
        st.setInt(1, emp.getIdEncargado());
        st.setString(2, emp.getNombre());
        st.setString(3, "inactivo");
        st.setInt(4, emp.getPorcentaje());
        
        filasAffec = st.executeUpdate();
        this.desconectar();
        return filasAffec;
    }
    
    public List<Empresa> listar() throws SQLException{
        Empresa emp = null;
        List<Empresa> empresas = new ArrayList<>();
        
        String sql = "SELECT * FROM `empresa`";
        this.conectar();
        st = conexion.prepareStatement(sql);
        rs = st.executeQuery();
        
        while (rs.next()) {
            emp = new Empresa();
            emp.setId(rs.getInt(1));
            emp.setIdEncargado(rs.getInt(2));
            emp.setNombre(rs.getString(3));
            emp.setEstado(rs.getString(4));
            emp.setPorcentaje(rs.getInt(5));
            emp.setEncargado(uderModel.findById(rs.getInt(2)));
            
            empresas.add(emp);
        }
        this.desconectar();
        return empresas;
    }
    
    public int eliminar(int id) throws SQLException{
        int filasAffec = 0;
        
        String sql = "DELETE FROM `empresa` WHERE idEmpresa = ?";
        this.conectar();
        st = conexion.prepareStatement(sql);
        st.setInt(1, id);
        filasAffec = st.executeUpdate();
        this.desconectar();
        return filasAffec;
        
    }
    
    public int update(Empresa emp) throws SQLException{
        int filasAffec = 0;
        this.conectar();
        String sql = "UPDATE `empresa` SET `nombreEmp`=?,`Estado`=?,`Porcentaje`=? WHERE idEmpresa = ?";
        st = conexion.prepareStatement(sql);
        
        st.setString(1, emp.getNombre());
        st.setString(2, emp.getEstado());
        st.setInt(3, emp.getPorcentaje());
        st.setInt(4, emp.getId());
        filasAffec = st.executeUpdate();        
        this.desconectar();
        return filasAffec;
    }
    
    public Empresa findById(int id) throws SQLException{
        this.conectar();
        String sql = "SELECT * FROM `empresa` WHERE idEmpresa = ?";
        st = conexion.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            Empresa emp = new Empresa();
            emp.setId(rs.getInt(1));
            emp.setIdEncargado(rs.getInt(2));
            emp.setNombre(rs.getString(3));
            emp.setEstado(rs.getString(4));
            emp.setPorcentaje(rs.getInt(5));
            
            this.desconectar();
            return emp;
            
        }
        this.desconectar();
        return null;
    
    }
    
    public Empresa findByIdEng(int id) throws SQLException{
        this.conectar();
        String sql = "SELECT `idEmpresa`, `nombreEmp`, `Estado`, `Porcentaje` FROM `empresa` WHERE encargadoEmp = ?";
        st = conexion.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        if (rs.next()) {
            Empresa emp = new Empresa();
            emp.setId(rs.getInt(1));
            emp.setNombre(rs.getString(2));
            emp.setEstado(rs.getString(3));
            emp.setPorcentaje(rs.getInt(4));
            
            this.desconectar();
            return emp;
            
        }
        this.desconectar();
        return null;
    
    }
    
    /**
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public List<Empresa> listar(int id) throws SQLException{
        Empresa emp = null;
        List<Empresa> empresas = new ArrayList<>();
        
        String sql = "SELECT `idEmpresa`,`encargadoEmp`, `nombreEmp`, `Estado`, `Porcentaje` FROM `empresa` WHERE `encargadoEmp`= ? ";
        this.conectar();
        st = conexion.prepareStatement(sql);
        st.setInt(1, id);
        rs = st.executeQuery();
        
        while (rs.next()) {
            emp = new Empresa();
            emp.setId(rs.getInt(1));
            emp.setIdEncargado(rs.getInt(2));
            emp.setNombre(rs.getString(3));
            emp.setEstado(rs.getString(4));
            emp.setPorcentaje(rs.getInt(5));
            emp.setEncargado(uderModel.findById(rs.getInt(2)));
            
            empresas.add(emp);
        }
        this.desconectar();
        return empresas;
    }
    
}
