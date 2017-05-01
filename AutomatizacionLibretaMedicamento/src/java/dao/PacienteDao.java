/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.PacienteDto;

/**
 *
 * @author LeslieK
 */
public interface PacienteDao extends BaseDao<PacienteDto>{
    
    public String recuperarCorreo(String rut);
    
    public String recuperarTelefono(String rut);
}
