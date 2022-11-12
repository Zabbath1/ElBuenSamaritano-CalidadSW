/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerDAO.CategoriaJDBC;
import controllerDAO.ClienteJDBC;
import controllerDAO.ProductoJDBC;
import controllerDAO.UsuarioJDBC;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Categoria;
import model.Cliente;
import model.Producto;
import model.Usuario;

/**
 *
 * @author Omen
 */
@WebServlet(name = "TablasPageCtrl", urlPatterns = {"/TablasPageCtrl"})
public class TablasPageCtrl extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String accion = "";
            String tabla = "";
            String registros = "";
            Integer total = 0;

            try {
                accion = (String) request.getParameter("accion");
            } catch (Exception excepcion) {
                accion = "";
            }
            accion = (accion == null ? "" : accion);

            try {
                tabla = (String) request.getParameter("tabla");
            } catch (Exception excepcion) {
                tabla = "";
            }
            tabla = (tabla == null ? "" : tabla);

            switch (accion) {
                case "listar":

                    switch (tabla) {
                        case "categorias":
                            List<Categoria> categorias = CategoriaJDBC.instancia().listarCategorias();
                            registros = "";
                            total = 0;
                            if (categorias != null) {
                                for (Categoria categoria : categorias) {
                                    registros += (registros.length() > 0 ? ", " : "") + "{\"id\":" + categoria.getId() + ",\"nombre\":\"" + categoria.getNombre() + "\",\"descripcion\":\"" + categoria.getDescripcion() + "\"}";
                                }
                                total = categorias.size();
                            }
                            out.println("{\"total\":" + total + ",\"totalNotFiltered\":" + total + ",\"rows\":[" + registros + "],\"status\":\"allow\"}");
                            break;
                            
                        case "productos":
                            List<Producto> productos = ProductoJDBC.instancia().listarProductos();
                            registros = "";
                            total = 0;
                            if (productos != null) {
                                for (Producto producto : productos) {
                                    registros += (registros.length() > 0 ? ", " : "") + "{\"id\":" + producto.getId() + ",\"nombre\":\"" + producto.getNombre() + "\",\"descripcion\":\"" + producto.getDescripcion() + "\",\"precio\":" + producto.getPrecio()+",\"categoriaId\":" + producto.getCategoria().getId() +",\"categoriaNombre\":\"" + producto.getCategoria().getNombre() + "\" }";
                                }
                                total = productos.size();
                            }
                            out.println("{\"total\":" + total + ",\"totalNotFiltered\":" + total + ",\"rows\":[" + registros + "],\"status\":\"allow\"}");
                            break;  
                            
                        case "usuarios":
                            List<Usuario> usuarios = UsuarioJDBC.instancia().listarUsuarios();
                            registros = "";
                            total = 0;
                            if (usuarios != null) {
                                for (Usuario usuario : usuarios) {
                                    registros += (registros.length() > 0 ? ", " : "") + "{\"id\":\"" + usuario.getUsuario()+ "\",\"usuario\":\"" + usuario.getUsuario()+ "\",\"clave\":\"" + usuario.getClave() + "\"}";
                                }
                                total = usuarios.size();
                            }
                            out.println("{\"total\":" + total + ",\"totalNotFiltered\":" + total + ",\"rows\":[" + registros + "],\"status\":\"allow\"}");
                            break;   
                            
                            
                        case "clientes":
                            List<Cliente> clientes = ClienteJDBC.instancia().listarClientes();
                            registros = "";
                            total = 0;
                            if (clientes != null) {
                                for (Cliente cliente : clientes) {
                                    registros += (registros.length() > 0 ? ", " : "") + "{\"id\":\"" + cliente.getId()+ "\",\"nombre\":\"" + cliente.getNombre()+ "\",\"direccion\":\"" + cliente.getDireccion() + "\",\"telefono\":\"" + cliente.getTelefono()+ "\",\"ciudad\":\"" + cliente.getCiudad() + "\"}";
                                }
                                total = clientes.size();
                            }
                            out.println("{\"total\":" + total + ",\"totalNotFiltered\":" + total + ",\"rows\":[" + registros + "],\"status\":\"allow\"}");
                            break;                                
                    }

                    break;
                default:
                    out.println("{\"total\":0,\"totalNotFiltered\":0,\"rows\":[],\"status\":\"allow\"}");
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

}
