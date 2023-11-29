package KidTales;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/KidTalesDB";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        try {
            // Realizar la inserción en la tabla Usuario
            int userID = insertarUsuario(nombre, correo, contrasena);

            // Inserción en la tabla UsuarioRol
            insertarUsuarioRol(userID, 2); // RolID = 2

            // Inserción en la tabla Padre
            insertarPadre(userID, 0000); // CodigoControlParental = 0000

            // Inserción en la tabla ConfiguracionPadre
            insertarConfiguracionPadre(userID, 0, "N/A", "Español"); // Valores iniciales

            // Inserción en la tabla Chat
            insertarChat(userID);

            // Redirigir a la página de registro exitoso u otra página
            response.sendRedirect("registroExitoso.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar errores según tus necesidades
            response.sendRedirect("error.jsp");
        }
    }

    // Método para la inserción en la tabla Usuario
    private int insertarUsuario(String nombre, String correo, String contrasena) throws SQLException {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "INSERT INTO Usuario (Nombre, Correo, Contrasena) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
                statement.setString(1, nombre);
                statement.setString(2, correo);
                statement.setString(3, contrasena);
                int rowsAffected = statement.executeUpdate();

                if (rowsAffected == 1) {
                    // Obtener el ID generado automáticamente
                    ResultSet generatedKeys = statement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        }
        throw new SQLException("No se pudo insertar el usuario");
    }

    // Método para la inserción en la tabla UsuarioRol
    private void insertarUsuarioRol(int userID, int rolID) throws SQLException {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "INSERT INTO UsuarioRol (UserID, RolID) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, userID);
                statement.setInt(2, rolID);
                statement.executeUpdate();
            }
        }
    }

    // Método para la inserción en la tabla Padre
    private void insertarPadre(int userID, int codigoControlParental) throws SQLException {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "INSERT INTO Padre (UserID, CodigoControlParental) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, userID);
                statement.setInt(2, codigoControlParental);
                statement.executeUpdate();
            }
        }
    }

    // Método para la inserción en la tabla ConfiguracionPadre
    private void insertarConfiguracionPadre(int userID, int tiempoPantalla, String metodoPago, String idioma) throws SQLException {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "INSERT INTO ConfiguracionPadre (UserID, TiempoPantalla, MetodoPago, Idioma) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, userID);
                statement.setInt(2, tiempoPantalla);
                statement.setString(3, metodoPago);
                statement.setString(4, idioma);
                statement.executeUpdate();
            }
        }
    }

    // Método para la inserción en la tabla Chat
    private void insertarChat(int userID) throws SQLException {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "INSERT INTO Chat (PadreID, SoporteTecnicoID) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, userID);
                int soporteTecnicoID = obtenerIDSoporteTecnicoAleatorio();
                statement.setInt(2, soporteTecnicoID);
                statement.executeUpdate();
            }
        }
    }

    // Método para obtener un ID de SoporteTecnico aleatorio (solo como ejemplo)
    private int obtenerIDSoporteTecnicoAleatorio() throws SQLException {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String query = "SELECT UserID FROM SoporteTecnico ORDER BY RAND() LIMIT 1";
            try (Statement statement = connection.createStatement()) {
                try (ResultSet resultSet = statement.executeQuery(query)) {
                    if (resultSet.next()) {
                        return resultSet.getInt("UserID");
                    }
                }
            }
        }
        throw new SQLException("No se pudo obtener un ID de SoporteTecnico aleatorio");
    }

    // Método principal para ejecutar la aplicación
    public static void main(String[] args) {
        // Intenta establecer una conexión con la base de datos
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            // Crea tablas si no existen
            String createUsuarioTable = "CREATE TABLE IF NOT EXISTS Usuario (UserID INT AUTO_INCREMENT PRIMARY KEY, Nombre VARCHAR(255), Correo VARCHAR(255), Contrasena VARCHAR(255))";
            String createUsuarioRolTable = "CREATE TABLE IF NOT EXISTS UsuarioRol (UserID INT, RolID INT, PRIMARY KEY (UserID, RolID), FOREIGN KEY (UserID) REFERENCES Usuario(UserID), FOREIGN KEY (RolID) REFERENCES Rol(RolID))";
            String createPadreTable = "CREATE TABLE IF NOT EXISTS Padre (UserID INT PRIMARY KEY, CodigoControlParental INT(4), FOREIGN KEY (UserID) REFERENCES Usuario(UserID))";
            String createConfiguracionPadreTable = "CREATE TABLE IF NOT EXISTS ConfiguracionPadre (UserID INT PRIMARY KEY, TiempoPantalla INT, MetodoPago VARCHAR(255), Idioma VARCHAR(255), FOREIGN KEY (UserID) REFERENCES Padre(UserID))";
            String createChatTable = "CREATE TABLE IF NOT EXISTS Chat (ChatID INT AUTO_INCREMENT PRIMARY KEY, PadreID INT, SoporteTecnicoID INT, FOREIGN KEY (PadreID) REFERENCES Padre(UserID), FOREIGN KEY (SoporteTecnicoID) REFERENCES SoporteTecnico(UserID))";
            String createSoporteTecnicoTable = "CREATE TABLE IF NOT EXISTS SoporteTecnico (UserID INT PRIMARY KEY, FOREIGN KEY (UserID) REFERENCES Usuario(UserID))";

            // Intenta ejecutar las declaraciones CREATE TABLE
            try (Statement statement = connection.createStatement()) {
                statement.executeUpdate(createUsuarioTable);
                statement.executeUpdate(createUsuarioRolTable);
                statement.executeUpdate(createPadreTable);
                statement.executeUpdate(createConfiguracionPadreTable);
                statement.executeUpdate(createChatTable);
                statement.executeUpdate(createSoporteTecnicoTable);

                // Imprimir un mensaje si la creación de tablas fue exitosa
                System.out.println("Tablas creadas con éxito.");
            }
        } catch (SQLException e) {
            // Captura excepciones de SQL y muestra información de error
            e.printStackTrace();
        }
    }
}
