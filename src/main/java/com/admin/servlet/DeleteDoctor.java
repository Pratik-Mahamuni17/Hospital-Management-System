package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int  id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		
		HttpSession session = req.getSession();
		
		if(dao.deleteDoctor(id)) {
			session.setAttribute("succMsg", "Doctor delete Successfully..");
			resp.sendRedirect("admin/view_doctor.jsp");
		}else {
			session.setAttribute("errorMsg", "Something Wrong on Server");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
	}
	
	
}
