package model;

import java.util.StringTokenizer;

public class Cliente extends Persona {
    private String direccion;
    private String telefono;
    private String ciudad;

    //Constructor
    public Cliente() {
        super(0, "");
        this.setDireccion("");
        this.setTelefono("");
        this.setCiudad("");        
    }
    public Cliente(String direccion, String telefono, String ciudad) {
        this.setDireccion(direccion);
        this.setTelefono(telefono);
        this.setCiudad(ciudad);
    }
    public Cliente(String direccion, String telefono, String ciudad, int id, String nombre) {
        this.setDireccion(direccion);
        this.setTelefono(telefono);
        this.setCiudad(ciudad);
    }

    // Metdoos set
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }    

    // Metodos get
    public String getDireccion() {
        return direccion;
    }
    public String getTelefono() {
        return telefono;
    }
    public String getCiudad() {
        return ciudad;
    }

    @Override
    public String toString() {
        return this.getId()+" "+this.getNombre()+" "+this.getDireccion()+" "+this.getTelefono()+" "+this.getCiudad();
    }


}