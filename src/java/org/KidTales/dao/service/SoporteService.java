package org.KidTales.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.KidTales.dao.Soporte;

public class SoporteService extends Conexion<Soporte> {

    public List<Soporte> getSoporteTecnicoList() {
        List<Soporte> soporteTecnicoList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Soporte soporteTecnico = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM SoporteTecnico");
            if (resultSet == null) {
                return null;
            }
            soporteTecnicoList = new ArrayList<>();
            while (resultSet.next()) {
                soporteTecnico = new Soporte();
                soporteTecnico.setUserID(resultSet.getInt("UserID"));
                // Puedes agregar más atributos según la estructura de tu tabla
                soporteTecnicoList.add(soporteTecnico);
            }
            resultSet.close();
            closeConnection(connection);
            return soporteTecnicoList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Soporte getSoporteTecnicoByUserID(int userID) {
        Soporte soporteTecnico = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            preparedStatement = connection.prepareStatement("SELECT * FROM SoporteTecnico WHERE UserID = ?");
            if (preparedStatement == null) {
                return null;
            }
            preparedStatement.setInt(1, userID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return null;
            }
            while (resultSet.next()) {
                soporteTecnico = new Soporte();
                soporteTecnico.setUserID(resultSet.getInt("UserID"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return soporteTecnico;
    }
}