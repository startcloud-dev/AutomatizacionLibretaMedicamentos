/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RecetaDto;
import java.util.List;
import componentes.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import componentes.Conexion;
import dto.DoctorDto;
import dto.TratamientoDto;
import java.util.Date;

/**
 *
 * @author LeslieK
 */
public class RecetaDaoImp implements RecetaDao {

    @Override
    public boolean agregar(RecetaDto dto) {
         try {
            Connection conexion = Conexion.getConexion();
            String query = "INSERT INTO Receta (Fecha_Emision,"
                    + "Indicaciones,Codigo) VALUES (?,?,?)";
            PreparedStatement ingresar = conexion.prepareStatement(query);
            ingresar.setDate(1,
                    new java.sql.Date(dto.getFecha_emision().getTime()));
            ingresar.setString(2, dto.getIndicaciones());
            ingresar.setInt(3, dto.getCodigo());
            ingresar.execute();
            ingresar.close();
            conexion.close();
            return true;
        } catch (SQLException w) {
            System.out.println("Error SQL al agregar la receta " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al agregar la receta " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean eliminar(RecetaDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "DELETE FROM Receta WHERE Id_receta = ?";
            PreparedStatement eliminar = conexion.prepareStatement(query);
            eliminar.setInt(1, dto.getId_receta());
            eliminar.execute();
            eliminar.close();
            conexion.close();
            return true;
        } catch (SQLException e) {
            System.out.println("Error SQL al eliminar receta " + e.getMessage());
        } catch (Exception w) {
            System.out.println("Error al eliminar receta " + w.getMessage());
        }
        return false;
    }

    @Override
    public boolean modificar(RecetaDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "UPDATE Receta SET Fecha_Emision = ? , "
                    + "Indicaciones  = ? , "
                    + " Codigo = ? "
                    + " WHERE Id_receta = ? ";
            PreparedStatement modificar = conexion.prepareStatement(query);

            modificar.setDate(1,
                    new java.sql.Date(dto.getFecha_emision().getTime()));
            modificar.setString(2, dto.getIndicaciones());
            modificar.setInt(3, dto.getCodigo());
            modificar.setInt(4, dto.getId_receta());

            modificar.executeUpdate();

            modificar.close();
            conexion.close();

            return true;
        } catch (SQLException w) {
            System.out.println("Error sql al modifcar Receta  " + w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al modificar  " + e.getMessage());
            return false;
        }
    }

    @Override
    public List<RecetaDto> listar() {
        List<RecetaDto> lista = new ArrayList<RecetaDto>();
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Receta ORDER BY Id_receta ASC";
            PreparedStatement listar = conexion.prepareStatement(query);
            ResultSet rs = listar.executeQuery();

            while (rs.next()) {
                RecetaDto dto = new RecetaDto();
                dto.setId_receta(rs.getInt("Id_receta"));
                dto.setFecha_emision(rs.getDate("Fecha_Emision"));
                dto.setCodigo(rs.getInt("Codigo"));
                dto.setIndicaciones(rs.getString("Indicaciones"));
                
                lista.add(dto);

            }
            listar.close();
            conexion.close();

        } catch (SQLException w) {
            System.out.println("Error sql a listar las recetas " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al listar a las recetas " + e.getMessage());
        }
        return lista;
    }

    @Override
    public List<RecetaDto> listarRecetasPendientes(String rutPaciente) {
        List<RecetaDto> lista = new ArrayList<RecetaDto>();
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT Receta.Id_receta, Receta.Fecha_Emision , Receta.Indicaciones, Receta.Codigo "
                    + "FROM Receta,Consulta " + " WHERE Receta.Id_Receta=Consulta.Id_Receta AND "
                    + "Consulta.Rut_Paciente = ?";
            PreparedStatement listar = conexion.prepareStatement(query);

            listar.setString(1, rutPaciente);

            ResultSet rs = listar.executeQuery();

            while (rs.next()) {
                RecetaDto dto = new RecetaDto();
                dto.setId_receta(rs.getInt("Id_receta"));
                dto.setFecha_emision(rs.getDate("Fecha_Emision"));
                dto.setIndicaciones(rs.getString("Indicaciones"));
                dto.setCodigo(rs.getInt("Codigo"));
                lista.add(dto);
            }
            listar.close();
            conexion.close();

        } catch (SQLException w) {
            w.printStackTrace();
            System.out.println("Error sql listar Las recetas por rut paciente " + w.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al listar las recetas por rut de paciente " + e.getMessage());
        }

        return lista;
    }
    
    public List<RecetaDto> listarRecetasPorId(int id) {
        List<RecetaDto> lista = new ArrayList<RecetaDto>();
     
        try {
            Connection conexion = Conexion.getConexion();
            String query ="SELECT * FROM Receta where id_receta=?";
            PreparedStatement listar = conexion.prepareStatement(query);

            listar.setInt(1, id);

            ResultSet rs = listar.executeQuery();

            while (rs.next()) {
               
                RecetaDto dto = new RecetaDto();
                dto.setId_receta(rs.getInt("Id_receta"));
                dto.setFecha_emision(rs.getDate("Fecha_Emision"));
                dto.setIndicaciones(rs.getString("Indicaciones"));
                dto.setCodigo(rs.getInt("Codigo"));
                lista.add(dto);        
                            
            }
            listar.close();
            conexion.close();

        } catch (SQLException w) {
            w.printStackTrace();
            System.out.println("Error sql listar Las recetas por id " + w.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al listar las recetas por id " + e.getMessage());
        }

        return lista;
    }

}
