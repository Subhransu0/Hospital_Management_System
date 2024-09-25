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

@WebServlet("/editProfileDoctor")
public class EditDoctorServlet extends HttpServlet {
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

			Doctor d = new Doctor(id, fullname, dob, qualification, specialist, email, mobileno, "");

			DoctorDao dao = new DoctorDao(DBConnect.getConnection());
			HttpSession session = req.getSession();

			if (dao.editDoctorProfile(d)) {
				Doctor d1 = dao.getDoctorById(id);
				session.setAttribute("succMsgedit", "Doctor Update Successfully");
				session.setAttribute("doctorObj", d1);
				resp.sendRedirect("doctor/edit_profile.jsp");
			} else {
				session.setAttribute("errorMsgedit", "internal server error");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
