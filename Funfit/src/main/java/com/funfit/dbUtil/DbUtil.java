package com.funfit.dbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {
	
	public static Connection getConn() throws ClassNotFoundException, SQLException {
		//Step-1: Register the vendor Driver
		Class.forName(DbUtilHelperConstant.DRIVER_CLASS);
		
		//Step-2: Connection with Database-> DBUrl, Username, Password
		Connection con = DriverManager.getConnection(DbUtilHelperConstant.DB_URL, DbUtilHelperConstant.USERNAME, DbUtilHelperConstant.PASSWORD);
		return con;
	}
}
