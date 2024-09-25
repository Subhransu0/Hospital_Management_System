package com.sonu.userServlet;

import java.io.IOException;

import com.sonu.dao.UserDao;
import com.sonu.db.DBConnect;
import com.sonu.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet { 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			User u = new User(name, email, password);

			UserDao dao = new UserDao(DBConnect.getConnection());
			
			HttpSession session = req.getSession();
			boolean f = dao.userRegistration(u);
			
			if(f) {
				session.setAttribute("SucMsg", "Register Successfull");
				resp.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("errMsg", "Something Wrong On Server");
				resp.sendRedirect("signup.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
