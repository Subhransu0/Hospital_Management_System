package com.sonu.adminServlet;

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

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String fullname = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String specialist = req.getParameter("specialist");
			String email = req.getParameter("email");
			String mobileno = req.getParameter("mobileno");
			String password = req.getParameter("password");

			Doctor d = new Doctor(id, fullname, dob, qualification, specialist, email, mobileno, password);

			DoctorDao dao = new DoctorDao(DBConnect.getConnection());
			HttpSession session = req.getSession();

			if (dao.updateDoctor(d)) {
				session.setAttribute("succMsg", "Doctor Update Successfully");
				resp.sendRedirect("admin/doctor.jsp");
			} else {
				session.setAttribute("errorMsg", "internal server error");
				resp.sendRedirect("admin/doctor.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
