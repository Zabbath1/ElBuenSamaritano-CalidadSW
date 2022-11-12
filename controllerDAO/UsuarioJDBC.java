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
import model.Usuario;
import service.Conexion;

/**
 *
 * @author Omen
 */
public class UsuarioJDBC {
    
    
    private static UsuarioJDBC UsuarioJDBC;
    
    private UsuarioJDBC(){
        
    }
    
    public static UsuarioJDBC instancia(){
        if(UsuarioJDBC == null){
            UsuarioJDBC = new UsuarioJDBC();
        }
        return UsuarioJDBC;
    }
    
    private final String SQL_INSERT ="INSERT INTO Usuarios (usuario, clave) values(?,?)";
    public String insertarUsuario(Usuario Usuario){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_INSERT);
            int index =1; 
            stm.setString(index++,Usuario.getUsuario());
            stm.setString(index++, Usuario.getClave());
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
    
    
    private final String SQL_SELECT_REC = "SELECT usuario, clave FROM Usuarios WHERE usuario=?";
    public Usuario consultarUsuario( String usuario){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        Usuario Usuario=null;
        try{
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT_REC);
            stm.setString(1,usuario);
            rs = stm.executeQuery();
            while(rs.next()){
                Usuario = new Usuario(rs.getString(1), rs.getString(2));
            }
        }catch(SQLException e){
            
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
            Conexion.closed(rs);
        }
        return Usuario;
    }
    
    private final String SQL_UPDATE ="UPDATE Usuarios SET clave=? WHERE usuario=?";
    public String modificarUsuario(Usuario Usuario){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_UPDATE);
            int index =1; 
            stm.setString(index++, Usuario.getClave());
            stm.setString(index++,Usuario.getUsuario());
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
    
    private final String SQL_DELETE ="DELETE FROM Usuarios WHERE usuario=?";
    public String borrarUsuario(String usuario){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_DELETE);
            int index =1; 
            stm.setString(index++,usuario);
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
    
    private final String SQL_SELECT="SELECT usuario, clave  FROM Usuarios ORDER BY usuario";
    public List<Usuario> listarUsuarios(){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        List<Usuario> lista = new ArrayList();
        Usuario Usuario=null;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT);
            rs = stm.executeQuery();
            while(rs.next()){
                Usuario = new Usuario(rs.getString(1), rs.getString(2));
                lista.add(Usuario);
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
