/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Omen
 */
public class Carrito {

    private List<CarritoItem> items;

    public Carrito() {
        items = new ArrayList();
    }

    public List<CarritoItem> getItems() {
        return this.items;
    }

    public void agergarProducto(Producto producto, int cantidad) {
        Integer cantidadAux = 0;
        for (CarritoItem item : items) {
            if (item.getProducto().getId() == producto.getId()) {
                item.setCantidad(item.getCantidad() + cantidad);
                cantidadAux = item.getCantidad();
            }
        }
        if (cantidadAux == 0) {
            CarritoItem itemNew = new CarritoItem(producto, cantidad);
            this.items.add(itemNew);
        }
    }

    public Integer conteoProductos() {
        Integer productos = 0;
        for (CarritoItem item : items) {
            productos += item.getCantidad();
        }
        return productos;
    }

    public double totalPrecio() {
        Double total = 0.0;
        for (CarritoItem item : items) {
            total += (item.getCantidad() * item.getProducto().getPrecio());
        }
        return total;
    }
}
