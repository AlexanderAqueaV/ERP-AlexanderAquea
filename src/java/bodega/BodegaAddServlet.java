/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bodega;

import Helpers.StringMD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import user.UserBean;
import user.UserDAO;

/**
 *
 * @author alexander
 */
@WebServlet(name = "BodegaAddServlet", urlPatterns = {"/BodegaAddServlet"})
public class BodegaAddServlet extends HttpServlet {

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

        Connection conexion = null;

        /////////////////////////
        // ESTABLECER CONEXION
        /////////////////////////
        try {
            conexion = ds.getConnection();

            UserDAO userDAO = new UserDAO();
            userDAO.setConexion(conexion);

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

                /* comprobar permisos de usuario */
                if (userTypeX > 2) {
                    request.getRequestDispatcher("/ForbiddenServlet").forward(request, response);
                } else {

                    /* establecer variables de usuario en sesion */
                    request.setAttribute("idUserX", idUserX);
                    request.setAttribute("usernameX", usernameX);
                    request.setAttribute("userTypeX", userTypeX);

                    ////////////////////////////////////
                    // RECIBIR Y COMPROBAR PARAMETROS
                    ////////////////////////////////////

                    /* obtener parametros de la vista */
                    String warehouseName = request.getParameter("warehousename");
                    String volume = request.getParameter("volume");


                    /* establecer variables de sesion */
                    session.setAttribute("redirectAdd", "user");
                    session.setAttribute("warehousename", warehouseName);
                    session.setAttribute("volume", volume);

                    /* instanciar user */
                    UserBean user = new UserBean();

                    /* flag de error */
                    boolean error = false;

                    /* comprobar username */
                    if (warehouseName == null || warehouseName.trim().equals("")) {
                        session.setAttribute("msgErrorWareHouse", "Debe ingresar Nombre de la bodega.");
                        error = true;
                    } else {
                        // user.setUsername(warehouseName);
                    }

                    if (volume != null || volume.trim().equals("")) {
                        session.setAttribute("msgErrorVolume", "Error al recibir volumen.");
                        error = true;
                    } else {
                        /*try {
                         session.setAttribute(Integer.parseInt(telephone));
                         } catch (NumberFormatException n) {
                         request.setAttribute("msgErrorTelephone", "Error al recibir telefono, debe ser numérico.");
                         error = true;
                         }*/
                    }

                    //////////////////////
                    // LOGICA DE NEGOCIO
                    //////////////////////


                    /* insertar registro */
                    if (!error) {
                        try {
                            userDAO.insert(user);
                            session.setAttribute("msgOk", "Registro ingresado exitosamente.");
                        } catch (Exception ex) {
                            session.setAttribute("msgErrorDup", "Registro duplicado, verifique campos ingresados.");
                        }
                    }

                    /* send redirect */
                    response.sendRedirect("BodegaGetAddServlet");
                }
            } catch (Exception sesionException) {
                System.err.println("no ha iniciado session");
                request.getRequestDispatcher("/login/login.jsp").forward(request, response);
            }

        } catch (Exception connectionException) {
            connectionException.printStackTrace();
        } finally {
            /* cerrar conexion */
            try {
                conexion.close();
            } catch (Exception noGestionar) {
            }
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
