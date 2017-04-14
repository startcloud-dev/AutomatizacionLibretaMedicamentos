/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DoctorDaoImp;
import dto.DoctorDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kevin
 */
public class AgregarDoctor extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            DoctorDto dto = new DoctorDto();
            dto.setRut_doctor(request.getParameter("txtRut".trim()));
            dto.setNombre(request.getParameter("txtNombre".trim()));
            dto.setEspecialidad(request.getParameter("txtEspecialidad".trim()));
            dto.setDireccion(request.getParameter("txtDireccion".trim()));
            dto.setTelefono(Integer.parseInt(request.getParameter("txtTelefono".trim())));
            dto.setPassword(request.getParameter("txtClave".trim()));

            String pass = request.getParameter("txtClave".trim());
            String conpass = request.getParameter("txtConfClave".trim());
            if (pass.equals(conpass)) {
                new DoctorDaoImp().agregar(dto);
                request.setAttribute("mensaje", "Se registro el Usuario  "
                        + "por favor Inicie Session");
            } else {
                request.setAttribute("mensaje", "Las contraseñas no coinciden "
                        + "Intentelo nuevamente ");
            }
            request.getRequestDispatcher("Doctor/Login_Registro_Doctor.jsp").
                    forward(request, response);
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
