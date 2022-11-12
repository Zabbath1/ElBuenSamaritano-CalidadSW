package model;

public abstract class Persona {
    private int id;
    private String nombre;

    // Constructores
    public Persona() {
        this.setId(0);
        this.setNombre("");
    }   
    public Persona(int id, String nombre) {
        this.setId(id);
        this.setNombre(nombre);
    }
    
    //Metodos set
    public void setId(int id) {
        this.id = id;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    // Metodos get
    public int getId() {
        return id;
    }
    public String getNombre() {
        return nombre;
    }

    // Propios
    abstract public String toString();
        
}