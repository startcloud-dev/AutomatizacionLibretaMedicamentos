/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.TratamientoDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import componentes.Conexion;

/**
 *
 * @author CETECOM
 */
public class TratamientoDaoImp implements TratamientoDao {

    @Override
    public boolean agregar(TratamientoDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "INSERT INTO Tratamiento (Id_tratamiento,duracion,id_reserva)"
                    + "VALUES(?,?,?)";
            PreparedStatement insertar = conexion.prepareStatement(query);

            insertar.setInt(1, dto.getId_tratamiento());
            insertar.setString(2, dto.getDuracion());
            insertar.setInt(3, dto.getId_reserva());
            insertar.execute();
            conexion.commit();
            insertar.close();
            conexion.close();

            return true;
        } catch (SQLException w) {
            System.out.println("Error sql al agregar " + w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al agregar " + e.getMessage());
            return false;
        }

    }

    public boolean eliminar(TratamientoDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "DELETE FROM Tratamiento WHERE  id_tratamiento = ? ";
            PreparedStatement eliminar = conexion.prepareStatement(query);

            eliminar.setInt(1, dto.getId_tratamiento());

            eliminar.execute();
            conexion.commit();
            eliminar.close();
            conexion.close();

            return true;

        } catch (SQLException w) {
            System.out.println("Error al eliminar tratamiento " + w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al eliminar el tratamiento " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean modificar(TratamientoDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "UPDATE Tratamiento SET duracion = ? "
                    + " WHERE Codigo = ? ";
            PreparedStatement modificar = conexion.prepareStatement(query);

            modificar.setString(1, dto.getDuracion());

            modificar.setInt(2, dto.getId_tratamiento());

            modificar.executeUpdate();

            modificar.close();
            conexion.close();

            return true;
        } catch (SQLException w) {
            System.out.println("Error al modifcar el Tratamiento " + w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al modificar " + e.getMessage());
            return false;
        }

    }

    @Override
    public List<TratamientoDto> listar() {
        List<TratamientoDto> lista = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Tratamiento ORDER BY id_tratamiento ASC";
            PreparedStatement listar = conexion.prepareStatement(query);

            ResultSet rs = listar.executeQuery();
            lista = new ArrayList<TratamientoDto>();
            while (rs.next()) {
                TratamientoDto dto = new TratamientoDto();
                dto.setId_tratamiento(rs.getInt("Id_tratamiento"));
                dto.setDuracion(rs.getString("Duracion"));

                lista.add(dto);

            }
            listar.close();
            conexion.close();

        } catch (SQLException w) {
            System.out.println("Error sql al listar los tratamientos" + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al listar los tratamientos ");
        }
        return lista;
    }

}
