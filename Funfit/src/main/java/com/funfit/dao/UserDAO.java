package com.funfit.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.funfit.dbUtil.DbUtil;
import com.funfit.pojo.User;

public class UserDAO {
	
	public int insertUserintodb(User user) throws ClassNotFoundException, SQLException {
		Connection con = DbUtil.getConn();
		if(con!=null) {
			System.out.println("Database Connect Successfully");
		}else {
			System.out.println("Database Not connected");
		}
		
		String sql = "INSERT INTO user (name, mobile, age, weight, email, password, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		//System.out.println(sql);
		ps.setString(1, user.getName());
		ps.setString(2, user.getMobile());
		ps.setInt(3, user.getAge());
		ps.setDouble(4, user.getWeight());
		ps.setString(5, user.getEmail());
		ps.setString(6, user.getPassword());
		ps.setString(7, user.getAddress());
		
		int i = ps.executeUpdate(); //the number of rows
		//insert, update, delete---executeUpdate 
		return i;
		
	
	}
	
	public List<User> retreiveUserData() throws SQLException, ClassNotFoundException {
        try (Connection con = DbUtil.getConn()) {
            if (con == null) {
                System.out.println("Database connection failed");
                return new ArrayList<>();
            }
            System.out.println("Database connected successfully");

            String sql = "SELECT * FROM user";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                List<User> list = new ArrayList<>();

                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id")); // Retrieve auto-incrementing ID
                    user.setName(rs.getString("name"));
                    user.setMobile(rs.getString("mobile"));
                    user.setAge(rs.getInt("age"));
                    user.setWeight(rs.getDouble("weight"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setAddress(rs.getString("address"));
                    list.add(user);
                }
                return list;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            throw e;
        }
    }
	
	public User validateUser(String email, String password) throws SQLException, ClassNotFoundException {
        try (Connection con = DbUtil.getConn()) {
            if (con == null) {
                System.out.println("Database connection failed");
                return null;
            }
            System.out.println("Database connected successfully");

            String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setMobile(rs.getString("mobile"));
                    user.setAge(rs.getInt("age"));
                    user.setWeight(rs.getDouble("weight"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setAddress(rs.getString("address"));
                    return user;
                }
                return null;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            throw e;
        }
    }
}
