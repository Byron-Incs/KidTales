package org.KidTales.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class bdConection {
    
    private static Connection conexion;

    public static Connection start() {
        if (conexion == null) {
            try {
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/KidTalesBD", "root", "1234");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conexion;
    }

    public static void stop() {
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
}