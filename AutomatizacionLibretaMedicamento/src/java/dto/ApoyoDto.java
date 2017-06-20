/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;

/**
 *
 * @author Kevin
 */
public class ApoyoDto {
    
    private Date Fecha_inicio;
    private Date Fecha_termino;
    private String Nombre_paciente;
    private String Estado;
    private String Nombre_Medicamento;
    private Integer cantidad;

    public Date getFecha_inicio() {
        return Fecha_inicio;
    }

    public void setFecha_inicio(Date Fecha_inicio) {
        this.Fecha_inicio = Fecha_inicio;
    }

    public Date getFecha_termino() {
        return Fecha_termino;
    }

    public void setFecha_termino(Date Fecha_termino) {
        this.Fecha_termino = Fecha_termino;
    }

    public String getNombre_paciente() {
        return Nombre_paciente;
    }

    public void setNombre_paciente(String Nombre_paciente) {
        this.Nombre_paciente = Nombre_paciente;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getNombre_Medicamento() {
        return Nombre_Medicamento;
    }

    public void setNombre_Medicamento(String Nombre_Medicamento) {
        this.Nombre_Medicamento = Nombre_Medicamento;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return "ApoyoDto{" + "Fecha_inicio=" + Fecha_inicio + ", Fecha_termino=" + Fecha_termino + ", Nombre_paciente=" + Nombre_paciente + ", Estado=" + Estado + ", Nombre_Medicamento=" + Nombre_Medicamento + ", cantidad=" + cantidad + '}';
    }
}
