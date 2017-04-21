/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dto.MedicamentoDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sergio
 */
public class BuscarMedicamento extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
           int codigo = Integer.parseInt(request.getParameter("txtCodigo".trim()));

           String justi = request.getParameter("txtJustificacion".trim());
           
           request.setAttribute("justificacion", justi);
           
            List<MedicamentoDto> lista = new dao.MedicamentoDaoImp()
                    .buscarPorCodigo(codigo);

            if (lista.isEmpty()) {

                request.setAttribute("mensaje", "No se encuentra medicamento");
            } else {
                
                request.setAttribute("lista", lista);
                request.setAttribute("mensaje", "Medicamento encontrado ");

                MedicamentoDto dto = new MedicamentoDto();
                
                dto.setCodigo(codigo);
                
                new dao.MedicamentoDaoImp().eliminar(dto);

                new dao.MedicamentoDaoImp().ingresarJustificacion(justi, codigo);
                
            }

            request.getRequestDispatcher("Medicamento/BajaMedicamento.jsp")
                    .forward(request, response);
            
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
