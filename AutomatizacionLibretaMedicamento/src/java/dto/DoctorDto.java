/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author leslie
 */
public class DoctorDto {

    private String rut_doctor;
    private String nombre;
    private String especialidad;
    private String direccion;
    private int telefono;
    private String password;

    public DoctorDto() {
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRut_doctor() {
        return rut_doctor;
    }

    public void setRut_doctor(String rut_doctor) {
        this.rut_doctor = rut_doctor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return "DoctorDto{" + "rut_doctor=" + rut_doctor + ", nombre=" + nombre + ", especialidad=" + especialidad + ", direccion=" + direccion + ", telefono=" + telefono + ", password=" + password + '}';
    }
}
