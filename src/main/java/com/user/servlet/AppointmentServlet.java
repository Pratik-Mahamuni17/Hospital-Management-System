package com.user.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_appointment")
public class AppointmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		String fullname = req.getParameter("fullName");
		String gender = req.getParameter("gender");
		String  age = req.getParameter("age");
		String appointDate = req.getParameter("appoint_date");
		String email =req.getParameter("email");
		String phno = req.getParameter("phno");
		String diseases = req.getParameter("diseases");
		int doctorId = Integer.parseInt(req.getParameter("doct"));
		String address = req.getParameter("address");
		
		Appointment ap = new Appointment(userId, fullname, gender, age, appointDate,
                email, phno, diseases, doctorId, address, "Pending");

		AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
		
		HttpSession session = req.getSession();
		
		if(dao.addAppointment(ap)) {
			session.setAttribute("succMsg", "Appointment Booked");
			resp.sendRedirect("user_appointment.jsp");
		}else {
			session.setAttribute("errorMsg", "Something Went wrong on server");
			resp.sendRedirect("user_appointment.jsp");
		}
		
	}
	
	

}
