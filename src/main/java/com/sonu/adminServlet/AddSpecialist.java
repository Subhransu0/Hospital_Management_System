package com.sonu.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonu.dao.SpecialistDao;
import com.sonu.db.DBConnect;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String spec = req.getParameter("specialistname");

		SpecialistDao dao = new SpecialistDao(DBConnect.getConnection());
		boolean f = dao.addSpecialist(spec);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("SucMsg", "Specialist Added");
			resp.sendRedirect("admin/index.jsp");

		} else {
			session.setAttribute("specMsg", "something wrong on server");
			resp.sendRedirect("admin/index.jsp");
		}
	}

}
