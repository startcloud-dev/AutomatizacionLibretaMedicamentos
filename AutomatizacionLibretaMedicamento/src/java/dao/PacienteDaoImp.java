/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.PacienteDto;
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
public class PacienteDaoImp implements PacienteDao{

    @Override
    public boolean agregar(PacienteDto dto) {
          try {
            Connection conexion = Conexion.getConexion();
            String query = "INSERT INTO Paciente (Rut_Paciente,Nombre,Apellido_Paterno,Apellido_Materno "
                    + ",Direccion,Telefono,Correo,Fecha_Nacimiento,id_reserva) "
                    + " VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement insertar = conexion.prepareStatement(query);

            insertar.setString(1, dto.getRut_paciente());
            insertar.setString(2, dto.getNombre());
            insertar.setString(3, dto.getApellido_paterno());
            insertar.setString(4, dto.getApellido_materno());
            insertar.setString(5, dto.getDireccion());
            insertar.setString(6, dto.getTelefono());
            insertar.setString(7, dto.getCorreo());
            insertar.setDate(8,
                    new java.sql.Date(dto.getFecha_nacimiento().getTime()));
            insertar.setInt(9, dto.getId_Reserva());
            insertar.execute();
            conexion.commit();
            insertar.close();
            conexion.close();

            return true;
        } catch (SQLException w) {
            System.out.println("Error sql al agregar " + w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al agregar paciente " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean eliminar(PacienteDto dto) {
          try {
            Connection conexion = Conexion.getConexion();
            String query   = "DELETE FROM Paciente WHERE  Rut_Paciente = ? ";
            PreparedStatement eliminar = conexion.prepareStatement(query);
            
            eliminar.setString(1, dto.getRut_paciente());

            eliminar.execute();
            conexion.commit();
            eliminar.close();
            conexion.close();
            
            return true;
            
        } catch(SQLException w){
            System.out.println("Error sql al eliminar "+w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al eliminar Paciente "+e.getMessage());
            return false;
        }
    }

    @Override
    public boolean modificar(PacienteDto dto) {
       try {
        Connection conexion = Conexion.getConexion();
        String query = "UPDATE Paciente SET Nombre = ? ,Apellido_Paterno = ? , "
                + "Apellido_Materno  = ? , Direccion = ? , Telefono = ? , Correo = ? , "
                + "Fecha_Nacimiento = ?"
                + " WHERE Rut_Paciente = ? ";
        PreparedStatement modificar = conexion.prepareStatement(query);
        
        
        modificar.setString(1, dto.getNombre());
            modificar.setString(2, dto.getApellido_paterno());
            modificar.setString(3, dto.getApellido_materno());
            modificar.setString(4, dto.getDireccion());
            modificar.setString(5, dto.getTelefono());
            modificar.setString(6, dto.getCorreo());
            modificar.setDate(7,
                    new java.sql.Date(dto.getFecha_nacimiento().getTime()));
            modificar.setString(8, dto.getRut_paciente());

            modificar.executeUpdate();
            
            modificar.close();
            conexion.close();
            
             return true ;    
        }catch(SQLException w) { 
            System.out.println("Error sql al modifcar el Paciente "+w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al modificar  "+e.getMessage());
            return false;
        }
    }

    @Override
    public List<PacienteDto> listar() {
       List<PacienteDto> lista = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Paciente ORDER BY Rut_Paciente ASC";
            PreparedStatement listar = conexion.prepareStatement(query);
            
            ResultSet rs = listar.executeQuery();
            lista = new ArrayList<PacienteDto>();
            while(rs.next()){
                PacienteDto dto = new PacienteDto();
                dto.setRut_paciente(rs.getString("txtRutPaciente"));
                dto.setNombre(rs.getString("txtNombre"));
                dto.setApellido_paterno(rs.getString("txtApellidoPat"));
                dto.setApellido_materno(rs.getString("txtApellidoPat"));
                dto.setDireccion(rs.getString("txtDireccion"));
                dto.setTelefono(rs.getString("txtTelefono"));
                dto.setCorreo(rs.getString("txtCorreo"));
                dto.setFecha_nacimiento(rs.getDate("Fecha_Vencimiento"));
                
                
                lista.add(dto);
                
            }
             listar.close();
             conexion.close();
            
        }catch(SQLException w){
            System.out.println("Error sql al listar los pacientes "+w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al listar los pacientes ");
        }
        return lista;
    }

    @Override
    public String recuperarCorreo(String rut) {
        String clave = "";
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT correo FROM paciente WHERE rut_paciente=?";
            PreparedStatement recup = conexion.prepareStatement(query);
            recup.setString(1, rut);
            ResultSet rs = recup.executeQuery();
            while (rs.next()) {
                clave = rs.getString("correo");
            }
            recup.execute();
            conexion.close();
       
        } catch (SQLException e) {
            System.out.println("Error SQL al recuperar el correo " + e.getMessage());
        } catch (Exception w) {
            System.out.println("Error al recuperar el correo " + w.getMessage());
        }
        return clave;
        
    }

    @Override
    public String recuperarTelefono(String rut) {
        String clave = "";
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT telefono FROM paciente WHERE rut_paciente=?";
            PreparedStatement recup = conexion.prepareStatement(query);
            recup.setString(1, rut);
            ResultSet rs = recup.executeQuery();
            while (rs.next()) {
                clave = rs.getString("telefono");
            }
            recup.execute();
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error SQL al recuperar el paciente " + e.getMessage());
        } catch (Exception w) {
            System.out.println("Error al recuperar el paciente " + w.getMessage());
        }
        return clave;    
    
    }
    
}
