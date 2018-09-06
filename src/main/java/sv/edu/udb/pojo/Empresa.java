
package sv.edu.udb.pojo;

/**
 *
 * @author Edal Bonilla
 */
public class Empresa {
    private int id;
    private int idEncargado;
    private String nombre;
    private String estado;
    private int porcentaje;
    private Usuario encargado;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdEncargado() {
        return idEncargado;
    }

    public void setIdEncargado(int idEncargado) {
        this.idEncargado = idEncargado;
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
    }

    public Usuario getEncargado() {
        return encargado;
    }

    public void setEncargado(Usuario encargado) {
        this.encargado = encargado;
    }
    
    
    
    
}
