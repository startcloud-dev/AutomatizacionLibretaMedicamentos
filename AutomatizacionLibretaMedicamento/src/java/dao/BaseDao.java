
package dao;

import java.util.List;

/**
 *
 * @author Sergio
 */
public interface BaseDao <T> {
    
    public boolean agregar(T dto);
    public boolean eliminar(T dto);
    public boolean modificar(T dto);
    public List<T> listar();
    
    
}
