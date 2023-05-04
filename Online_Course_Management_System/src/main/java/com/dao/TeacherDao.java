package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Teacher;

public class TeacherDao {

	private Connection conn;

	public TeacherDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerTeacher(Teacher d) {

		boolean f = false;

		try {
			String sql = "insert into teacher(full_name,course,email,password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, d.getFullName());
			ps.setString(2, d.getCourse());
			ps.setString(3, d.getEmail());
			ps.setString(4, d.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public Teacher login(String email, String psw) {

		Teacher d = null;

		try {

			String sql = "select * from teacher where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Teacher();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setCourse(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setPassword(rs.getString(5));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;

	}

	public List<Teacher> getAllTeacher() {

		List<Teacher> list = new ArrayList<Teacher>();
		Teacher d = null;

		try {

			String sql = "select * from teacher order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Teacher();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setCourse(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setPassword(rs.getString(5));

				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List<String> getAllCourse() {

		List<String> list = new ArrayList<String>();

		try {

			String sql = "select course from teacher order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String course = rs.getString(1);
				list.add(course);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


}
