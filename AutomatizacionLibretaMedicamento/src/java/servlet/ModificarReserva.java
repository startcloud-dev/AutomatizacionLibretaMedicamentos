/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import componentes.Correo;
import dao.ReservaDaoImp;
import dto.ReservaDto;
import dao.PacienteDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import webservice.WSEnviarSMS_Service;






/**
 *
 * @author Sergio
 */
public class ModificarReserva extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_47976/SMS/WSEnviarSMS.wsdl")
    private WSEnviarSMS_Service service;

  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            int codigo = Integer.parseInt(request.getParameter("txtCodigo".trim()));
            String estado = request.getParameter("txtEstado".trim());
            String rut = request.getParameter("txtPaciente".trim());
             
            new ReservaDaoImp().modificarEstado(estado, codigo);

           String correo =  new PacienteDaoImp().recuperarCorreo(rut);
           
           Correo.EnviarRecordatorio(correo);
           
           Date fecha = ReservaDaoImp.traerFechaTermino();
           
           String fechaParse = fecha.toString();
           
           EnviarMensajeDeTexto(fechaParse);

           response.sendRedirect("Farmaceutico/BuscarReserva.jsp");
            
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

    private void EnviarMensajeDeTexto(java.lang.String fecha) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        webservice.WSEnviarSMS port = service.getWSEnviarSMSPort();
        port.enviarMensajeDeTexto(fecha);
    }

  
}
