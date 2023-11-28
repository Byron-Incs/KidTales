package org.KidTales.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.KidTales.dao.Rol;
import org.KidTales.dao.RolUsuario;
import org.KidTales.dao.Usuario;

public class RolUsuarioService extends Conexion<RolUsuario> {

    public List<RolUsuario> getRolUsuarioList() {
        List<RolUsuario> rolUsuarioList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        RolUsuario rolUsuario = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM UsuarioRol");
            if (resultSet == null) {
                return null;
            }
            rolUsuarioList = new ArrayList<>();
            while (resultSet.next()) {
                rolUsuario = new RolUsuario();
                rolUsuario.setUserID(resultSet.getInt("UserID"));
                rolUsuario.setRolID(resultSet.getInt("RolID"));
                rolUsuarioList.add(rolUsuario);
            }
            resultSet.close();
            closeConnection(connection);
            return rolUsuarioList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean addRolUsuario(RolUsuario rolUsuario) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO UsuarioRol(UserID, RolID) VALUES(?, ?)";
        int row = 0;
        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if (preparedStatement == null) {
                return false;
            }
            preparedStatement.setInt(1, rolUsuario.getUserID());
            preparedStatement.setInt(2, rolUsuario.getRolID());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean updateRolUsuario(RolUsuario rolUsuario) {
        return false;
    }

    public boolean deleteRolUsuario(RolUsuario rolUsuario) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM UsuarioRol WHERE UserID = ? AND RolID = ?";
        int row = 0;
        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if (preparedStatement == null) {
                return false;
            }
            preparedStatement.setInt(1, rolUsuario.getUserID());
            preparedStatement.setInt(2, rolUsuario.getRolID());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public RolUsuario getRolUsuarioByUserID(int userID) {
        RolUsuario rolUsuario = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM UsuarioRol WHERE UserID = ?");
            if (preparedStatement == null) {
                return null;
            }
            preparedStatement.setInt(1, userID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }
            while (resultSet.next()) {
                rolUsuario = new RolUsuario();
                rolUsuario.setUserID(resultSet.getInt("UserID"));
                rolUsuario.setRolID(resultSet.getInt("RolID"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rolUsuario;
    }

    public int getUserIdFromSessionOrParameter(HttpServletRequest request, String parameterName) {
        HttpSession session = request.getSession(false);

        if (session != null) {
            Object userIdAttribute = session.getAttribute("userID");

            if (userIdAttribute != null) {
                if (userIdAttribute instanceof Integer) {
                    return (int) userIdAttribute;
                } else {
                    System.err.println("El atributo de sesión 'userID' no es un entero válido.");
                }
            }
        }

        String userIdParam = request.getParameter(parameterName);

        if (userIdParam != null && !userIdParam.isEmpty()) {
            try {
                return Integer.parseInt(userIdParam);
            } catch (NumberFormatException e) {
                // Manejo de error si el parámetro no es un entero válido
                e.printStackTrace();
            }
        }

        return -1;
    }
}
