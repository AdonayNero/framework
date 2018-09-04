/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import sv.edu.udb.model.UsuarioModel;
import sv.edu.udb.pojo.Usuario;

/**
 *
 * @author Edal Bonilla
 */
@WebServlet(name = "UsuarioController", urlPatterns = {"/usuario.do"})
public class UsuarioController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UsuarioModel modelo = new UsuarioModel();
    Usuario user =  null;
    RolesModel rolModelo = new RolesModel();
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
            request.setAttribute("listaUsuario", modelo.listar());
            request.getRequestDispatcher("/Usuario/GetUsuario.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) {
        
                
        try {
            listaErrores.clear();
            user = new Usuario();
            user.setNombre(request.getParameter("nombre"));
            user.setTelefono(request.getParameter("telefono"));
            user.setEmail(request.getParameter("email"));
            user.setPass(request.getParameter("pass"));
            user.setTipoAcceso( Integer.parseInt(request.getParameter("tipoAcceso")));
            user.setFoto(request.getParameter("foto"));
            user.setDui(request.getParameter("dui"));
            user.setDireccion(request.getParameter("direccion"));
            if (modelo.insertar(user)>0) {
                response.sendRedirect(request.getContextPath() +"/usuario.do?op=listar");
            }
        } catch (SQLException | IOException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private void obtener(HttpServletRequest request, HttpServletResponse response) {
       try {
            int id = Integer.parseInt( request.getParameter("id"));
            System.out.println("mi id" +id);
            user = modelo.findById(id);
            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("Usuario/UpdateUsuario.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/error404.jsp");
            }
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
         try {
        listaErrores.clear();
        user = new Usuario();
        user.setId(Integer.parseInt(request.getParameter("id")));
        user.setNombre(request.getParameter("nombre"));
        user.setTelefono(request.getParameter("telefono"));
        user.setEmail(request.getParameter("email"));
        user.setDui(request.getParameter("dui"));
        user.setDireccion(request.getParameter("direccion"));
       
         if (modelo.update(user)>0) {
                response.sendRedirect(request.getContextPath() +"/usuario.do?op=listar");
            }else{
             response.sendRedirect(request.getContextPath() +"/usuario.do?op=listar");
         }} catch (SQLException | IOException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
       try {
            int id = Integer.parseInt( request.getParameter("id"));
            if (modelo.eliminar(id) > 0) {
                request.setAttribute("exito", "usuario eliminado exitosamente");
                
            } else {
                request.setAttribute("fracaso", "No se puede eliminar este usuario");
            }
            request.getRequestDispatcher("/usuario.do?op=listar").forward(request, response);
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void nuevo(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listaRoles", rolModelo.listar());
            request.getRequestDispatcher("/Usuario/AddUsuario.jsp").forward(request, response);
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
