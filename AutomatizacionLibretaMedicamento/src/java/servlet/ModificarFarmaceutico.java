
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
public class ModificarFarmaceutico extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
            String mensaje = "";
            
            FarmaceuticoDto dto = new FarmaceuticoDto();
            dto.setNombre(request.getParameter("txtNombre".trim()));
            dto.setDireccion(request.getParameter("txtDireccion".trim()));
            dto.setTelefono(Integer.parseInt("txtTelefeno".trim()));
            dto.setId_seccion(Integer.parseInt("txtIdSeccion".trim()));
            
            if(new dao.FarmaceuticoDaoImp().modificar(dto)){
               
             mensaje = "farmaceutico modificado";   
            }else{
                
              mensaje = "farmaceutico  no modificado";
            }
            request.setAttribute("mensaje",mensaje );
            request.setAttribute("lista",  new dao.FarmaceuticoDaoImp().listar());
            
            request.getRequestDispatcher("Farmaceutico/ModificarFarmaceutico.jsp").forward(request, response);
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
