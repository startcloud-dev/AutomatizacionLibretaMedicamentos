
package dto;

import java.util.Date;

/**
 *
 * @author LeslieK
 */
public class RecetaDto {
    private int id_receta;
    private Date fecha_emision;
    private String indicaciones;
    private Integer codigo;

    public RecetaDto() {
    }

    public int getId_receta() {
        return id_receta;
    }

    public void setId_receta(int id_receta) {
        this.id_receta = id_receta;
    }

    public Date getFecha_emision() {
        return fecha_emision;
    }

    public void setFecha_emision(Date fecha_emision) {
        this.fecha_emision = fecha_emision;
    }

    public String getIndicaciones() {
        return indicaciones;
    }

    public void setIndicaciones(String indicaciones) {
        this.indicaciones = indicaciones;
    }

 
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    @Override
    public String toString() {
        return "RecetaDto{" + "id_receta=" + id_receta + ", fecha_emision=" + fecha_emision + ", indicaciones=" + indicaciones + ", codigo=" + codigo + '}';
    }

   
    
    
    
}
