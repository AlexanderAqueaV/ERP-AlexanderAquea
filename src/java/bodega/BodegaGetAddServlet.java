/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bodega;

import Helpers.Message;
import Helpers.MessageList;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author alexander
 */
@WebServlet(name = "BodegaGetAddServlet", urlPatterns = {"/BodegaGetAddServlet"})
public class BodegaGetAddServlet extends HttpServlet {

    @Resource(name = "jdbc/ERP")
    private DataSource ds;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        ///////////////////////
        // COMPROBAR SESSION
        ///////////////////////
        try {
            /* recuperar sesion */
            HttpSession session = request.getSession(false);

            /* obtener parametros de session */
            int idUserX = Integer.parseInt((String) session.getAttribute("idUserX"));
            int userTypeX = Integer.parseInt((String) session.getAttribute("userTypeX"));
            String usernameX = (String) session.getAttribute("usernameX");

            ///////////////////////////////////
            // COMPROBAR PERMISOS DE USUARIO
            ///////////////////////////////////

            if (userTypeX > 2) {
                /* acceso prohibido */
                request.getRequestDispatcher("/ForbiddenServlet").forward(request, response);
            } else {

                /* establecer variables de usuario en sesion */
                request.setAttribute("idUserX", idUserX);
                request.setAttribute("usernameX", usernameX);
                request.setAttribute("userTypeX", userTypeX);

                ////////////////////////////////////
                // RECIBIR Y COMPROBAR PARAMETROS
                ////////////////////////////////////

                request.setAttribute("msg", "Ingrese una nueva bodega");
                /* despachar a la vista */
                request.getRequestDispatcher("/bodega/bodegaAdd.jsp").forward(request, response);
            }
        } catch (Exception sesionException) {
            /* enviar a la vista de login */
            System.err.println("no ha iniciado session");
            request.getRequestDispatcher("/login/login.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
