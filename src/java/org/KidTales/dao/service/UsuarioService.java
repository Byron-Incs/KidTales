package org.KidTales.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.KidTales.dao.Usuario;

/**
 *
 * @author gerdoc
 */
public class UsuarioService extends Conexion<Usuario> {

    public UsuarioService() {
    }

    public List<Usuario> getUsuarioList() {
        List<Usuario> usuarioList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Usuario usuario = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM Usuario");
            if (resultSet == null) {
                return null;
            }
            usuarioList = new ArrayList<>();
            while (resultSet.next()) {
                usuario = new Usuario();
                usuario.setUserID(resultSet.getInt("UserID"));
                usuario.setNombre(resultSet.getString("Nombre"));
                usuario.setCorreo(resultSet.getString("Correo"));
                usuario.setContrasena(resultSet.getString("Contrasena"));
                usuarioList.add(usuario);
            }
            resultSet.close();
            closeConnection(connection);
            return usuarioList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean addUsuario(Usuario usuario) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO Usuario (Nombre, Correo, Contrasena) VALUES (?, ?, ?)";
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
            preparedStatement.setString(1, usuario.getNombre());
            preparedStatement.setString(2, usuario.getCorreo());
            preparedStatement.setString(3, usuario.getContrasena());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean updateUsuario(Usuario usuario) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE Usuario SET Nombre=?, Correo=?, Contrasena=? WHERE UserID=?";
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
            preparedStatement.setString(1, usuario.getNombre());
            preparedStatement.setString(2, usuario.getCorreo());
            preparedStatement.setString(3, usuario.getContrasena());
            preparedStatement.setInt(4, usuario.getUserID());

            row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            closeConnection(connection);
        }
        return false;
    }

    public boolean deleteUsuario(Usuario usuario) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM Usuario WHERE UserID=?";
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
            preparedStatement.setInt(1, usuario.getUserID());

            row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            closeConnection(connection);
        }
        return false;
    }

    public Usuario getUsuarioByEmail(String correo) {
        Usuario usuario = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM Usuario WHERE Correo = ?");
            if (preparedStatement == null) {
                return null;
            }
            preparedStatement.setString(1, correo);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }
            while (resultSet.next()) {
                usuario = new Usuario();
                usuario.setUserID(resultSet.getInt("UserID"));
                usuario.setNombre(resultSet.getString("Nombre"));
                usuario.setCorreo(resultSet.getString("Correo"));
                usuario.setContrasena(resultSet.getString("Contrasena"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            closeConnection(connection);
        }
        return usuario;
    }

}
