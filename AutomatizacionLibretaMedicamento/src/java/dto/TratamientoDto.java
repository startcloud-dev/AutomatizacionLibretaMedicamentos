/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author CETECOM
 */
public class TratamientoDto {
    
    private Integer id_tratamiento;
    private String duracion;
    private Integer id_reserva;

    public TratamientoDto() {
    }

    public Integer getId_tratamiento() {
        return id_tratamiento;
    }

    public void setId_tratamiento(Integer id_tratamiento) {
        this.id_tratamiento = id_tratamiento;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public Integer getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(Integer id_reserva) {
        this.id_reserva = id_reserva;
    }

    @Override
    public String toString() {
        return "TratamientoDto{" + "id_tratamiento=" + id_tratamiento + ", duracion=" + duracion + ", id_reserva=" + id_reserva + '}';
    }
    
}
