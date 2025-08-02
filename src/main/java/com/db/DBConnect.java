package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static final String URL = "jdbc:mysql://localhost:3307/hospital_1";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Satara@123";

    private static Connection conn = null;

    public static Connection getConn() {
        if (conn == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Load JDBC driver
                conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace(); // Log exception
            }
        }
        return conn;
    }
}
