/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MY PC
 */
@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/UpdateProfileServlet"})
public class UpdateProfileServlet extends HttpServlet {

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
        try {
            String method = request.getParameter("method");
            if (method.equals("post")) {
                doPost(request, response);
            } else {
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        String url = "";
        try {
            int userId = Integer.parseInt(request.getParameter("txtId"));
            String password = request.getParameter("txtPassword");
            String rePassword = request.getParameter("txtRePassword");
            String fullName = request.getParameter("txtFullName");

            AccountDAO accountDAO = new AccountDAO();
            HttpSession session = request.getSession();

            boolean updatePassword = false;
            if (!password.isEmpty()) {
                updatePassword = true;
            }
            if (updatePassword) {
                //update Password
                if (password.equals(rePassword)) {
                    accountDAO.updatePassword(userId, rePassword);
                    request.setAttribute("WARNING", "Update Success!");
                } else {
                    request.setAttribute("WARNING", "PASSWORD MUST MATCH RE-PASSWORD!");
                }
                url = "MainController?btnAction=viewProfile";

            } else {
                //update Fullname
                if (!fullName.trim().isEmpty()) {
                    request.setAttribute("WARNING", "Update Success!");
                    accountDAO.updateFullName(userId, fullName);

                } else {
                    request.setAttribute("WARNING", "YOU MUST INPUT FULLNAME!");
                }
                url = "MainController?btnAction=viewProfile";
            }
            session.setAttribute("ACC", accountDAO.getAccountById(userId));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
