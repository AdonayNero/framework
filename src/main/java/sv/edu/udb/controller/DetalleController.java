
package sv.edu.udb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sv.edu.udb.model.CategoriaModel;
import sv.edu.udb.model.DetalleModel;
import sv.edu.udb.model.OfertaModel;
import sv.edu.udb.model.SucursalModel;
import sv.edu.udb.pojo.DetalleCupon;

/**
 *
 * @author Edal Bonilla
 */
@WebServlet(name = "DetalleController", urlPatterns = {"/detalle.do"})
public class DetalleController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    DetalleModel modelo = new DetalleModel();
    DetalleCupon detalle = null;
    
    OfertaModel ofertaModel = new OfertaModel();
    SucursalModel sucursalModel = new SucursalModel();
    CategoriaModel categoriaModel = new CategoriaModel();
    
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
                case "inicio":
                    inicio(request, response);
                    break;
                case "verOferta":
                    verOferta(request, response);
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
        try {
            request.setAttribute("listaDetalles", modelo.listar());
            request.getRequestDispatcher("/DetalleCupon/GetDetalleCupon.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(DetalleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) {
      
      try {
            listaErrores.clear();
            detalle = new DetalleCupon();
            detalle.setIdOferta(Integer.parseInt(request.getParameter("idOferta")));
            detalle.setIdSucursal(Integer.parseInt(request.getParameter("idSucursal")));
            detalle.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
            detalle.setEstado(request.getParameter("estado"));
            detalle.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
            detalle.setFechaInicio(Date.valueOf(request.getParameter("fechaInicio")));
            detalle.setFechaFin(Date.valueOf(request.getParameter("fechaFin")));
         
            if (modelo.insertar(detalle)>0) {
                response.sendRedirect(request.getContextPath() +"/detalle.do?op=listar");
            }
        } catch (SQLException | IOException ex) {
            Logger.getLogger(DetalleController.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }

    private void obtener(HttpServletRequest request, HttpServletResponse response) {
        try{
            int id = Integer.parseInt( request.getParameter("id"));
            detalle = modelo.findById(id);
            if (detalle != null) {
                request.setAttribute("detalle", detalle);
                request.getRequestDispatcher("DetalleCupon/UpdateDetalleCupon.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/error404.jsp");
            }
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(DetalleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
         try{
            listaErrores.clear();
            detalle = new DetalleCupon();
            detalle.setId(Integer.parseInt(request.getParameter("id")));
            detalle.setEstado(request.getParameter("estado"));
            detalle.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
            detalle.setFechaInicio(Date.valueOf(request.getParameter("fechaInicio"))); 
            detalle.setFechaFin(Date.valueOf(request.getParameter("fechaFin")));
        if(modelo.update(detalle)>0) {
                response.sendRedirect(request.getContextPath() +"/detalle.do?op=listar");
            }
    }   catch (IOException | SQLException ex) {
            Logger.getLogger(DetalleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
       
    }

    private void nuevo(HttpServletRequest request, HttpServletResponse response) {
       try{
            request.setAttribute("listarOferta", ofertaModel.listar());
            request.setAttribute("listarSucursal", sucursalModel.listar());
            request.setAttribute("listarCategoria", categoriaModel.listar());
            request.getRequestDispatcher("/DetalleCupon/AddDetalleCupon.jsp").forward(request, response);
       } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(DetalleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void inicio(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listaOferta", modelo.listar());
            try {
                request.getRequestDispatcher("/inicioPublic.jsp").forward(request, response);
            } catch (ServletException | IOException ex) {
                Logger.getLogger(DetalleController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetalleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void verOferta(HttpServletRequest request, HttpServletResponse response) {
        try{
            int id = Integer.parseInt( request.getParameter("id"));
            detalle = modelo.findById(id);
            System.out.println("detalleid "+ detalle.getId());
            if (detalle != null) {
                request.setAttribute("detalle", detalle);
                request.getRequestDispatcher("/oferta.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/error404.jsp");
            }
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(DetalleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
