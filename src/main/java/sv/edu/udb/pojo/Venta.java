
package sv.edu.udb.pojo;

import java.sql.Date;

/**
 *
 * 
 */

/**
 *
 * @author Victor Orellana
 */
public class Venta {
    private String codigo;
    private int idCliente;
    private int idDetalleCupon;
    private Date fechaVenta;
    private String formaPago;
    private String estado;
    private Usuario cliente;

    public Usuario getCliente() {
        return cliente;
    }

    public void setCliente(Usuario cliente) {
        this.cliente = cliente;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdDetalleCupon() {
        return idDetalleCupon;
    }

    public void setIdDetalleCupon(int idDetalleCupon) {
        this.idDetalleCupon = idDetalleCupon;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public String getFormaPago() {
        return formaPago;
    }

    public void setFormaPago(String formaPago) {
        this.formaPago = formaPago;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
