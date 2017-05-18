/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RecetaDto;
import java.util.List;

/**
 *
 * @author LeslieK
 */
public interface RecetaDao extends BaseDao<RecetaDto>{
    
    public List<RecetaDto> listarRecetasPendientes(String rutPaciente);
    
    
    
}
