/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerDAO.ProductoJDBC;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Carrito;
import model.CarritoItem;
import model.Producto;

/**
 *
 * @author Omen
 */
@WebServlet(name = "carrito", urlPatterns = {"/carrito"})
public class CarritoPageCtrl extends HttpServlet {

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
        Carrito carrito = (Carrito) session.getAttribute("carrito");
        Integer idProducto = 0;
        String accion = "";
        try {
            idProducto = Integer.parseInt(request.getParameter("idProducto"));
        } catch (Exception excepcion) {
        }

        try {
            accion = (String) request.getParameter("accion");
        } catch (Exception excepcion) {
        }

        switch (accion) {
            case "agregar":
                Producto producto = ProductoJDBC.instancia().consultarProducto(idProducto);
                if (producto != null) {
                    carrito.agergarProducto(producto, 1);
                    session.setAttribute("carrito", carrito);

                    try (PrintWriter out = response.getWriter()) {
                        List<CarritoItem> items = carrito.getItems();
                        out.println("<table class=\"table\">\n"
                                + "  <thead>\n"
                                + "    <tr>\n"
                                + "      <th scope=\"col\">#</th>\n"
                                + "      <th scope=\"col\">Producto</th>\n"
                                + "      <th scope=\"col\">Cantidad</th>\n"
                                + "      <th scope=\"col\">Precio</th>\n"
                                + "    </tr>\n"
                                + "  </thead><tbody>");
                        for (CarritoItem item : items) {
                            out.println(" <tr>\n"
                                    + "      <th scope=\"row\">" + item.getProducto().getId() + "</th>\n"
                                    + "      <td>" + item.getProducto().getNombre() + "</td>\n"
                                    + "      <td>" + item.getCantidad() + "</td>\n"
                                    + "      <td>$" + item.getProducto().getPrecio() + "</td>\n"
                                    + "    </tr>");
                        }
                        out.println("</tbody><tfoot>\n"
                                + "    <tr>\n"
                                + "      <th scope=\"col\"></th>\n"
                                + "      <th scope=\"col\"></th>\n"
                                + "      <th scope=\"col\"></th>\n"
                                + "      <th scope=\"col\">" + String.format("%,.2f", carrito.totalPrecio()) + "</th>\n"
                                + "    </tr>\n"
                                + "  </tfoot></table>");
                    }
                }
                break;
                
            case "conteo":
                try (PrintWriter out = response.getWriter()) {
                    out.println(carrito.conteoProductos());
                }
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
