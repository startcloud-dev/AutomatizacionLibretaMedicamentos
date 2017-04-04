

package dao;
import  java.sql.*;
import dto.BodegaDto;
import  componentes.Conexion;
import java.util.*;




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
    
    public List<BodegaDto> listarBodegas(){
        List<BodegaDto>  lista = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Bodega";
            PreparedStatement listar = conexion.prepareStatement(query);
            ResultSet rs = listar.executeQuery();
            lista= new ArrayList<BodegaDto>();
            while(rs.next()){
                
                BodegaDto dto = new BodegaDto();
                dto.setId_seccion(rs.getInt("id_seccion"));
                dto.setCategoria(rs.getString("Categoria"));
               
                lista.add(dto);
            }
            
            listar.close();
            conexion.close();
            
            
        }catch(SQLException w){
            System.out.println("Error al listar sql "+w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al listar "+e.getMessage());
        }
       return lista; 
    }
    
}
