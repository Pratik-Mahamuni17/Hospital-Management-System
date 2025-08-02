package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("userObj");

        if (user == null) {
            session.setAttribute("errorMsg", "User not logged in.");
            response.sendRedirect("user_login.jsp");
            return;
        }

        int userId = user.getId();
        String oldPass = request.getParameter("oldPassword");
        String newPass = request.getParameter("newPassword");

        UserDao dao = new UserDao(DBConnect.getConn());

        if (dao.checkOldPassword(userId, oldPass)) {
            boolean updated = dao.changePassword(userId, newPass);

            if (updated) {
                session.setAttribute("succMsg", "Password changed successfully.");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on server.");
            }
        } else {
            session.setAttribute("errorMsg", "Old password is incorrect.");
        }

        response.sendRedirect("change_password.jsp");
    }
}
