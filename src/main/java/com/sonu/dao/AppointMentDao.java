package com.sonu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sonu.entity.Appointment;

public class AppointMentDao {

	private Connection con;

	public AppointMentDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addApointment(Appointment app) {
		boolean f = false;
		try {
			String sql = "insert into appointment(user_id,fullname,gender,age,appointment_date,email,phoneno,diseases,doctor_id,address,status) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, app.getUserId());
			ps.setString(2, app.getFullname());
			ps.setString(3, app.getGender());
			ps.setString(4, app.getAge());
			ps.setString(5, app.getAppointdate());
			ps.setString(6, app.getEmail());
			ps.setString(7, app.getPhNo());
			ps.setString(8, app.getDiseases());
			ps.setInt(9, app.getDoctorId());
			ps.setString(10, app.getAddress());
			ps.setString(11, app.getStatus());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Appointment> getAllApointmentByLoginUser(int userId) {
		List<Appointment> list = new ArrayList<>();
		Appointment ap = null;
		try {
			String sql = "select * from appointment where user_id = ? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointdate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Appointment> getAllApointmentByDoctorLogin(int doctrId) {
		List<Appointment> list = new ArrayList<>();
		Appointment ap = null;
		try {
			String sql = "select * from appointment where doctor_id = ? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, doctrId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointdate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Appointment getAppointMentById(int id) {
		List<Appointment> list = new ArrayList<>();
		Appointment ap = null;
		try {
			String sql = "select * from appointment where id = ? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointdate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ap;
	}

	public boolean updateCommentStatus(int id, int docId, String comm) {
		boolean f = false;
		try {
			String sql ="update appointment set status = ? where id = ? and doctor_id= ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, docId);
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
	public List<Appointment> getAllApointment() {
		List<Appointment> list = new ArrayList<>();
		Appointment ap = null;
		try {
			String sql = "select * from appointment order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointdate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
