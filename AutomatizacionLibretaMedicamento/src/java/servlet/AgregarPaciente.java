/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dto.PacienteDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.PacienteDaoImp;
import dao.ReservaDaoImp;
/**
 *
 * @author Kevin
 */
public class AgregarPaciente extends HttpServlet {

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
            PacienteDto dto = new PacienteDto();
            dto.setRut_paciente(request.getParameter("txtRut".trim()));
            dto.setNombre(request.getParameter("txtNombre".trim()));
            dto.setApellido_paterno(request.getParameter("txtApellidoPat".trim()));
            dto.setApellido_materno(request.getParameter("txtApellidoMat".trim()));
            dto.setDireccion(request.getParameter("txtDireccion".trim()));
            dto.setTelefono(request.getParameter("txtTelefono".trim()));
            dto.setCorreo(request.getParameter("txtCorreo".trim()));
            dto.setFecha_nacimiento(Date.valueOf(request.getParameter("txtFechaNacimiento")));
            dto.setId_Reserva(Integer.parseInt(request.getParameter("txtReserva".trim())));

            if (new PacienteDaoImp().validarPaciente(dto.getRut_paciente())) {
                mensaje = "Ya existe un paciente con ese Rut";
            }else if (!new ReservaDaoImp().validarReserva(dto.getId_Reserva())) {
                mensaje = "No hay Reservas con ese numero";
            } else if (new dao.PacienteDaoImp().agregar(dto)) {

                mensaje = "Paciente agregado";

            } else {
                mensaje = "Paciente no agregado";
            }

            request.setAttribute("lista", new dao.PacienteDaoImp().listar());
            request.setAttribute("mensaje", mensaje);

            request.getRequestDispatcher("Paciente/AgregarPaciente.jsp").forward(request, response);
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
