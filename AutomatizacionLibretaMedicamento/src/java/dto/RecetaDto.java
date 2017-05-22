
package dto;

import java.util.Date;

/**
 *
 * @author LeslieK
 */
public class RecetaDto {
    private int id_receta;
    private Date fecha_emision;
    private int  codigo;
    private String indicaciones;

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

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    @Override
    public String toString() {
        return "RecetaDto{" + "id_receta=" + id_receta + ", fecha_emision=" + fecha_emision + ", codigo=" + codigo + ", indicaciones=" + indicaciones + '}';
    }
    
}
