package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.FarmaceuticoDto;
import dao.FarmaceuticoDaoImp;
/**
 *
 * @author Sergio
 */
public class EliminarFarmaceutico extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

           FarmaceuticoDto dto = new FarmaceuticoDto();
            
           dto.setRut(request.getParameter("txtRut".trim()));
            
           String mensaje = "";
           if(new dao.FarmaceuticoDaoImp().eliminar(dto)){
               
               mensaje = "Farmaceutico eliminado";
           }else{
               
               mensaje = "Farmaceutico no eliminado";
           }
          request.setAttribute("mensaje", mensaje);
          request.setAttribute("lista",  new dao.FarmaceuticoDaoImp().listar());
          
          request.getRequestDispatcher("Farmaceutico/EliminarFarmaceutico.jsp").forward(request, response);
           
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
