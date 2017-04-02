
package dto;

/**
 *
 * @author Sergio
 */
public class Farmaceutico {

 private String rut_farmaceutico;
 private String nombre;
 private String direccion;
 private Integer telefono;
 private Integer id_seccion;

    public Farmaceutico() {
    }

    public String getRut_farmaceutico() {
        return rut_farmaceutico;
    }

    public void setRut_farmaceutico(String rut_farmaceutico) {
        this.rut_farmaceutico = rut_farmaceutico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getTelefono() {
        return telefono;
    }

    public void setTelefono(Integer telefono) {
        this.telefono = telefono;
    }

    public Integer getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(Integer id_seccion) {
        this.id_seccion = id_seccion;
    }

    @Override
    public String toString() {
        return "Farmaceutico{" + "rut_farmaceutico=" + rut_farmaceutico + ", nombre=" + nombre + ", direccion=" + direccion + ", telefono=" + telefono + ", id_seccion=" + id_seccion + '}';
    }
 
    
}
