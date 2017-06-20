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
public class PacienteDto {
    private String rut_paciente;
    private String nombre;
    private String apellido_paterno;
    private String apellido_materno;
    private String direccion;
    private String telefono;
    private String correo;
    private Date fecha_nacimiento;
    private Integer id_Reserva;

    public PacienteDto() {
    }

    public String getRut_paciente() {
        return rut_paciente;
    }

    public void setRut_paciente(String rut_paciente) {
        this.rut_paciente = rut_paciente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public Integer getId_Reserva() {
        return id_Reserva;
    }

    public void setId_Reserva(Integer id_Reserva) {
        this.id_Reserva = id_Reserva;
    }

    @Override
    public String toString() {
        return "PacienteDto{" + "rut_paciente=" + rut_paciente + ", nombre=" + nombre + ", apellido_paterno=" + apellido_paterno + ", apellido_materno=" + apellido_materno + ", direccion=" + direccion + ", telefono=" + telefono + ", correo=" + correo + ", fecha_nacimiento=" + fecha_nacimiento + ", id_Reserva=" + id_Reserva + '}';
    }
    
}
