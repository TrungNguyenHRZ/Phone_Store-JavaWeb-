/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MY PC
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

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
        String url = "";
        try {
            String action = request.getParameter("btnAction");
            if (action == null) {
                url = "ProductServlet";
            } else {

                switch (action) {
                    case "Login":
                        url = "LoginServlet";
                        break;
                    case "LoginPage":
                        url = "login.html";
                        break;
                    case "RegisterPage":
                        url = "register.html";
                        break;
                    case "Register":
                        url = "RegisterServlet";
                        break;
                    case "viewCart":
                        url = "viewCart.jsp";
                        break;
                    case "ViewProduct":
                        url = "ProductServlet";
                        break;
                    case "Search":
                        url = "SearchProductServlet";
                        break;
                    case "viewProfile":
                        url = "ViewProfileServlet";
                        break;
                    case "Checkout":
                        url = "CheckoutServlet";
                        break;
                    case "deleteCart":
                        url = "DeleteCart";
                        break;
                    case "logout":
                        url = "LogoutServlet";
                        break;
                    case "updateProfile":
                        url = "UpdateProfileServlet";
                        break;
                    case "viewOrderDetail":
                        url = "ViewOrderDetailServlet";
                        break;
                    case "viewProductDetail":
                        url = "ViewProductDetailServlet";
                        break;
                        
                        

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
