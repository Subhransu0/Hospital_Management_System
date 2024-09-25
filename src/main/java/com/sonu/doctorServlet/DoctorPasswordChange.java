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

@WebServlet("/doctorchangepassword")
public class DoctorPasswordChange extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String newpassword = req.getParameter("newpassword");
		String oldpassword = req.getParameter("oldpassword");
		int uid = Integer.parseInt(req.getParameter("uid"));
		
		DoctorDao dao = new DoctorDao(DBConnect.getConnection());
		HttpSession session = req.getSession();
		
		if(dao.checkOldPassword(uid, oldpassword)) {
			if(dao.changeOldPassword(uid, newpassword)) {
				session.setAttribute("passSuccMsg", "Password Change Successfully");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
			else {
				session.setAttribute("passMsg", "Internal Server Error");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
		}
		else {
			session.setAttribute("passMsg", "Old password Incorrect");
			resp.sendRedirect("doctor/edit_profile.jsp");
		}
		
	}
}
