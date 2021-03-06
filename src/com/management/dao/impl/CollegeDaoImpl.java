package com.management.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import com.management.dao.CollegeDao;
import com.management.entities.College;
import com.management.utils.MySQLConnectionUtils;

public class CollegeDaoImpl implements CollegeDao {

	/**
	 * 查询所有学院信息
	 */
	@Override
	public List<College> queryAllCollege() throws SQLException {

		String sql = "SELECT * FROM college";
		ResultSet res = MySQLConnectionUtils.mySQLResult(sql);
		List<College> list = new LinkedList<College>();

		while (res.next()) {
			College college = new College();
			college.setId(res.getInt(1));
			college.setName(res.getString(2));
			list.add(college);
		}

		return list;
	}

	/**
	 * 通过学院ID查询学院信息
	 */
	@Override
	public College queryCollegeById(Integer id) throws SQLException {

		String sql = "SELECT * FROM college WHERE id='" + id + "'";
		ResultSet res = MySQLConnectionUtils.mySQLResult(sql);
		College college = new College();

		while (res.next()) {
			college.setId(res.getInt(1));
			college.setName(res.getString(2));
		}

		return college;
	}

	/**
	 * 通过学院名字查询学院信息
	 */
	@Override
	public College queryCollegeByName(String name) throws SQLException {

		String sql = "SELECT * FROM college WHERE name='" + name + "'";
		ResultSet res = MySQLConnectionUtils.mySQLResult(sql);
		College college = new College();

		while (res.next()) {
			college.setId(res.getInt(1));
			college.setName(res.getString(2));
		}
		return college;
	}

	/**
	 * 添加学院信息
	 */
	@Override
	public void addCollege(College college) throws SQLException {

		String sql = "INSERT INTO `college` (`id`, `name`) VALUES (?,?)";
		Connection con = MySQLConnectionUtils.mySQLConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		Integer id = college.getId();
		String name = college.getName();

		ps.setInt(1, id);
		ps.setString(2, name);

		ps.execute();
		
		ps.close();
		con.close();

	}

	/**
	 * 修改学院信息
	 */
	@Override
	public void alertCollege(College college) throws SQLException {

		String sql = "UPDATE `college` SET `name`=? WHERE (`id`=?)";
		Connection con = MySQLConnectionUtils.mySQLConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		Integer id = college.getId();
		String name = college.getName();

		ps.setString(1, name);
		ps.setInt(2, id);

		ps.execute();
		
		ps.close();
		con.close();

	}

	/**
	 * 删除学院信息
	 */
	@Override
	public void deleteCollege(Integer id) throws SQLException {

		String sql = "DELETE FROM `college` WHERE (`id`='" + id + "')";
		Connection con = MySQLConnectionUtils.mySQLConnection();
		Statement statement = con.createStatement();
		statement.execute(sql);
		
		statement.close();
		con.close();

	}

	/**
	 * 判断学院名字是否存在
	 */
	@Override
	public boolean existCollege(String collegeName) throws SQLException {

		String sql = "SELECT * FROM college WHERE name='" + collegeName + "'";
		ResultSet res = MySQLConnectionUtils.mySQLResult(sql);
		return res.next();
	}

}
