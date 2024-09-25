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

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id =Integer.parseInt(req.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DBConnect.getConnection());
		HttpSession session = req.getSession();
		if(dao.deleteDoctor(id)) {
			session.setAttribute("delesuccMsg", "Delete SuccessFully");
			resp.sendRedirect("admin/doctor.jsp");
		}
		else {
			session.setAttribute("deleerrMsg", "internal server error ...!");
			resp.sendRedirect("admin/doctor.jsp");
		}
	}

}
