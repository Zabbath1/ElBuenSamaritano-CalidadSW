/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static jdk.nashorn.internal.objects.NativeString.toUpperCase;
import model.Producto;
import service.Conexion;

/**
 *
 * @author Omen
 */
public class ProductoJDBC {
    
    
    private static ProductoJDBC productoJDBC;
    
    private ProductoJDBC(){
        
    }
    
    public static ProductoJDBC instancia(){
        if(productoJDBC == null){
            productoJDBC = new ProductoJDBC();
        }
        return productoJDBC;
    }
    
    private final String SQL_INSERT ="INSERT INTO productos (id,nombre,descripcion) values(?,?,?)";
    public String insertarProducto(Producto producto){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_INSERT);
            int index =1; 
            stm.setInt(index++,producto.getId());
            stm.setString(index++, producto.getNombre());
            stm.setString(index++, producto.getDescripcion());
            row = stm.executeUpdate();
            mensaje = "Se inserto " + row +" registro, satisfactoriamente.";
        }catch(SQLException e){
            mensaje = "Error: " + e.getMessage();
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
        }
        return mensaje;
    }
    
    
    private final String SQL_SELECT_CAT="SELECT id, nombre, descripcion, precio, destacado, categoria FROM productos WHERE id=?";
    public Producto consultarProducto( int id){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        Producto producto=null;
        try{
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT_CAT);
            stm.setInt(1,id);
            rs = stm.executeQuery();
            while(rs.next()){
                producto = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5),CategoriaJDBC.instancia().consultarCategoria(rs.getInt(6)));
            }
        }catch(SQLException e){
            
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
            Conexion.closed(rs);
        }
        return producto;
    }
    
    private final String SQL_UPDATE ="UPDATE productos SET nombre=?, descripcion=? WHERE id=?";
    public String modificarProducto(Producto producto){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_UPDATE);
            int index =1; 
            stm.setString(index++, producto.getNombre());
            stm.setString(index++, producto.getDescripcion());
            stm.setInt(index++,producto.getId());
            row = stm.executeUpdate();
            mensaje = "Se actualizó " + row +" registro, satisfactoriamente.";
        }catch(SQLException e){
            mensaje = "Error: " + e.getMessage();
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
        }
        return mensaje;
    }
    
    private final String SQL_DELETE ="DELETE FROM productos WHERE id=?";
    public String borrarProducto(int idProducto){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_DELETE);
            int index =1; 
            stm.setInt(index++,idProducto);
            row = stm.executeUpdate();
            mensaje = "Se elimino " + row +" registro, satisfactoriamente.";
        }catch(SQLException e){
            mensaje = "Error: " + e.getMessage();
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
        }
        return mensaje;
    }
    
    private final String SQL_SELECT="SELECT id, nombre, descripcion, precio, destacado, categoria FROM productos ORDER BY id";
    public List<Producto> listarProductos(){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        List<Producto> lista = new ArrayList();
        Producto producto=null;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT);
            rs = stm.executeQuery();
            while(rs.next()){
                producto = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5),CategoriaJDBC.instancia().consultarCategoria(rs.getInt(6)));
                lista.add(producto);
            }
        }catch(SQLException e){
            
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
            Conexion.closed(rs);
        }
        return lista;
    }  
    
     private final String SQL_SELECT_BUSCAR="SELECT id, nombre, descripcion, precio, destacado, categoria FROM productos WHERE upper(nombre) LIKE ? OR upper(descripcion) LIKE ? ORDER BY nombre";
    public List<Producto> listarProductos(String buscar){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        List<Producto> lista = new ArrayList();
        Producto producto=null;
        try{
            buscar = toUpperCase("%"+buscar+"%");
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT_BUSCAR);
            int index =1; 
            stm.setString(index++,buscar);            
            stm.setString(index++,buscar);      
            rs = stm.executeQuery();
            while(rs.next()){
                producto = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5),CategoriaJDBC.instancia().consultarCategoria(rs.getInt(6)));
                lista.add(producto);
            }
        }catch(SQLException e){
            
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
            Conexion.closed(rs);
        }
        return lista;
    }    

    private final String SQL_SELECT_CATEGORIA="SELECT id, nombre, descripcion, precio, destacado, categoria FROM productos WHERE categoria=? ORDER BY nombre";
    public List<Producto> listarProductos(Integer categoria){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        List<Producto> lista = new ArrayList();
        Producto producto=null;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT_CATEGORIA);
            int index =1; 
            stm.setInt(index++,categoria);
            rs = stm.executeQuery();
            while(rs.next()){
                producto = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), CategoriaJDBC.instancia().consultarCategoria(rs.getInt(6)));
                lista.add(producto);
            }
        }catch(SQLException e){
            
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
            Conexion.closed(rs);
        }
        return lista;
    }
    
    private final String SQL_SELECT_DESTACADOS="SELECT id, nombre, descripcion, precio, destacado, categoria FROM productos WHERE destacado=? ORDER BY id";
    public List<Producto> listarProductosDestacados(){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        List<Producto> lista = new ArrayList();
        Producto producto=null;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT_DESTACADOS);
            int index =1; 
            stm.setInt(index++,1);
            rs = stm.executeQuery();
            while(rs.next()){
                producto = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), CategoriaJDBC.instancia().consultarCategoria(rs.getInt(6)));
                lista.add(producto);
            }
        }catch(SQLException e){
            
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
            Conexion.closed(rs);
        }
        return lista;
    }      
}
