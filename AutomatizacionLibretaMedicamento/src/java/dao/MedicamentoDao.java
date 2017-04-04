package dao;

import java.sql.*;
import dto.MedicamentoDto;
import componentes.Conexion;
import java.util.*;

/**
 *
 * @author CETECOM
 */
public class MedicamentoDao {

    public boolean agregar(MedicamentoDto medicamento) {

        try {
            Connection conexion = Conexion.getConexion();
            String query = "INSERT INTO Medicamento (Codigo,Nombre,Tipo,Fabricante"
                    + ",Componentes,Contenido,Cantidad,Gramaje,Fecha_Vencimiento,Estado) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement insertar = conexion.prepareStatement(query);

            insertar.setInt(1, medicamento.getCodigo());
            insertar.setString(2, medicamento.getNombre());
            insertar.setString(3, medicamento.getTipo());
            insertar.setString(4, medicamento.getFabricante());
            insertar.setString(5, medicamento.getComponente());
            insertar.setString(6, medicamento.getContenido());
            insertar.setInt(7, medicamento.getCantidad());
            insertar.setInt(8, medicamento.getGramaje());
            insertar.setDate(9,
                    new java.sql.Date(medicamento.getFecha_vencimiento().getTime()));
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

    public boolean eliminar(String codigo){
        try {
            Connection conexion = Conexion.getConexion();
            String query   = "DELETE FROM Medicamento WHERE  Codigo = ? ";
            PreparedStatement eliminar = conexion.prepareStatement(query);
            
            eliminar.setString(1, codigo);

            eliminar.execute();
            conexion.commit();
            eliminar.close();
            conexion.close();
            
            return true;
            
        } catch(SQLException w){
            System.out.println("Error al eliminar medicamento "+w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al eliminar el medicamento "+e.getMessage());
            return false;
        }
        
    }
    
    
}
