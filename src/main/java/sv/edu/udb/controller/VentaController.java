
package sv.edu.udb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sv.edu.udb.model.DetalleModel;
import sv.edu.udb.model.UsuarioModel;
import sv.edu.udb.model.VentaModel;
import sv.edu.udb.pojo.Venta;

/**
 *
 * @author Edal Bonilla
 */

@WebServlet(name = "VentaController", urlPatterns = {"/venta.do"})
public class VentaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    VentaModel modelo = new VentaModel();
    Venta venta = null;
    
    UsuarioModel userModel = new UsuarioModel();
    DetalleModel detalleModel = new DetalleModel();
    
    ArrayList<String> listaErrores = new ArrayList<>();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             if(request.getParameter("op")==null){
            listar(request, response);
            return;
            }
            String operacion = request.getParameter("op");
   
            switch (operacion) {
                case "listar":
                    listar(request, response);
                    break;
                case "nuevo":
                    nuevo(request, response);
                    break;
                case "insertar":
                    insertar(request, response);
                    break;
                case "obtener":
                    obtener(request, response);
                    break;
                case "modificar":
                    modificar(request, response);
                    break;
                case "eliminar":
                    eliminar(request, response);
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void listar(HttpServletRequest request, HttpServletResponse response) {
       try{
        request.setAttribute("listarVenta", modelo.listar());
            request.getRequestDispatcher("/Venta/GetVenta.jsp").forward(request, response);
       } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(VentaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
       

    private void insertar(HttpServletRequest request, HttpServletResponse response) {
        try {
            listaErrores.clear();
            venta = new Venta();
            Random rnd = new Random();
        
        rnd.setSeed(System.currentTimeMillis());
        
        int codigo_cupon = 0000000 + rnd.nextInt(9000000);
            venta.setCodigo("EMP00"+codigo_cupon);
            venta.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
            venta.setIdDetalleCupon(Integer.parseInt(request.getParameter("idDetalleCupon")));
            venta.setFechaVenta(Date.valueOf(request.getParameter("fechaVenta")));
            venta.setFormaPago(request.getParameter("formaPago"));
            venta.setEstado(request.getParameter("estado"));
            if (modelo.insertar(venta)>0) {
                response.sendRedirect(request.getContextPath() +"/venta.do?op=listar");
            }
        } catch (IOException | SQLException ex) {
            Logger.getLogger(VentaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void obtener(HttpServletRequest request, HttpServletResponse response) {
      try {
            String codigo = request.getParameter("codigo");
            venta = modelo.findById("codigo");
            if (venta != null) {
                request.setAttribute("venta", venta);
                request.getRequestDispatcher("Venta/UpdateVenta.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/error404.jsp");
            }
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(VentaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        try{
            listaErrores.clear();
            venta = new Venta();
            venta.setCodigo(request.getParameter("codigo"));
            venta.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
            venta.setIdDetalleCupon(Integer.parseInt(request.getParameter("idDetallecupon")));
            venta.setFechaVenta(Date.valueOf(request.getParameter("fechaVenta"))); 
            venta.setFormaPago(request.getParameter("formaPago"));
            venta.setEstado(request.getParameter("estado"));
        if(modelo.update(venta)>0) {
                response.sendRedirect(request.getContextPath() +"/venta.do?op=listar");
            }
    }   catch (SQLException | IOException ex) {
            Logger.getLogger(VentaController.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
          try {
            String codigo = request.getParameter("codigo");
            if (modelo.eliminar(codigo) > 0) {
                request.setAttribute("exito", "empresa eliminado exitosamente");
                
            } else {
                request.setAttribute("fracaso", "No se puede eliminar esta venta");
            }
            request.getRequestDispatcher("/venta.do?op=listar").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(VentaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void nuevo(HttpServletRequest request, HttpServletResponse response) {
        try{   
            request.setAttribute("listarUser", userModel.listar());
            request.setAttribute("listarDetalle", detalleModel.listar());
            request.getRequestDispatcher("/Venta/AddVenta.jsp").forward(request, response);
    }   catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(VentaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
