package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.courseRegistration;

public class courseRegDAO {

	private Connection conn;

	public courseRegDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCourse(courseRegistration cr) {
		boolean f = false;
		try {
			String sql = "INSERT INTO ocms.course_reg (studentID, fullName, regNO, courseName) VALUES (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cr.getStudentID());
			ps.setString(2, cr.getFullName());
			ps.setString(3, cr.getRegNO());
			ps.setString(4, cr.getCourseName());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<courseRegistration> getAllCourseByLoginStudent(int studentID) {

		List<courseRegistration> list = new ArrayList<courseRegistration>();
		courseRegistration cr = null;
		try {
			String sql = "select * from ocms.course_reg where studentID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, studentID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cr = new courseRegistration();
				cr.setId(rs.getInt(1));
				cr.setStudentID(rs.getInt(2));
				cr.setFullName(rs.getString(3));
				cr.setRegNO(rs.getString(4));
				cr.setCourseName(rs.getString(5));
				list.add(cr);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

//	public List<courseRegistration> getAllStudentByCourseName(String courseName, int teacherId) {
//	    List<courseRegistration> list = new ArrayList<>();
//	    courseRegistration cr = null;
//	    try {
//	        String sql = "SELECT cr.*, sd.full_name AS student_name " +
//	                     "FROM course_reg cr " +
//	                     "JOIN student_dtls sd ON cr.studentID = sd.id " +
//	                     "JOIN teacher t ON t.course = cr.courseName " +
//	                     "WHERE cr.courseName = ? AND t.id = ?";
//	        PreparedStatement ps = conn.prepareStatement(sql);
//	        ps.setString(1, courseName);
//	        ps.setInt(2, teacherId);
//	        ResultSet rs = ps.executeQuery();
//	        while (rs.next()) {
//	            cr = new courseRegistration();
//	            cr.setId(rs.getInt("id"));
//	            cr.setStudentID(rs.getInt("studentID"));
//	            cr.setFullName(rs.getString("fullName"));
//	            cr.setRegNO(rs.getString("regNO"));
//	            cr.setCourseName(rs.getString("courseName"));
//	            //cr.setStudentName(rs.getString("student_name"));
//	            list.add(cr);
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
//	    return list;
//	}

	public List<courseRegistration> getAllStudentByCourseName(String courseName) {

		List<courseRegistration> list = new ArrayList<courseRegistration>();
		courseRegistration cr = null;
		try {
			String sql = "select * from ocms.course_reg where courseName=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, courseName);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cr = new courseRegistration();
				cr.setId(rs.getInt(1));
				cr.setStudentID(rs.getInt(2));
				cr.setFullName(rs.getString(3));
				cr.setRegNO(rs.getString(4));
				cr.setCourseName(rs.getString(5));
				list.add(cr);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
