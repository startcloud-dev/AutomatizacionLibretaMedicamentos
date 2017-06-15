/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;

/**
 *
 * @author LeslieK
 */
public class ReservaDto {
    private Integer id_reserva;
    private Date fecha_inicio;
    private Date fecha_termino;
    private String rut_paciente;
    private Integer id_tratamiento;
    private String rut_farmaceutico;
    private String estado;
    private Integer codigo;
    private Integer cantidad;
    
    public ReservaDto() {
    }

    public Integer getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(Integer id_reserva) {
        this.id_reserva = id_reserva;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_termino() {
        return fecha_termino;
    }

    public void setFecha_termino(Date fecha_termino) {
        this.fecha_termino = fecha_termino;
    }

    public String getRut_paciente() {
        return rut_paciente;
    }

    public void setRut_paciente(String rut_paciente) {
        this.rut_paciente = rut_paciente;
    }

    public Integer getId_tratamiento() {
        return id_tratamiento;
    }

    public void setId_tratamiento(Integer id_tratamiento) {
        this.id_tratamiento = id_tratamiento;
    }

    public String getRut_farmaceutico() {
        return rut_farmaceutico;
    }

    public void setRut_farmaceutico(String rut_farmaceutico) {
        this.rut_farmaceutico = rut_farmaceutico;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return "ReservaDto{" + "id_reserva=" + id_reserva + ", fecha_inicio=" + fecha_inicio + ", fecha_termino=" + fecha_termino + ", rut_paciente=" + rut_paciente + ", id_tratamiento=" + id_tratamiento + ", rut_farmaceutico=" + rut_farmaceutico + ", estado=" + estado + ", codigo=" + codigo + ", cantidad=" + cantidad + '}';
    }

}
