
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
import sv.edu.udb.model.RolesModel;
import sv.edu.udb.pojo.Roles;
import sv.edu.udb.www.utils.Validaciones;

/**
 *
 * @author Edal Bonilla
 */
@WebServlet(name = "RolesController", urlPatterns = {"/roles.do"})
public class RolesController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    RolesModel modelo = new RolesModel();
    Roles rol = null;
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
                    request.getRequestDispatcher("/Rol/AddRol.jsp").forward(request, response);
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
            request.setAttribute("listaRoles", modelo.listar());
            request.getRequestDispatcher("/Rol/GetRol.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(RolesController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException  {
        
        try {
            listaErrores.clear();
            rol = new Roles();
            rol.setNombre(request.getParameter("nombre"));
            rol.setDescripcion(request.getParameter("descripcion"));
            
            System.out.println(rol.getNombre());
            System.out.println(rol.getDescripcion());
            
            if (Validaciones.isEmpty(rol.getNombre())) {
                listaErrores.add("El Nombre es Obligatorio");
            } 
            if (Validaciones.isEmpty(rol.getDescripcion())) {
                listaErrores.add("La descripcion es obligatoria");
            }
            if (listaErrores.size() > 0) {
                request.setAttribute("listaErrores", listaErrores);
                request.setAttribute("rol", rol);
                request.getRequestDispatcher("roles.do?op=nuevo").forward(request, response);
                
            } else
            
            if (modelo.insertar(rol)>0) {
                response.sendRedirect(request.getContextPath() +"/roles.do?op=listar");
            }
        } catch (SQLException | IOException ex) {
            Logger.getLogger(RolesController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void obtener(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt( request.getParameter("id"));
            rol = modelo.findById(id);
            if (rol != null) {
                request.setAttribute("rol", rol);
                request.getRequestDispatcher("Rol/UpdateRol.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/error404.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RolesController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(RolesController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ServletException ex) {
            Logger.getLogger(RolesController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
       try {
       listaErrores.clear();
       rol = new Roles();
       rol.setId(Integer.parseInt(request.getParameter("id")));
       rol.setNombre(request.getParameter("nombre"));
       rol.setDescripcion(request.getParameter("descripcion"));
           System.out.println(rol.getId());
           System.out.println(rol.getNombre());
       
        if (Validaciones.isEmpty(rol.getNombre())) {
                listaErrores.add("El Nombre es Obligatorio");
            } 
            if (Validaciones.isEmpty(rol.getDescripcion())) {
                listaErrores.add("La descripcion es obligatoria");
            }
            if (listaErrores.size() > 0) {
                request.setAttribute("listaErrores", listaErrores);
                request.setAttribute("rol", rol);
                request.getRequestDispatcher("roles.do?op=modificar").forward(request, response);
                
            } else
            
            if (modelo.update(rol)>0) {
                response.sendRedirect(request.getContextPath() +"/roles.do?op=listar");
            }
            } catch (SQLException | IOException | ServletException ex) {
            Logger.getLogger(RolesController.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt( request.getParameter("id"));
            if (modelo.eliminar(id) > 0) {
                request.setAttribute("exito", "genero eliminado exitosamente");
                
            } else {
                request.setAttribute("fracaso", "No se puede eliminar este genero");
            }
            request.getRequestDispatcher("/generos.do?op=listar").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(RolesController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
