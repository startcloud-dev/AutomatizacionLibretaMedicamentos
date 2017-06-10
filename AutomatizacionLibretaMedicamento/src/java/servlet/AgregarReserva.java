/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.MedicamentoDaoImp;
import dao.PacienteDaoImp;
import dao.TratamientoDaoImp;
import dto.ReservaDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kevin
 */
public class AgregarReserva extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                       String mensaje = "";
            ReservaDto dto = new ReservaDto();
            dto.setFecha_inicio(Date.valueOf(request.getParameter("txtFechaIni")));
            dto.setFecha_termino(Date.valueOf(request.getParameter("txtFechaTer")));
            dto.setRut_paciente(request.getParameter("txtPaciente".trim()));
            dto.setId_tratamiento(Integer.parseInt(request.getParameter("txtTratamiento".trim())));
            dto.setRut_farmaceutico(request.getParameter("txtFarmaceutico".trim()));
            dto.setEstado(request.getParameter("txtEstado".trim()));
            dto.setCodigo(Integer.parseInt(request.getParameter("txtCodigo".trim())));

            if (!new PacienteDaoImp().validarPaciente(dto.getRut_paciente())) {
                mensaje = "No existe un Paciente con ese Rut";
                System.out.println("aqui llega");
            } else if (!new TratamientoDaoImp().validarTratamiento(dto.getId_tratamiento())) {
                mensaje = "No existe ese tratamiento";
                System.out.println("aqui llega trata");
            } else if (!new MedicamentoDaoImp().validarMedicamento(dto.getCodigo())) {
                mensaje = "No existe un Medicamento con ese Codigo";
                System.out.println("aqui llega medicamento");
            } else if (new dao.ReservaDaoImp().agregar(dto)) {
                mensaje = "Reserva agregada";
            } else {
                mensaje = "Reserva no agregada";
            }

            request.setAttribute("mensaje", mensaje);

            request.getRequestDispatcher("Farmaceutico/ReservaMedicamento.jsp").forward(request, response);
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
