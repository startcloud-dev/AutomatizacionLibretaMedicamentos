/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ReservaDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import componentes.Conexion;
import java.util.Date;

/**
 *
 * @author LeslieK
 */
public class ReservaDaoImp implements ReservaDao {

    @Override
    public boolean agregar(ReservaDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "INSERT INTO Reserva (Id_reserva,Fecha_inicio,"
                    + "Fecha_termino,Rut_paciente,Id_tratamiento,Rut_farmaceutico,Estado,Codigo) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement ingresar = conexion.prepareStatement(query);
            ingresar.setInt(1, dto.getId_reserva());
            ingresar.setDate(2,
                    new java.sql.Date(dto.getFecha_inicio().getTime()));
            ingresar.setDate(3,
                    new java.sql.Date(dto.getFecha_termino().getTime()));
            ingresar.setString(4, dto.getRut_paciente());
            ingresar.setInt(5, dto.getId_tratamiento());
            ingresar.setString(6, dto.getRut_farmaceutico());
            ingresar.setString(7, dto.getEstado());
            ingresar.setInt(8, dto.getCodigo());

            ingresar.execute();
            ingresar.close();
            conexion.close();
            return true;
        } catch (SQLException w) {
            System.out.println("Error SQL al agregar la reserva " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al agregar la reserva " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean eliminar(ReservaDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "DELETE FROM Reserva WHERE Id_reserva = ?";
            PreparedStatement eliminar = conexion.prepareStatement(query);
            eliminar.setInt(1, dto.getId_reserva());
            eliminar.execute();
            eliminar.close();
            conexion.close();
            return true;
        } catch (SQLException e) {
            System.out.println("Error SQL al eliminar reserva " + e.getMessage());
        } catch (Exception w) {
            System.out.println("Error al eliminar reserva " + w.getMessage());
        }
        return false;
    }

    @Override
    public boolean modificar(ReservaDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "UPDATE Reserva SET Estado=?";
            PreparedStatement mod = conexion.prepareStatement(query);
            
            mod.setString(1, dto.getEstado());

            return mod.execute();
        } catch (SQLException w) {
            System.out.println("Error SQL al modificar " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al modificar " + e.getMessage());
        }
        return false;
    }

    @Override
    public List<ReservaDto> listar() {
        List<ReservaDto> lista = new ArrayList<ReservaDto>();
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Reserva ORDER BY Id_reserva ASC";
            PreparedStatement listar = conexion.prepareStatement(query);
            ResultSet rs = listar.executeQuery();

            while (rs.next()) {
                ReservaDto dto = new ReservaDto();
                dto.setId_reserva(rs.getInt("Id_reserva"));
                dto.setFecha_inicio(rs.getDate("Fecha_inicio"));
                dto.setFecha_termino(rs.getDate("Fecha_termino"));
                dto.setRut_paciente(rs.getString("Rut_paciente"));
                dto.setId_tratamiento(rs.getInt("Id_tratamiento"));
                dto.setRut_farmaceutico(rs.getString("Rut_farmaceutico"));
                dto.setEstado(rs.getString("Estado"));
                dto.setCodigo(rs.getInt("Codigo"));

                lista.add(dto);
            }
            listar.close();
            conexion.close();

        } catch (SQLException w) {
            System.out.println("Error sql listar las reservas " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al listar las reservas   " + e.getMessage());
        }
        return lista;
    }

    public ReservaDto buscarPorKey(ReservaDto dto) {
        ReservaDto dtoMeet = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Reserva WHERE Id_reserva=?";
            PreparedStatement buscar = conexion.prepareStatement(query);
            buscar.setInt(1, dto.getId_reserva());
            ResultSet rs = buscar.executeQuery();
            while (rs.next()) {
                dtoMeet = new ReservaDto();
                dtoMeet.setId_reserva(rs.getInt("Id_reserva"));
                dtoMeet.setFecha_inicio(rs.getDate("Fecha_inicio"));
                dtoMeet.setFecha_termino(rs.getDate("Fecha_termino"));
                dtoMeet.setRut_paciente(rs.getString("Rut_paciente"));
                dtoMeet.setId_tratamiento(rs.getInt("Id_tratamiento"));
                dtoMeet.setRut_farmaceutico(rs.getString("Rut_farmaceutico"));
                dtoMeet.setEstado(rs.getString("Estado"));
                dtoMeet.setCodigo(rs.getInt("Codigo"));
            }
            buscar.close();
            conexion.close();
        } catch (SQLException w) {
            System.out.println("Error SQL al buscar " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al buscar " + e.getMessage());
        }
        return dtoMeet;
    }

    public  static Date traerFechaTermino(){
       Date fechaSalida = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT Fecha_termino FROM Reserva WHERE id_reserva = 1";
            PreparedStatement traer = conexion.prepareStatement(query);
            
            ResultSet rs = traer.executeQuery();
            
            while(rs.next()){       
                fechaSalida = rs.getDate("Fecha_termino");  
            }
            traer.close();
            conexion.close();
            
        }catch(SQLException w){
            System.out.println("Error sql al traer la fecha de termino "+w.getMessage());
            w.printStackTrace();
        } catch (Exception e) {
            System.out.println("Error al traer la fceha de termino "+e.getMessage());
            e.printStackTrace();
            
        
        }
        
        return  fechaSalida; 
    }
    
    
        public boolean modificarEstado(String estado, int id) {

        try {
            Connection conexion = Conexion.getConexion();
            String query = "UPDATE Reserva SET Estado=? where id_reserva=?";
            PreparedStatement mod = conexion.prepareStatement(query);

            mod.setString(1, estado);
            mod.setInt(2, id);

            return mod.execute();
        } catch (SQLException w) {
            System.out.println("Error SQL al modificar " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al modificar " + e.getMessage());
        }
        return false;
    }
    
}
