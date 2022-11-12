/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerDAO.UsuarioJDBC;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author Omen
 */
@WebServlet(name = "IndexAdminPageCtrl", urlPatterns = {"/admin-index"})
public class IndexAdminPageCtrl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String accion = "";
        try {
            accion = (String) request.getParameter("accion");
        } catch (Exception excepcion) {
            accion = "";
        }
        accion = (accion == null ? "" : accion);
        
        request.setAttribute("tabla", accion); 
        switch (accion) {
            case "categorias":
                request.getRequestDispatcher("WEB-INF/pages/admin-tablas.jsp").forward(request, response);
                break;

            case "clientes":
                request.getRequestDispatcher("WEB-INF/pages/admin-tablas.jsp").forward(request, response);
                break;

            case "productos":
                request.getRequestDispatcher("WEB-INF/pages/admin-tablas.jsp").forward(request, response);
                break;

            case "usuarios":
                request.getRequestDispatcher("WEB-INF/pages/admin-tablas.jsp").forward(request, response);
                break;

            case "ventas":
                request.getRequestDispatcher("WEB-INF/pages/admin-tablas.jsp").forward(request, response);
                break;

            case "entrar":
                Boolean loginAdmin = false;
                String estado="";
                String user = "";
                try {
                    user = (String) request.getParameter("usuario");
                } catch (Exception excepcion) {
                    user = "";
                }
                user = (user == null ? "" : user); 
                
                String password = "";
                try {
                    password = (String) request.getParameter("clave");
                } catch (Exception excepcion) {
                    password = "";
                }
                password = (password == null ? "" : password);                 
                
                Usuario usuario = UsuarioJDBC.instancia().consultarUsuario(user);
                if(usuario!= null){
                    loginAdmin = (usuario.getClave().equals(password));
                    estado = (loginAdmin==true?"":"Clave incorreta");
                }else{
                    estado="No se encontro el usuario "+user;
                }
                session.setAttribute("loginAdmin", loginAdmin);
                session.setAttribute("estado", estado);
                request.getRequestDispatcher("WEB-INF/pages/admin-index.jsp").forward(request, response);
                break;

            case "salir":
                session.setAttribute("loginAdmin", false);
                request.getRequestDispatcher("WEB-INF/pages/admin-index.jsp").forward(request, response);
                break;                
                
            default:
                request.getRequestDispatcher("WEB-INF/pages/admin-index.jsp").forward(request, response);
                break;
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

}
