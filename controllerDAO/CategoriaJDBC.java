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
import model.Categoria;
import service.Conexion;

/**
 *
 * @author Omen
 */
public class CategoriaJDBC {
    private static CategoriaJDBC categoriaJDBC;
    
    private CategoriaJDBC(){
    }
    
    public static CategoriaJDBC instancia(){
        if(categoriaJDBC == null){
            categoriaJDBC = new CategoriaJDBC();
        }
        return categoriaJDBC;
    }
    
    private final String SQL_INSERT ="INSERT INTO categorias (id,nombre,descripcion) values(?,?,?)";
    public String insertarCategoria(Categoria categoria){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_INSERT);
            int index =1; 
            stm.setInt(index++,categoria.getId());
            stm.setString(index++, categoria.getNombre());
            stm.setString(index++, categoria.getDescripcion());
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
    
    
    private final String SQL_SELECT_CAT="SELECT id,nombre,descripcion FROM categorias WHERE id=?";
    public Categoria consultarCategoria( int id){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        Categoria categoria=null;
        try{
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT_CAT);
            stm.setInt(1,id);
            rs = stm.executeQuery();
            while(rs.next()){
                categoria = new Categoria();
                categoria.setId(rs.getInt(1));
                categoria.setNombre(rs.getString(2));
                categoria.setDescripcion(rs.getString(3));
            }
        }catch(SQLException e){
            
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
            Conexion.closed(rs);
        }
        return categoria;
    }
    
    private final String SQL_UPDATE ="UPDATE categorias SET nombre=?, descripcion=? WHERE id=?";
    public String modificarCategoria(Categoria categoria){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_UPDATE);
            int index =1; 
            stm.setString(index++, categoria.getNombre());
            stm.setString(index++, categoria.getDescripcion());
            stm.setInt(index++,categoria.getId());
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
    
    private final String SQL_DELETE ="DELETE FROM categorias WHERE id=?";
    public String borrarCategoria(int idCategoria){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_DELETE);
            int index =1; 
            stm.setInt(index++,idCategoria);
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
    
    private final String SQL_SELECT="SELECT id,nombre,descripcion FROM categorias ORDER BY nombre";
    public List<Categoria> listarCategorias(){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        List<Categoria> lista = new ArrayList();
        Categoria categoria=null;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT);
            rs = stm.executeQuery();
            while(rs.next()){
                categoria = new Categoria();
                categoria.setId(rs.getInt(1));
                categoria.setNombre(rs.getString(2));
                categoria.setDescripcion(rs.getString(3));
                lista.add(categoria);
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
