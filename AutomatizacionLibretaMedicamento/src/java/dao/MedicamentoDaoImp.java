package dao;

import java.sql.*;
import dto.MedicamentoDto;
import componentes.Conexion;
import java.util.*;

/**
 *
 * @author CETECOM
 */
public class MedicamentoDaoImp implements MedicamentoDao {

    public boolean agregar(MedicamentoDto dto) {

        try {
            Connection conexion = Conexion.getConexion();
            String query = "INSERT INTO Medicamento (Nombre,Tipo,Fabricante"
                    + ",Componentes,Contenido,Cantidad,Gramaje,Fecha_Vencimiento,Id_seccion,id_reserva) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement insertar = conexion.prepareStatement(query);

            insertar.setString(1, dto.getNombre());
            insertar.setString(2, dto.getTipo());
            insertar.setString(3, dto.getFabricante());
            insertar.setString(4, dto.getComponente());
            insertar.setString(5, dto.getContenido());
            insertar.setString(6, dto.getCantidad());
            insertar.setString(7, dto.getGramaje());
            insertar.setDate(8,
                    new java.sql.Date(dto.getFecha_vencimiento().getTime()));
            insertar.setInt(9, dto.getId_seccion());
            insertar.setInt(10, dto.getId_Reserva());
            insertar.execute();

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
            modificar.setInt(9, dto.getCodigo());

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
        List<MedicamentoDto> lista =   new ArrayList<MedicamentoDto>();
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Medicamento ORDER BY Codigo ASC";
            PreparedStatement listar = conexion.prepareStatement(query);

            ResultSet rs = listar.executeQuery();
            
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
                dto.setId_Reserva(rs.getInt("Id_Reserva"));
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
            Connection conexion = conexion = Conexion.getConexion();
            // establecemos que no sea autocommit,
            // asi controlamos la transaccion de manera manual
            conexion.setAutoCommit(false);
            CallableStatement sp = conexion.prepareCall("{CALL INGRESAR_JUSTIFICACION(?,?)}");

            sp.setString(1, justificacion);
            sp.setInt(2, codigo);

            sp.execute();
            // confirmar si se ejecuto sin errores
            conexion.commit();

            //Cierro conexion
            conexion.close();

            return true;

        } catch (SQLException w) {
            System.out.println("Error sql al ejecutar procedimento almacenado " + w.getMessage());
            w.printStackTrace();
            return false;
        } catch (Exception e) {
            System.out.println("Error al ingresar justificacion " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<MedicamentoDto> revisarStockPorNombre(String nombre) {
        List<MedicamentoDto> lista = null;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT CODIGO , NOMBRE , GRAMAJE, FABRICANTE, CANTIDAD "
                    + "FROM MEDICAMENTO WHERE NOMBRE = ?";
            PreparedStatement listar = conexion.prepareStatement(query);
            listar.setString(1, nombre);

            ResultSet rs = listar.executeQuery();
            lista = new ArrayList<MedicamentoDto>();
            while (rs.next()) {
                MedicamentoDto dto = new MedicamentoDto();
                dto.setCodigo(rs.getInt("Codigo"));
                dto.setNombre(rs.getString("Nombre"));
                dto.setGramaje(rs.getString("Gramaje"));
                dto.setFabricante(rs.getString("Fabricante"));
                dto.setCantidad(rs.getString("Cantidad"));

                lista.add(dto);
            }
            
            System.out.println("Lista"+lista.toString());
            
            listar.close();
            conexion.close();

        } catch (SQLException w) {
            w.printStackTrace();
            System.out.println("Error sql al revisar stock por nombre " + w.getMessage());

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al revisar stock por nombre " + e.getMessage());
        }
        return lista;
    }

    public String recuperarNombreMedicamentoPorId(int id) {
        String nombre = "";

        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT Medicamento.NOMBRE AS NOMBRE FROM MEDICAMENTO,RECETA " +
                            " WHERE MEDICAMENTO.CODIGO=RECETA.CODIGO AND RECETA.ID_RECETA=?";
            PreparedStatement sacar = conexion.prepareStatement(query);

            sacar.setInt(1, id);
            ResultSet rs = sacar.executeQuery();

            while (rs.next()) {

                nombre = rs.getString("Nombre");

            }
            sacar.close();
            conexion.close();

        } catch (SQLException w) {
            w.printStackTrace();
            System.out.println("Error sql al recuperar el nombre del medicamento por id " + w.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al recuperar el nombre del medicamento por id " + e.getMessage());
        }

        return nombre;
    }

    public boolean validarMedicamento(int codigo) {
        boolean resp = false;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT * FROM Medicamento WHERE codigo = ?";
            PreparedStatement validar = conexion.prepareStatement(query);
            validar.setInt(1, codigo);
            ResultSet rs = validar.executeQuery();
            if (rs.next()) {
                resp = true;
            }
            validar.close();
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error SQL al validar " + e.getMessage());
        } catch (Exception w) {
            System.out.println("Error al validar " + w.getMessage());
        }
        return resp;
    }
    
    public int aumentarStock(int cantidad, int codigo) {
        int cant = 0;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT (CANTIDAD+?)as SUMA FROM  MEDICAMENTO  WHERE CODIGO=? ";
            PreparedStatement stock = conexion.prepareStatement(query);
            stock.setInt(1, cantidad);
            stock.setInt(2, codigo);

            ResultSet rs = stock.executeQuery();
            while (rs.next()) {
                cant = rs.getInt("SUMA");

            }
        } catch (SQLException w) {
            w.printStackTrace();
            System.out.println("Error SQL al aumentar el stock " + w.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al aumentar el stock " + e.getMessage());
        }
        return cant;
    }

    public int descontarStock(int cantidad, int codigo) {
        int cant = 0;
        try {
            Connection conexion = Conexion.getConexion();
            String query = "SELECT (CANTIDAD-?)as RESTA FROM  MEDICAMENTO  WHERE CODIGO=? ";

            PreparedStatement stock = conexion.prepareStatement(query);
            stock.setInt(1, cantidad);
            stock.setInt(2, codigo);

            ResultSet rs = stock.executeQuery();
            while (rs.next()) {
                cant = rs.getInt("RESTA");

            }
        } catch (SQLException w) {
            w.printStackTrace();
            System.out.println("Error SQL al disminuir el stock " + w.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al disminuir el stock " + e.getMessage());
        }
        return cant;
    }

    public boolean modificarStock(int Codigo, int resultado) {
        try {
            Connection conexion = Conexion.getConexion();
            String query = "UPDATE Medicamento SET Cantidad = ? "
                    + " WHERE Codigo = ? ";
            PreparedStatement modificar = conexion.prepareStatement(query);

            modificar.setInt(1, resultado);
            modificar.setInt(2, Codigo);

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
}
