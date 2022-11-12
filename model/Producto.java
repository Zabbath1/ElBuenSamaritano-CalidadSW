/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Omen
 */
public class Producto {
    private int id;
    private String nombre;
    private String descripcion;
    private Double precio;
    private boolean destacado;
    private Categoria categoria;

    public Producto() {
    }

    public Producto(int id, String nombre, String descripcion, Double precio, boolean destacado, Categoria categoria) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.destacado = destacado;
        this.categoria = categoria;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public void setDestacado(boolean destacado) {
        this.destacado = destacado;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Double getPrecio() {
        return precio;
    }

    public boolean isDestacado() {
        return destacado;
    }

    public Categoria getCategoria() {
        return categoria;
    }
    
    
}
