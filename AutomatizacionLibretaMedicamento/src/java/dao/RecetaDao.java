

package dao;

import dto.RecetaDto;


/**
 *
 * @author LeslieK
 */
public interface RecetaDao extends BaseDao<RecetaDto>{
    
    
   public RecetaDto  buscarRecetaPorRutPaciente(String rut);
   
   
    
}
