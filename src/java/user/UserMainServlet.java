/*
 * NOMBRE DEL PROGRAMA: UserMainServlet
 * 
 * DESCRIPCION: 
 * Este programa permite mostrar todos los registros de usuarios existentes en 
 * la base de datos alojandolos en datatable.
 * 
 * FUNCIONALIDAD: 
 * El programa es invocado mediante url por los items "DataTable Usuarios".
 */
package user;

import java.io.IOException;
import java.sql.Connection;
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
 * @author patricio
 */
@WebServlet(name = "UserMainServlet", urlPatterns = {"/UserMainServlet"})
public class UserMainServlet extends HttpServlet {

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

            ////////////////////////
            // COMPROBAR SESSION
            ////////////////////////
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

                    //////////////////////////////////
                    // RECIBIR Y COMPROBAR PARAMETOS
                    //////////////////////////////////

                    /* obtener variables de session */
                    String redirect = (String) session.getAttribute("redirectDel");

                    /* obtener mensajes de session */
                    String msgDel = (String) session.getAttribute("msgDel");
                    String msgErrorConstraint = (String) session.getAttribute("msgErrorConstraint");
                    String msgListErrorConstaint = (String) session.getAttribute("msgListErrorConstraint");

                    /* limpiar variables de session */
                    session.setAttribute("redirectDel", null);
                    session.setAttribute("msgDel", null);
                    session.setAttribute("msgErrorConstraint", null);
                    session.setAttribute("msgListErrorConstraint", null);

                    /* comprobar redirect desde UserDeleteServlet */
                    if (redirect == null || redirect.trim().equals("")) {
                    } else if (redirect.equals("user")) {

                        /* comprobar eliminacion */
                        if (msgDel == null || msgDel.trim().equals("")) {
                        } else {
                            request.setAttribute("msgDel", msgDel);
                        }

                        /* comprobar error eliminacion individual */
                        if (msgErrorConstraint == null || msgErrorConstraint.trim().equals("")) {
                        } else {
                            request.setAttribute("msgErrorConstraint", msgErrorConstraint);
                        }

                        /* comprobar errores de eliminacion grupal */
                        if (msgListErrorConstaint == null || msgListErrorConstaint.isEmpty() || msgListErrorConstaint.trim().equals("")) {
                        } else {
                            request.setAttribute("msgListErrorConstraint", msgListErrorConstaint);
                        }
                    }

                    /* obtener lista de usuarios */
                    try {
                        Collection<UserBean> list = userDAO.getAll();
                        request.setAttribute("list", list);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    /* marcar item de menu */
                    request.setAttribute("userActive", "active");

                    /* despachar a la vista */
                    request.getRequestDispatcher("/user/userMain.jsp").forward(request, response);
                }
            } catch (Exception ex) {
                System.out.println("no ha iniciado session");
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
