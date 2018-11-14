package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsultasVenta extends Conexion {

    public boolean registrar(Venta nueva) {
        PreparedStatement ps = null;
        Connection con = getConexion();
//      String sql = "INSERT INTO persona (Nombre, Apellido_Paterno, Apellido_Materno , Edad) VALUES(?,?,?,?)";
        String sql = "INSERT INTO persona (status, fecha_venta, id_cliente, id_usuario, total) VALUES(?,?,?,?,?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, nueva.getStatus());
            ps.setString(2, nueva.getFecha_venta());
            ps.setInt(3, nueva.getId_cliente());
            ps.setInt(4, nueva.getId_usuario());
            ps.setFloat(5, nueva.getTotal());

            
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.err.println(e);
            }
        }
    }
    
    public boolean modificar(Venta actualizada) {
        PreparedStatement ps = null;
        Connection con = getConexion();

        //String sql = "INSERT INTO persona (status, fecha_venta, id_cliente, id_usuario, total) VALUES(?,?,?,?,?)";
        String sql = "UPDATE persona SET status=?, fecha_venta=?, id_cliente=?, id_usuario=?, total=? WHERE id_venta=? ";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, actualizada.getStatus());
            ps.setString(2, actualizada.getFecha_venta());
            ps.setInt(3, actualizada.getId_cliente());
            ps.setInt(4, actualizada.getId_usuario());
            ps.setFloat(5, actualizada.getTotal());
                        
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.err.println(e);
            }
        }
    }

    public boolean eliminar(Venta eliminada) {
        PreparedStatement ps = null;
        Connection con = getConexion();

        String sql = "DELETE FROM persona WHERE id_venta=? ";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, eliminada.getId());
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.err.println(e);
            }
        }
    }
    
    public boolean buscar(Venta buscada) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConexion();

        String sql = "SELECT * FROM persona WHERE id_venta=? ";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, buscada.getId());
            rs = ps.executeQuery();
            
            if(rs.next())
            {                        
               buscada.setId(Integer.parseInt(rs.getString("id_venta")));
               buscada.setStatus(rs.getString("status"));
               buscada.setFecha_venta(rs.getString("fecha_venta"));
               buscada.setId_cliente(Integer.parseInt(rs.getString("id_cliente")));
               buscada.setId_usuario(Integer.parseInt(rs.getString("id_usuario")));
               buscada.setTotal(Float.parseFloat(rs.getString("total")));
                              
               return true;
            }
            return false;
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.err.println(e);
            }
        }
    }
}
