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

import sv.edu.udb.model.EmpresaModel;

import sv.edu.udb.pojo.Empresa;

import sv.edu.udb.www.utils.Validaciones;

/**
 *
 * @author Edal Bonilla
 */
@WebServlet(name = "EmpresaModel", urlPatterns = {"/empresa.do"})
public class EmpresaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    EmpresaModel modelo = new EmpresaModel();
    Empresa empresa = null;
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
                    request.getRequestDispatcher("/Empresa/AddEmpresa.jsp").forward(request, response);
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

     private void insertar(HttpServletRequest request, HttpServletResponse response){
    
        try{
            empresa = new Empresa();
            empresa.setNombre(request.getParameter("nombre")); 
            empresa.setEstado(request.getParameter("estado"));
            empresa.setPorcentaje(Integer.parseInt(request.getParameter("porcentaje")));
    
        if (modelo.insertar(empresa)>0) {
                response.sendRedirect(request.getContextPath() +"/empresa.do?op=listar");
            }
   }    catch (SQLException | IOException ex) {
            Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  

    private void obtener(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt( request.getParameter("id"));
            empresa = modelo.findById(id);
            if (empresa != null) {
                request.setAttribute("empresa", empresa);
                request.getRequestDispatcher("Empresa/UpdateEmpresa.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/error404.jsp");
            }
        } catch (IOException | ServletException | SQLException ex) {
            Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        try{
            listaErrores.clear();
            empresa = new Empresa();
            empresa.setId(Integer.parseInt(request.getParameter("id")));
            empresa.setNombre(request.getParameter("nombre")); 
            empresa.setEstado(request.getParameter("estado"));
            empresa.setPorcentaje(Integer.parseInt(request.getParameter("porcentaje")));
     
        if(modelo.update(empresa)>0) {
                response.sendRedirect(request.getContextPath() +"/empresa.do?op=listar");
            }
    }   catch (IOException | SQLException ex) {
            Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt( request.getParameter("id"));
            if (modelo.eliminar(id) > 0) {
                request.setAttribute("exito", "empresa eliminado exitosamente");
                
            } else {
                request.setAttribute("fracaso", "No se puede eliminar este rol");
            }
            request.getRequestDispatcher("/empresa.do?op=listar").forward(request, response);
        } catch (ServletException | IOException | SQLException ex) {
            Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listarEmpresa", modelo.listar());
            request.getRequestDispatcher("/Empresa/GetEmpresa.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        //To change body of generated methods, choose Tools | Templates.
        
             //To change body of generated methods, choose Tools | Templates.
    }

}
