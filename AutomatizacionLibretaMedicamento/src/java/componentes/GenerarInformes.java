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
    
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.*;
import dto.DoctorDto;
import dto.MedicamentoDto;
import dto.RecetaDto;
import dto.ReservaDto;
import dto.TratamientoDto;
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
            }else if (tipo == 2){
                nombre = "Receta";
            }
            PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\Sergio\\Desktop\\Informe"+nombre+".pdf"));
            document.open();
              Paragraph par1 = new Paragraph();
             Font font_titulo = new Font(Font.FontFamily.HELVETICA,15,Font.BOLD,BaseColor.BLACK);
              par1.setAlignment(Element.ALIGN_CENTER);
               par1.add(new Phrase(Chunk.NEWLINE));
               par1.add(new Phrase(Chunk.NEWLINE));
            PdfPTable table = new PdfPTable(5);
            if (tipo == 0) { // Tipo 0 es Medicamento
                par1.add(new Phrase("MEDICAMENTOS", font_titulo));
               
             
                table.addCell("Nombre");
                table.addCell("Laboratorio");
                table.addCell("Cantidad");
                table.addCell("Fecha de Vencimiento");
                table.addCell("Gramaje");
            } else {
                if (tipo == 1) {
                    par1.add(new Phrase("RESERVAS", font_titulo));
                   
                    table.addCell("Rut paciente");
                    table.addCell("Fecha Inicio");
                    table.addCell("Fecha Termino");
                    table.addCell("Rut Farmaceutico");
                    table.addCell("Estado");
                }else if (tipo ==2){
                      par1.add(new Phrase("RECETA", font_titulo));
               
                    table.addCell("Doctor");
//                    table.addCell("Fecha Inicio");
//                    table.addCell("Fecha Termino");
//                    table.addCell("Rut Farmaceutico");
//                    table.addCell("Estado");
                    
                }
            }
            
            document.add(par1);
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

              if(tipo ==2 ){
                    for (Object arg : lista)
                    {
                        DoctorDto doc = (DoctorDto) arg;
                          table.addCell(doc.getNombre());
                          TratamientoDto tra = (TratamientoDto) arg;
                          table.addCell(tra.getDuracion());
                          RecetaDto rec = (RecetaDto)arg;
                          table.addCell(rec.getFecha_emision().toString());
                          table.addCell(rec.getIndicaciones());
                          
//                        DoctorDto doc = (DoctorDto) arg;
//                         TratamientoDto tra =(TratamientoDto) arg;
//                        RecetaDto rece =(RecetaDto) arg;
//                        table.addCell(doc.getNombre());
//                        table.addCell(String.valueOf(tra.getId_tratamiento()));
//                        table.addCell(tra.getDuracion());
//                        table.addCell(String.valueOf(rece.getId_receta()));
//                        table.addCell(rece.getFecha_emision().toString());
//                        table.addCell(rece.getIndicaciones());
                        
                        
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
