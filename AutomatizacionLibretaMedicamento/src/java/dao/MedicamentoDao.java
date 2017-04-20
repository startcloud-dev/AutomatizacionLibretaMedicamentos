package dao;
import java.util.List;
import dto.MedicamentoDto;
/**
 *
 * @author Sergio
 */
public interface MedicamentoDao {
    
    public List<MedicamentoDto> buscarPorCodigo(Integer codigo);
    
    public boolean ingresarJustificacion(String justificacion,Integer codigo);
    
    
    
}
