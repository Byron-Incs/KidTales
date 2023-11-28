package org.KidTales.dao.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.KidTales.dao.Rol;
public class RolService extends Conexion<Rol> {

    public RolService() {
    }

    public List<Rol> getRolList() {
        List<Rol> rolList = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Rol rol = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM Rol");
            if (preparedStatement == null) {
                return null;
            }
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }
            rolList = new ArrayList<>();
            while (resultSet.next()) {
                rol = new Rol();
                rol.setRolID(resultSet.getInt("RolID"));
                rol.setNombre(resultSet.getString("Nombre"));
                rolList.add(rol);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rolList;
    }

    public Rol getRolById(int rolID) {
        Rol rol = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM Rol WHERE RolID = ?");
            if (preparedStatement == null) {
                return null;
            }
            preparedStatement.setInt(1, rolID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }
            while (resultSet.next()) {
                rol = new Rol();
                rol.setRolID(resultSet.getInt("RolID"));
                rol.setNombre(resultSet.getString("Nombre"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rol;
    }
}