 


package dto;

import java.util.Date;

/**
 *
 * @author Sergio
 */
public class MedicamentoDto {
   
  private Integer codigo;
  private String nombre;
  private String tipo;   
  private String fabricante;
  private String componente;
  private String contenido ;
  private Integer cantidad;
  private Integer  gramaje;
  private Date   fecha_vencimiento;
  private String estado;
  private Integer id_seccion;

    public MedicamentoDto() {
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public String getComponente() {
        return componente;
    }

    public void setComponente(String componente) {
        this.componente = componente;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Integer getGramaje() {
        return gramaje;
    }

    public void setGramaje(Integer gramaje) {
        this.gramaje = gramaje;
    }

    public Date getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(Date fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Integer getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(Integer id_seccion) {
        this.id_seccion = id_seccion;
    }

    @Override
    public String toString() {
        return "MedicamentoDto{" + "codigo=" + codigo + ", nombre=" + nombre + ", tipo=" + tipo + ", fabricante=" + fabricante + ", componente=" + componente + ", contenido=" + contenido + ", cantidad=" + cantidad + ", gramaje=" + gramaje + ", fecha_vencimiento=" + fecha_vencimiento + ", estado=" + estado + ", id_seccion=" + id_seccion + '}';
    }

 
  
    
    
    
    
}
