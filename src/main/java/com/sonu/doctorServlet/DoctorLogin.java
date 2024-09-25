package com.sonu.doctorServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonu.dao.DoctorDao;
import com.sonu.db.DBConnect;
import com.sonu.entity.Doctor;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();

		DoctorDao dao = new DoctorDao(DBConnect.getConnection());

		Doctor d = dao.login(email, password);
		if (d != null) {
			session.setAttribute("doctorObj", d);
			resp.sendRedirect("doctor/index.jsp");

		} else {
			session.setAttribute("errorMsg", "invalid email and password !!");
			resp.sendRedirect("doctor_login.jsp");
		}
	}

}
