/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sv.edu.udb.model.OfertaModel;
import sv.edu.udb.pojo.Oferta;

/**
 *
 * @author Edal Bonilla
 */
@WebServlet(name = "OfertaController", urlPatterns = {"/oferta.do"})
public class OfertaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    OfertaModel modelo = new OfertaModel();
    Oferta ofer=null;
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
                    request.getRequestDispatcher("/Oferta/AddOferta.jsp").forward(request, response);
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
            request.setAttribute("listaOferta", modelo.listar());
            request.getRequestDispatcher("/Oferta/GetOferta.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(OfertaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) {
        try{
            ofer = new Oferta();
            ofer.setTitulo(request.getParameter("titulo"));
            ofer.setSubTitulo(request.getParameter("subTitulo"));
            ofer.setImagen(request.getParameter("imagen"));
            ofer.setValor(Double.parseDouble(request.getParameter("valor")));
            ofer.setValorOferta(Double.parseDouble(request.getParameter("valorOferta")));
            ofer.setEstado(request.getParameter("estado"));
            ofer.setDetalles(request.getParameter("detalles"));
            ofer.setDescripcion(request.getParameter("descripcion"));
            ofer.setObservaciones(request.getParameter("Observaciones"));
            
             if (modelo.insertar(ofer)>0) {
                response.sendRedirect(request.getContextPath() +"/oferta.do?op=listar");
            }
            
            
        } catch (SQLException | IOException ex) {
            Logger.getLogger(OfertaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void obtener(HttpServletRequest request, HttpServletResponse response) {
       try {
            int id = Integer.parseInt( request.getParameter("id"));
            ofer = modelo.findById(id);
            if (ofer != null) {
                request.setAttribute("ofer", ofer);
                request.getRequestDispatcher("Oferta/UpdateOferta.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/error404.jsp");
            }
        } catch (IOException | SQLException | ServletException ex) {
            Logger.getLogger(OfertaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        try {
            ofer = new Oferta();
            ofer.setId(Integer.parseInt(request.getParameter("id")));
            ofer.setTitulo(request.getParameter("titulo"));
            ofer.setSubTitulo(request.getParameter("subTitulo"));
            ofer.setImagen(request.getParameter("imagen"));
            ofer.setValor(Double.parseDouble(request.getParameter("valor")));
            ofer.setValorOferta(Double.parseDouble(request.getParameter("valorOferta")));
            ofer.setEstado(request.getParameter("estado"));
            ofer.setDetalles(request.getParameter("detalles"));
            ofer.setDescripcion(request.getParameter("descripcion"));
            ofer.setObservaciones(request.getParameter("Observaciones"));
            
            if (modelo.update(ofer)>0) {
                response.sendRedirect(request.getContextPath() +"/oferta.do?op=listar");
            }
        } catch (SQLException | IOException ex) {
            Logger.getLogger(OfertaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt( request.getParameter("id"));
            if (modelo.eliminar(id) > 0) {
                request.setAttribute("exito", "Oferta eliminada exitosamente");
                
            } else {
                request.setAttribute("fracaso", "No se puede eliminar esta Oferta");
            }
            request.getRequestDispatcher("/oferta.do?op=listar").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(OfertaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void inicio(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listaOferta", modelo.listar());
            request.getRequestDispatcher("/Oferta/GetOferta.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(OfertaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
