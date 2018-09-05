
package sv.edu.udb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sv.edu.udb.model.EmpresaModel;
import sv.edu.udb.model.SucursalModel;
import sv.edu.udb.model.UsuarioModel;
import sv.edu.udb.pojo.Sucursal;

/**
 *
 * @author Manuel Orellana
 */
@WebServlet(name = "SucursalController", urlPatterns = {"/sucursal.do"})
public class SucursalController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    SucursalModel modelo = new SucursalModel();
    Sucursal sucursal = null;
    
    EmpresaModel empModel = new EmpresaModel();
    UsuarioModel userModel = new UsuarioModel();
    
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
        
        try {
            request.setAttribute("listarSucursal", modelo.listar());
            request.getRequestDispatcher("/Sucursal/GetSucursal.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(SucursalController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) {
        
        try {
            listaErrores.clear();
            sucursal = new Sucursal();
            sucursal.setIdEmpresa(Integer.parseInt(request.getParameter("idEmpresa")));
            sucursal.setCorreo(request.getParameter("correo"));
            sucursal.setTelefono(request.getParameter("telefono"));
            sucursal.setDireccion(request.getParameter("direccion"));
            sucursal.setIdEncargado(Integer.parseInt(request.getParameter("idEncargado")));
            if (modelo.insertar(sucursal)>0) {
                response.sendRedirect(request.getContextPath() +"/sucursal.do?op=listar");
            }
        } catch (SQLException | IOException ex) {
            Logger.getLogger(SucursalController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void obtener(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt( request.getParameter("id"));
            sucursal = modelo.findById(id);
            if (sucursal != null) {
                request.setAttribute("sucursal", sucursal);
                request.getRequestDispatcher("Sucursal/UpdateSucursal.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/error404.jsp");
            }
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(SucursalController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        try{
            listaErrores.clear();
            sucursal = new Sucursal();
            sucursal.setId(Integer.parseInt(request.getParameter("id")));
            sucursal.setCorreo(request.getParameter("correo"));
            sucursal.setTelefono(request.getParameter("telefono"));
            sucursal.setDireccion(request.getParameter("direccion")); 
     
        if(modelo.update(sucursal)>0) {
                response.sendRedirect(request.getContextPath() +"/sucursal.do?op=listar");
            }
    }   catch (SQLException | IOException ex) {
            Logger.getLogger(SucursalController.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt( request.getParameter("id"));
            if (modelo.eliminar(id) > 0) {
                request.setAttribute("exito", "empresa eliminado exitosamente");
                
            } else {
                request.setAttribute("fracaso", "No se puede eliminar esta sucursal");
            }
            request.getRequestDispatcher("/sucursal.do?op=listar").forward(request, response);
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(SucursalController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void nuevo(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listarEmp", empModel.listar());
            request.setAttribute("listarUser", userModel.listar());
            request.getRequestDispatcher("/Sucursal/AddSucursal.jsp").forward(request, response);
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(SucursalController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
