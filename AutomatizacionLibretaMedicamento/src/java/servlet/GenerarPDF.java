/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dto.MedicamentoDto;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sql.Conexion;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Sergio
 */
@WebServlet(urlPatterns = {"/pdf"})
public class GenerarPDF extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();
        try {

            try {
                Connection conexion = Conexion.getConexion();
                String query = "SELECT * FROM Bodega";
                PreparedStatement busca = conexion.prepareStatement(query);

                ResultSet rs = busca.executeQuery();

                Document documento = new Document();
                PdfWriter.getInstance(documento, out);

                documento.open();

                Paragraph par1 = new Paragraph();
                Font font_titulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLACK);
                par1.add(new Phrase("Reporte Bodega ", font_titulo));
                par1.setAlignment(Element.ALIGN_CENTER);
                par1.add(new Phrase(Chunk.NEWLINE));
                par1.add(new Phrase(Chunk.NEWLINE));
                documento.add(par1);

                PdfPTable tabla = new PdfPTable(10);
                PdfPCell celda1 = new PdfPCell(new Paragraph("Codigo", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));

                PdfPCell celda2 = new PdfPCell(new Paragraph("Nombre", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda3 = new PdfPCell(new Paragraph("Tipo", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda4 = new PdfPCell(new Paragraph("Fabricante", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda5 = new PdfPCell(new Paragraph("Componente", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda6 = new PdfPCell(new Paragraph("Contenido", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda7 = new PdfPCell(new Paragraph("Cantidad", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda8 = new PdfPCell(new Paragraph("Gramaje", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda9 = new PdfPCell(new Paragraph("FechaVencimiento", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda10 = new PdfPCell(new Paragraph("IDSeccion", FontFactory.getFont("Arial", 5, Font.BOLD, BaseColor.BLACK)));

                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                tabla.addCell(celda4);
                tabla.addCell(celda5);
                tabla.addCell(celda6);
                tabla.addCell(celda7);
                tabla.addCell(celda8);
                tabla.addCell(celda9);
                tabla.addCell(celda10);
                while (rs.next()) {
                    documento.add(new Paragraph(String.valueOf(rs.getInt(1))));
                    documento.add(new Paragraph(rs.getString(1)));

                }

                documento.add(tabla);
                documento.close();

            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }

        

        } finally {
            out.close();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
