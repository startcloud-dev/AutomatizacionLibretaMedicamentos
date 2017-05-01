    
package dto;

/**
 *
 * @author Sergio
 */
public class FarmaceuticoDto {

 private String rut;
 private String nombre;
 private String direccion;
 private Integer telefono;
 private Integer id_seccion;
 private String  password;
 private Integer id_reserva;

    public FarmaceuticoDto() {
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(Integer id_reserva) {
        this.id_reserva = id_reserva;
    }

    @Override
    public String toString() {
        return "FarmaceuticoDto{" + "rut=" + rut + ", nombre=" + nombre + ", direccion=" + direccion + ", telefono=" + telefono + ", id_seccion=" + id_seccion + ", password=" + password + ", id_reserva=" + id_reserva + '}';
    }

}
