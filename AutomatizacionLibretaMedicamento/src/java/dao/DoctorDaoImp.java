/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.DoctorDto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import sql.Conexion;

/**
 *
 * @author leslie
 */
public class DoctorDaoImp implements DoctorDao {

    @Override
    public String validarRut(String rut, String pass) {
        String usuario = "";
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT rut_doctor FROM Doctor WHERE Rut_Doctor = ? and password = ?";
            PreparedStatement session = conexion.prepareStatement(query);
            session.setString(1, rut);
            session.setString(2, pass);
            ResultSet rs = session.executeQuery();
            while (rs.next()) {
                usuario = rs.getString("rut_doctor");
            }
            session.execute();
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error SQL al validar rut " + e.getMessage());
        } catch (Exception w) {
            System.out.println("Error al validar rut " + w.getMessage());
        }
        return usuario;
    }

    @Override
    public String validarPass(String pass, String rut) {
        String clave = "";
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT password FROM Doctor WHERE password =? and rut_doctor =?";
            PreparedStatement session = conexion.prepareStatement(query);
            session.setString(1, pass);
            session.setString(2, rut);
            ResultSet rs = session.executeQuery();
            while (rs.next()) {
                clave = rs.getString("password");
            }
            session.execute();
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error SQL al validar la pass de usuario " + e.getMessage());
        } catch (Exception w) {
            System.out.println("Error al validar la pass de usuario " + w.getMessage());
        }
        return clave;
    }

    @Override
    public boolean agregar(DoctorDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "INSERT INTO Doctor (Rut_Doctor,Nombre,"
                    + "Direccion,Telefono,Especialidad,Password) VALUES (?,?,?,?,?,?)";
            PreparedStatement ingresar = conexion.prepareStatement(query);
            ingresar.setString(1, dto.getRut_doctor());
            ingresar.setString(2, dto.getNombre());
            ingresar.setString(3, dto.getDireccion());
            ingresar.setInt(4, dto.getTelefono());
            ingresar.setString(5, dto.getEspecialidad());
            ingresar.setString(6, dto.getPassword());

            ingresar.execute();
            ingresar.close();
            conexion.close();
            return true;
        } catch (SQLException w) {
            System.out.println("Error SQL al agregar el cliente " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al agregar el cliente " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean eliminar(DoctorDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "DELETE FROM Doctor WHERE rut_doctor = ?";
            PreparedStatement eliminar = conexion.prepareStatement(query);
            eliminar.setString(1, dto.getRut_doctor());
            eliminar.execute();
            eliminar.close();
            conexion.close();
            return true;
        } catch (SQLException e) {
            System.out.println("Error SQL al eliminar " + e.getMessage());
        } catch (Exception w) {
            System.out.println("Error al eliminar " + w.getMessage());
        }
        return false;
    }

    @Override
    public boolean modificar(DoctorDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "UPDATE Doctor SET Nombre = ? , Direccion = ? , Telefono = ? , Especialidad = ? "
                    + "WHERE Rut_Doctor =  ?";
            PreparedStatement actualizar = conexion.prepareStatement(query);

            actualizar.setString(1, dto.getNombre());
            actualizar.setString(2, dto.getDireccion());
            actualizar.setInt(3, dto.getTelefono());
            actualizar.setString(4, dto.getEspecialidad());

            actualizar.executeUpdate();

            actualizar.close();
            conexion.close();

            return true;

        } catch (SQLException w) {
            System.out.println("Error sql al actualizar " + w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al actualizar " + e.getMessage());
            return false;
        }
    }

    @Override
    public List<DoctorDto> listar() {
        List<DoctorDto> lista = new ArrayList<DoctorDto>();
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Farmaceutico ORDER BY Rut_farmaceutico ASC";
            PreparedStatement listar = conexion.prepareStatement(query);
            ResultSet rs = listar.executeQuery();

            while (rs.next()) {
                DoctorDto dto = new DoctorDto();
                dto.setRut_doctor(rs.getString("Rut_Doctor"));
                dto.setNombre(rs.getString("Nombre"));
                dto.setDireccion(rs.getString("Direccion"));
                dto.setTelefono(rs.getInt("Telefono"));
                dto.setEspecialidad(rs.getString("Especialidad"));

                lista.add(dto);
            }
            listar.close();
            conexion.close();

        } catch (SQLException w) {
            System.out.println("Error sql a listar los doctores " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al listar a los doctores  " + e.getMessage());
        }
        return lista;
    }

    @Override
    public String recuperarNombre(String rut) {
        String clave = "";
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT nombre FROM doctor WHERE rut_doctor=?";
            PreparedStatement recup = conexion.prepareStatement(query);
            recup.setString(1, rut);
            ResultSet rs = recup.executeQuery();
            while (rs.next()) {
                clave = rs.getString("nombre");
            }
            recup.execute();
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error SQL al recuperar el nombre " + e.getMessage());
        } catch (Exception w) {
            System.out.println("Error al recuperar el nombre " + w.getMessage());
        }
        return clave;
    }
}
