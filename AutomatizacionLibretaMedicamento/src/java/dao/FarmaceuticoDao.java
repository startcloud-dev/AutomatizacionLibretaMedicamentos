/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import componentes.Conexion;
import dto.FarmaceuticoDto;
import  java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sergio
 */
public class FarmaceuticoDao {

  public boolean agregar(FarmaceuticoDto dto){
      try {
          Connection conexion = Conexion.getConexion();
          String query = "INSERT INTO Farmaceutico (Rut_Farmaceutico,Nombre,Direccion,Telefono,id_seccion,Password)"
                  + " VALUES(?,?,?,?,?,?)";
          PreparedStatement insertar = conexion.prepareStatement(query);
          
          insertar.setString(1, dto.getRut());
          insertar.setString(2, dto.getNombre());
          insertar.setString(3, dto.getDireccion());
          insertar.setInt(4, dto.getTelefono());
          insertar.setInt(5, dto.getId_seccion());
          insertar.setString(6, dto.getPassword());
          
        
          insertar.execute();
          insertar.close();
          conexion.close();
          
          return true;
          
      }catch(SQLException w){
          System.out.println("Error  sql al agregar  "+w.getMessage());
          return  false;
      } catch (Exception e) {
      
          System.out.println("Error al agregar "+e.getMessage());
          return  false;
      }
  }  
      public boolean eliminar(FarmaceuticoDto dto ){
          try {
              Connection conexion = Conexion.getConexion();
              String sql = "DELETE  FROM Farmaceutico WHERE Rut_farmaceutico = ? ";
              PreparedStatement eliminar = conexion.prepareStatement(sql);
              eliminar.setString(1, dto.getRut());
              
              eliminar.execute();
              eliminar.close();
              conexion.close();
              return true ;
              
          } catch(SQLException w){
              System.out.println("Error sql al eliminar "+w.getMessage());
              return false;
          } catch (Exception e) {
              System.out.println("Error al eliminar "+e.getMessage());
              return false;
          }
          
      }
      
      public boolean modificar(FarmaceuticoDto dto){
          try {
              Connection conexion = Conexion.getConexion();
              String query = "UPDATE Farmaceutico SET Nombre = ? , Direccion = ? , Telefono = ? , Id_seccion = ? "
                      + "WHERE Rut_Farmaceutico =  ?";
              PreparedStatement actualizar = conexion.prepareStatement(query);
              
              actualizar.setString(1, dto.getNombre());
              actualizar.setString(2, dto.getDireccion());
              actualizar.setInt(3, dto.getTelefono());
              actualizar.setInt(4, dto.getId_seccion());
              
              actualizar.executeUpdate();
              
               actualizar.close();
               conexion.close();
               
               return true;
              
          }catch(SQLException w){
              System.out.println("Error sql al actualizar " +w.getMessage()); 
              return false;
          } catch (Exception e) {
              System.out.println("Error al actualizar "+e.getMessage());
              return  false;
          }
          
      }
      
      
      public List<FarmaceuticoDto>  listar(){
         List<FarmaceuticoDto> lista = new ArrayList<FarmaceuticoDto>();
          try {
              Connection conexion = Conexion.getConexion();
              String query = "SELECT * FROM Farmaceutico ORDER BY Rut_farmaceutico ASC";
              PreparedStatement listar = conexion.prepareStatement(query);
              ResultSet rs = listar.executeQuery();
              
              while(rs.next()){
                  FarmaceuticoDto dto = new FarmaceuticoDto();
                  dto.setRut(rs.getString("Rut_Farmaceutico"));
                  dto.setNombre(rs.getString("Nombre"));
                  dto.setDireccion(rs.getString("Direccion"));
                  dto.setTelefono(rs.getInt("Telefono"));
                  dto.setId_seccion(rs.getInt("Id_seccion"));
                 
                  
                  lista.add(dto);
                  
                  
              }
              listar.close();
              conexion.close();
              
          } catch(SQLException w){
              System.out.println("Error sql a listar los farmaceuticos "+w.getMessage());
          } catch (Exception e) {
              System.out.println("Error al listar a los farmaceutico  "+e.getMessage());
              
          }
          return lista;
      }
      
  }
    

