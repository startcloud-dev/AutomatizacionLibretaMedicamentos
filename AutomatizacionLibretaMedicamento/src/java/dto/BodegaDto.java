/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Sergio
 */
public class BodegaDto {
 
  private Integer id_seccion;
  private String categoria ;
  private Integer id_reserva;

    public BodegaDto() {
    }

    public Integer getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(Integer id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Integer getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(Integer id_reserva) {
        this.id_reserva = id_reserva;
    }

    @Override
    public String toString() {
        return "BodegaDto{" + "id_seccion=" + id_seccion + ", categoria=" + categoria + ", id_reserva=" + id_reserva + '}';
    }

}
