package com.sonu.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonu.dao.AppointMentDao;
import com.sonu.db.DBConnect;
import com.sonu.entity.Appointment;

@WebServlet("/add_appoint")
public class AppointmentServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int userid = Integer.parseInt(req.getParameter("userid"));
			String fullname = req.getParameter("fullname");
			String gender = req.getParameter("gender");
			String age = req.getParameter("age");
			String appoint_date = req.getParameter("appoint_date");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String diseases = req.getParameter("diseases");
			int doctor = Integer.parseInt(req.getParameter("doctor"));
			String address = req.getParameter("address");
			HttpSession session = req.getSession();
			Appointment app = new Appointment(userid, fullname, gender, age, appoint_date, email, phoneno, diseases,
					doctor, address, "pending");

			AppointMentDao dao = new AppointMentDao(DBConnect.getConnection());

			if (dao.addApointment(app)) {
				session.setAttribute("appointSuccMsg", "Appointment Booked Successfully!");
				resp.sendRedirect("user_appointment.jsp");
			}else {
				session.setAttribute("appointerrMsg", "Appointment Booking Failed");
				resp.sendRedirect("user_appointment.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
