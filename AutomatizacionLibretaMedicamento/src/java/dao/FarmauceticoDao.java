/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import componentes.Conexion;
import dto.Farmaceutico;
import  java.sql.*;

/**
 *
 * @author Sergio
 */
public class FarmauceticoDao {

  public boolean agregar(Farmaceutico farmaceutico){
      try {
          Connection conexion = Conexion.getConexion();
          String query = "INSERT INTO Farmaceutico (Rut_Farmaceutico,Nombre,Direccion,Telefono,id_seccion)"
                  + " VALUES(?,?,?,?,?)";
          PreparedStatement insertar = conexion.prepareStatement(query);
          
          insertar.setString(1, farmaceutico.getRut_farmaceutico());
          insertar.setString(2, farmaceutico.getNombre());
          insertar.setString(3, farmaceutico.getDireccion());
          insertar.setInt(4, farmaceutico.getTelefono());
          insertar.setInt(5, farmaceutico.getId_seccion());
          
        
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
      public boolean eliminar(String rut ){
          try {
              Connection conexion = Conexion.getConexion();
              String sql = "DELETE  FROM Farmaceutico WHERE Rut_farmaceutico = ? ";
              PreparedStatement eliminar = conexion.prepareStatement(sql);
              eliminar.setString(1, rut);
              
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
  }
    
