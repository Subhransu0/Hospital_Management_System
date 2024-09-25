package com.sonu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sonu.entity.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean userRegistration(User u) {
		boolean f = false;
		try {
			PreparedStatement ps = con
					.prepareStatement("insert into user_details(fulllname , email , password) values(? , ? , ?)");
			ps.setString(1, u.getFulllname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
				System.out.println("Success");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User userlogin(String em, String pas) {
		User u = null;
		try {
			String sql = "select * from user_details where email = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, pas);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFulllname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}

	public boolean checkOldPassword(int userId, String oldpassword) {
		boolean f = false;

		try {
			String sql = "select * from user_details where id=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, oldpassword);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean changeOldPassword(int userId, String newpassword) {
		boolean f = false;

		try {
			String sql = "update user_details set password=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, newpassword);
			ps.setInt(2, userId);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();		
		}

	return f;
}
	
	

}
