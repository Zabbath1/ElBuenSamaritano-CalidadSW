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
import model.Cliente;
import service.Conexion;

/**
 *
 * @author Omen
 */
public class ClienteJDBC {
    private static ClienteJDBC clienteJDBC;
    
    private ClienteJDBC(){
    }
    
    public static ClienteJDBC instancia(){
        if(clienteJDBC == null){
            clienteJDBC = new ClienteJDBC();
        }
        return clienteJDBC;
    }
    
    private final String SQL_INSERT ="INSERT INTO clientes (id,nombre,direccion,telefono,ciudad) values(?,?,?)";
    public String insertarCliente(Cliente cliente){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_INSERT);
            int index =1; 
            stm.setInt(index++,cliente.getId());
            stm.setString(index++, cliente.getNombre());
            stm.setString(index++, cliente.getDireccion());
            stm.setString(index++, cliente.getTelefono());
            stm.setString(index++, cliente.getCiudad());
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
    
    
    private final String SQL_SELECT_CAT="SELECT id,nombre,direccion,telefono,ciudad FROM clientes WHERE id=?";
    public Cliente consultarCliente( int id){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        Cliente cliente=null;
        try{
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT_CAT);
            stm.setInt(1,id);
            rs = stm.executeQuery();
            while(rs.next()){
                cliente = new Cliente();
                cliente.setId(rs.getInt(1));
                cliente.setNombre(rs.getString(2));
                cliente.setDireccion(rs.getString(3));
                cliente.setTelefono(rs.getString(4));
                cliente.setCiudad(rs.getString(5));
            }
        }catch(SQLException e){
            
        }finally{
            Conexion.closed(conn);
            Conexion.closed(stm);
            Conexion.closed(rs);
        }
        return cliente;
    }
    
    private final String SQL_UPDATE ="UPDATE clientes SET nombre=?, direccion=?, telefono=?, ciudad=? WHERE id=?";
    public String modificarCliente(Cliente cliente){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_UPDATE);
            int index =1; 
            stm.setString(index++, cliente.getNombre());
            stm.setString(index++, cliente.getDireccion());
            stm.setString(index++, cliente.getTelefono());
            stm.setString(index++, cliente.getCiudad());
            stm.setInt(index++,cliente.getId());
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
    
    private final String SQL_DELETE ="DELETE FROM clientes WHERE id=?";
    public String borrarCliente(int idCliente){
        Connection conn=null;
        PreparedStatement stm=null;
        String mensaje="";
        int row=0;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_DELETE);
            int index =1; 
            stm.setInt(index++,idCliente);
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
    
    private final String SQL_SELECT="SELECT id,nombre,direccion,telefono,ciudad FROM clientes ORDER BY nombre";
    public List<Cliente> listarClientes(){
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        List<Cliente> lista = new ArrayList();
        Cliente cliente=null;
        try{
            
            conn = Conexion.getConnection() ;
            stm = conn.prepareStatement(SQL_SELECT);
            rs = stm.executeQuery();
            while(rs.next()){
                cliente = new Cliente();
                cliente.setId(rs.getInt(1));
                cliente.setNombre(rs.getString(2));
                cliente.setDireccion(rs.getString(3));
                cliente.setTelefono(rs.getString(4));
                cliente.setCiudad(rs.getString(5));
                lista.add(cliente);
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
