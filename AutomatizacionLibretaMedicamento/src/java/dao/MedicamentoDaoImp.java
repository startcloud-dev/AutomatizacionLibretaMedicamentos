package dao;

import java.sql.*;
import dto.MedicamentoDto;
import sql.Conexion;
import java.util.*;

/**
 *
 * @author CETECOM
 */
public class MedicamentoDaoImp implements MedicamentoDao {

    public boolean agregar(MedicamentoDto dto) {

        try {
            Connection conexion = Conexion.getConexion();
            String query = "INSERT INTO Medicamento (Codigo,Nombre,Tipo,Fabricante"
                    + ",Componentes,Contenido,Cantidad,Gramaje,Fecha_Vencimiento,Id_seccion) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement insertar = conexion.prepareStatement(query);

            insertar.setInt(1, dto.getCodigo());
            insertar.setString(2, dto.getNombre());
            insertar.setString(3, dto.getTipo());
            insertar.setString(4, dto.getFabricante());
            insertar.setString(5, dto.getComponente());
            insertar.setString(6, dto.getContenido());
            insertar.setString(7, dto.getCantidad());
            insertar.setString(8, dto.getGramaje());
            insertar.setDate(9,
                    new java.sql.Date(dto.getFecha_vencimiento().getTime()));
            insertar.setInt(10, dto.getId_seccion());
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

    public boolean eliminar(MedicamentoDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "DELETE FROM Medicamento WHERE  Codigo = ? ";
            PreparedStatement eliminar = conexion.prepareStatement(query);

            eliminar.setInt(1, dto.getCodigo());

            eliminar.execute();
            conexion.commit();
            eliminar.close();
            conexion.close();

            return true;

        } catch (SQLException w) {
            System.out.println("Error al eliminar medicamento " + w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al eliminar el medicamento " + e.getMessage());
            return false;
        }

    }

    public boolean modificar(MedicamentoDto dto) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "UPDATE Medicamento SET Nombre = ? ,Tipo = ? , "
                    + "Fabricante  = ? , Componentes = ? , Contenido = ? , Cantidad = ? , "
                    + "Gramaje = ? , Fecha_Vencimiento = ? , Id_seccion = ? "
                    + " WHERE Codigo = ? ";
            PreparedStatement modificar = conexion.prepareStatement(query);

            modificar.setString(1, dto.getNombre());
            modificar.setString(2, dto.getTipo());
            modificar.setString(3, dto.getFabricante());
            modificar.setString(4, dto.getComponente());
            modificar.setString(5, dto.getContenido());
            modificar.setString(6, dto.getCantidad());
            modificar.setString(7, dto.getGramaje());
            modificar.setDate(8,
                    new java.sql.Date(dto.getFecha_vencimiento().getTime()));
            modificar.setInt(10, dto.getId_seccion());
            modificar.setInt(11, dto.getCodigo());
            

            modificar.executeUpdate();

            modificar.close();
            conexion.close();

            return true;
        } catch (SQLException w) {
            System.out.println("Error al modifcar el medicamento " + w.getMessage());
            return false;
        } catch (Exception e) {
            System.out.println("Error al modificar " + e.getMessage());
            return false;
        }
    }

    public List<MedicamentoDto> listar() {
        List<MedicamentoDto> lista = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Medicamento ORDER BY Codigo ASC";
            PreparedStatement listar = conexion.prepareStatement(query);

            ResultSet rs = listar.executeQuery();
            lista = new ArrayList<MedicamentoDto>();
            while (rs.next()) {
                MedicamentoDto dto = new MedicamentoDto();
                dto.setCodigo(rs.getInt("Codigo"));
                dto.setNombre(rs.getString("Nombre"));
                dto.setTipo(rs.getString("Tipo"));
                dto.setFabricante(rs.getString("Fabricante"));
                dto.setComponente(rs.getString("Componentes"));
                dto.setContenido(rs.getString("Contenido"));
                dto.setCantidad(rs.getString("Cantidad"));
                dto.setGramaje(rs.getString("Gramaje"));
                dto.setFecha_vencimiento(rs.getDate("Fecha_Vencimiento"));
                dto.setEstado(rs.getString("Estado"));
                dto.setId_seccion(rs.getInt("Id_seccion"));

                lista.add(dto);

            }
            listar.close();
            conexion.close();

        } catch (SQLException w) {
            System.out.println("Error sql al listar los medicamentos " + w.getMessage());
        } catch (Exception e) {
            System.out.println("Error al listar los medicamentos ");
        }
        return lista;
    }

    @Override
    public List<MedicamentoDto> buscarPorCodigo(Integer codigo) {
        List<MedicamentoDto> lista = new ArrayList<MedicamentoDto>();
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Medicamento WHERE Codigo = ?";

            PreparedStatement buscar = conexion.prepareStatement(query);
            buscar.setInt(1, codigo);

            ResultSet rs = buscar.executeQuery();
            while (rs.next()) {
                MedicamentoDto dto = new MedicamentoDto();
                dto.setCodigo(rs.getInt("Codigo"));
                dto.setNombre(rs.getString("Nombre"));
                dto.setTipo(rs.getString("Tipo"));
                dto.setFabricante(rs.getString("Fabricante"));
                dto.setComponente(rs.getString("Componentes"));
                dto.setContenido(rs.getString("Contenido"));
                dto.setCantidad(rs.getString("Cantidad"));
                dto.setGramaje(rs.getString("Gramaje"));
                dto.setFecha_vencimiento(rs.getDate("Fecha_Vencimiento"));
                dto.setId_seccion(rs.getInt("Id_seccion"));

                lista.add(dto);

            }
            buscar.close();
            conexion.close();

        } catch (SQLException w) {
            System.out.println("Error sql al buscar por codigo " + w.getMessage());
            w.printStackTrace();
        } catch (Exception e) {
            System.out.println("Error al buscar por codigo " + e.getMessage());
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public boolean ingresarJustificacion(String justificacion, Integer codigo) {
         
        try {
           Connection conexion  =  conexion = Conexion.getConexion();
            // establecemos que no sea autocommit,
	    // asi controlamos la transaccion de manera manual
            conexion.setAutoCommit(false);
            CallableStatement  sp  = conexion.prepareCall("CALL INGRESAR_JUSTIFICACION(?,?)");
            
            sp.setString(1, justificacion);
            sp.setInt(2, codigo);
            
            sp.execute();
            // confirmar si se ejecuto sin errores
            conexion.commit();
            
            //Cierro conexion
             
            conexion.close();
            return true;
           
            
        }catch(SQLException w){
            System.out.println("Error sql al ejecutar procedimento almacenado "+w.getMessage());
            w.printStackTrace();
            return false;
        } catch (Exception e) {
            System.out.println("Error al ingresar justificacion "+e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

  
    
}
