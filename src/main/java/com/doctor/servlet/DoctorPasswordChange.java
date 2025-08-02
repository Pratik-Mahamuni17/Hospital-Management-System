package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/doctorChangePassword")
public class DoctorPasswordChange extends HttpServlet{
	
	
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        HttpSession session = request.getSession();

	        User user = (User) session.getAttribute("userObj");

	        if (user == null) {
	            session.setAttribute("errorMsg", "User not logged in.");
	            response.sendRedirect("doctor/edit_profile.jsp");
	            return;
	        }

	        int userId = user.getId();
	        String oldPass = request.getParameter("oldPassword");
	        String newPass = request.getParameter("newPassword");

	        DoctorDao dao = new DoctorDao(DBConnect.getConn());

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

	        response.sendRedirect("doctor/edit_profile.jsp");
	    }
}
