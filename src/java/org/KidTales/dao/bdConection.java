package org.KidTales.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Esta clase gestiona la conexión a la base de datos KidTalesBD.
 */
public class bdConection {

    private static Connection conexion;

    /**
     * Inicia la conexión a la base de datos si aún no se ha establecido.
     * @return La conexión a la base de datos.
     */
    public static Connection start() {
        if (conexion == null) {
            try {
                // Establece la conexión a la base de datos MySQL.
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/KidTalesBD", "root", "1234");
            } catch (SQLException e) {
                // Maneja las excepciones de SQL imprimiendo el rastreo de la pila.
                e.printStackTrace();
            }
        }
        return conexion;
    }

    /**
     * Cierra la conexión a la base de datos si está abierta.
     */
    public static void stop() {
        if (conexion != null) {
            try {
                // Cierra la conexión a la base de datos.
                conexion.close();
            } catch (SQLException e) {
                // Maneja las excepciones de SQL imprimiendo el rastreo de la pila.
                e.printStackTrace();
            }
        }
    }
}