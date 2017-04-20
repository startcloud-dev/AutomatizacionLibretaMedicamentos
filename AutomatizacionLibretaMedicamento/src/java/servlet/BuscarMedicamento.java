package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MedicamentoDaoImp;
import java.util.List;
import dto.MedicamentoDto;

/**
 *
 * @author Sergio
 */
public class BuscarMedicamento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String justi = request.getParameter("txtJustificacion".trim());

            int codigo = Integer.parseInt(request.getParameter("txtCodigo".trim()));

            List<MedicamentoDto> lista = new dao.MedicamentoDaoImp()
                    .buscarPorCodigo(codigo);

            if (lista.isEmpty()) {

                request.setAttribute("mensaje", "No se encuentra empleado ");
            } else {

                request.setAttribute("lista", lista);
                request.setAttribute("mensaje", "Empleado Encontrado");
                MedicamentoDto dto = new MedicamentoDto();
                dto.setCodigo(codigo);
                new dao.MedicamentoDaoImp().eliminar(dto);
            }

            if (new dao.MedicamentoDaoImp().ingresarJustificacion(justi, codigo)) {

                request.setAttribute("mensaje", "Justificacion agregada con exito");
            } else {
                request.setAttribute("mensaje", "Justificacion No agregada");
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
