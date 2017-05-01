/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package componentes;

/**
 *
 * @author Sergio
 */
    
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dto.MedicamentoDto;
import dto.ReservaDto;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

public class GenerarInformes {

    public static void GenerarPdf(List lista, int tipo) {
        Document document = new Document();

        try {
            String nombre = "Medicamentos";
            if(tipo == 1){
                nombre = "Reservas";
            }
            PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\Sergio\\Desktop\\Informe"+nombre+".pdf"));
            document.open();
            PdfPTable table = new PdfPTable(5);
            if (tipo == 0) { // Tipo 0 es Medicamento
                document.add(new Paragraph("MEDICAMENTOS\n\n"));
                table.addCell("Nombre");
                table.addCell("Laboratorio");
                table.addCell("Cantidad");
                table.addCell("Fecha de Vencimiento");
                table.addCell("Gramaje");
            } else {
                if (tipo == 1) {
                    document.add(new Paragraph("RESERVAS\n\n"));
                    table.addCell("Rut paciente");
                    table.addCell("Fecha Inicio");
                    table.addCell("Fecha Termino");
                    table.addCell("Rut Farmaceutico");
                    table.addCell("Estado");
                }
            }
            // Este codigo genera una tabla de 3 columnas

            // addCell() agrega una celda a la tabla, el cambio de fila
            // ocurre automaticamente al llenar la fila
            if (tipo == 0) { // Tipo 0 es Medicamento
                for (Object arg : lista) {
                    MedicamentoDto dto = (MedicamentoDto) arg;
                    table.addCell(dto.getNombre());
                    table.addCell(dto.getFabricante());
                    table.addCell(dto.getCantidad());
                    table.addCell(dto.getFecha_vencimiento().toString());
                    table.addCell(dto.getGramaje());
                }
            } else {
                if (tipo == 1) { // Tipo 1 es Reserva
                    for (Object arg : lista) {
                        ReservaDto rese = (ReservaDto) arg;
                        table.addCell(rese.getRut_paciente());
                        table.addCell(rese.getFecha_inicio().toString());
                        table.addCell(rese.getFecha_termino().toString());
                        table.addCell(rese.getRut_farmaceutico());
                        table.addCell(rese.getEstado());
                    }
                }
            }

            // Si desea crear una celda de mas de una columna
            // Cree un objecto Cell y cambie su propiedad span
            PdfPCell celdaFinal = new PdfPCell(new Paragraph("Filas Totales: "+lista.size()));

            // Indicamos cuantas columnas ocupa la celda
            celdaFinal.setColspan(5);
            table.addCell(celdaFinal);

            // Agregamos la tabla al documento            
            document.add(table);

            document.close();

        } catch (Exception e) {
            System.err.println("Ocurrio un error al crear el archivo");
            System.exit(-1);
        }
    }
}
