

package dao;
import  java.sql.*;
import dto.BodegaDto;
import  componentes.Conexion;




/**
 *
 * @author Sergio
 */
public class BodegaDao {
   
    public boolean agregar(BodegaDto bodega){
        
        try {
            Connection conexion = Conexion.getConexion();
            String query = "INSERT INTO Bodega (id_seccion,Categoria) VALUES(?,?)";
            PreparedStatement insertar = conexion.prepareStatement(query);
            insertar.setInt(1, bodega.getId_seccion());
            insertar.setString(2, bodega.getCategoria());
            
            insertar.execute();
            insertar.close();
            conexion.close();
            
            
            return true;
            
        } catch(SQLException w) {    
            
            System.out.println("Error sql al insertar "+w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al agregar "+e.getMessage());
            return false;
        }
 
        
    }
    
    public boolean eliminar(BodegaDto bodega ){
        
        try {
        Connection conexion = Conexion.getConexion();
        String query = "DELETE FROM  Bodega WHERE Categoria = ?";
        PreparedStatement eliminar = conexion.prepareStatement(query);
        eliminar.setString(1, bodega.getCategoria());
        
        eliminar.execute();
        eliminar.close();
        conexion.close();
        
        return true;
        
         } catch(SQLException w){
            System.out.println("Error al eliminar la bodega sql "+w.getMessage());    
            return false;
        } catch (Exception e) {
            System.out.println("Error al eliminar la bodega "+e.getMessage());
            return false;
        }
        
    }
    
    
    
}
