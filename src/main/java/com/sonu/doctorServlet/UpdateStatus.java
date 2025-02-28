package com.sonu.doctorServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonu.dao.AppointMentDao;
import com.sonu.db.DBConnect;

@WebServlet("/comment")
public class UpdateStatus extends HttpServlet{
	

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int did = Integer.parseInt(req.getParameter("did"));
			String comment = req.getParameter("comment");
			HttpSession session = req.getSession();
			
			AppointMentDao dao = new AppointMentDao(DBConnect.getConnection());
			if(dao.updateCommentStatus(id, did, comment)) {
				session.setAttribute("succMsg", "Comment Update");
				resp.sendRedirect("doctor/patient.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Something Wrong On My Server ");
				resp.sendRedirect("doctor/patient.jsp");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
