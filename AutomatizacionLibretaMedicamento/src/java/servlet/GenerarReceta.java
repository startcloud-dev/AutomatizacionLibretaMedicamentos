/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import componentes.GenerarInformes;
import dao.RecetaDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergio
 */
public class GenerarReceta extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
            String mensaje ="";
            
            int id = Integer.valueOf(request.getParameter("txtId".trim()));
            
            String doct = new dao.DoctorDaoImp().recuperarNombreDoctorPorId(id);
            String medi = new dao.MedicamentoDaoImp().recuperarNombreMedicamentoPorId(id);
            String paci = new dao.PacienteDaoImp().recuperarNombrePacientePorId(id);
			
            List lista = new dao.RecetaDaoImp().listar();
            System.out.println(lista.toString()+lista.size());
            if (lista.size() > 0) {
                componentes.GenerarReceta.GenerarPdf(new RecetaDaoImp().listarRecetasPorId(id),doct,medi,paci, 2);
                mensaje = "la receta se genero en su escritorio";
            } else {
                mensaje = "No hay Niguna Receta";
            }
            request.setAttribute("mensaje", mensaje);
            request.getRequestDispatcher("Doctor/GenerarReceta.jsp").forward(request, response);
            
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
