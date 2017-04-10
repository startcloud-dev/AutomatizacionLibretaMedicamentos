/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.FarmaceuticoDto;
import dao.FarmaceuticoDao;


/**
 *
 * @author Sergio
 */
public class AgregarFarmaceutico extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
            String mensaje = "";
           FarmaceuticoDto dto = new FarmaceuticoDto();
           
            dto.setRut(request.getParameter("txtRut".trim()));
            dto.setNombre(request.getParameter("txtNombre".trim()));
            dto.setDireccion(request.getParameter("txtDireccion".trim()));
            dto.setTelefono(Integer.parseInt(request.getParameter("txtTelefono".trim())));
            dto.setId_seccion(Integer.parseInt(request.getParameter("txtIdSeccion".trim())));
            dto.setPassword(request.getParameter(request.getParameter("txtPassword".trim())));
            
            
            
            if ( new dao.FarmaceuticoDao().agregar(dto)) {
                
                mensaje = "Agregado exitosamente";
                
          
                
                
            }else{
                
                mensaje = "Error al agregar al farmaceutico";
            }
            
            
            
            request.setAttribute("mensaje", mensaje);
            
            request.setAttribute("lista",  new dao.FarmaceuticoDao().listar());
            
           request.getRequestDispatcher("Farmaceutico/AgregarFarmaceutico.jsp");
            
            
            
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
