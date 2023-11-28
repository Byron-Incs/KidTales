package org.KidTales.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.KidTales.dao.Padre;

public class PadreService extends Conexion<Padre> {

    public PadreService() {
    }

    public List<Padre> getPadreList() {
        List<Padre> padreList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Padre padre = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }

            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }

            resultSet = statement.executeQuery("SELECT * FROM Padre");
            if (resultSet == null) {
                return null;
            }

            padreList = new ArrayList<>();
            while (resultSet.next()) {
                padre = new Padre();
                padre.setUserID(resultSet.getInt("UserID"));
                padre.setCodigoControlParental(resultSet.getInt("CodigoControlParental"));
                padreList.add(padre);
            }

            resultSet.close();
            closeConnection(connection);
            return padreList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean addPadre(Padre padre) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO Padre(UserID, CodigoControlParental) VALUES(?, ?)";
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

            preparedStatement.setInt(1, padre.getUserID());
            preparedStatement.setInt(2, padre.getCodigoControlParental());

            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean updatePadre(Padre padre) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE Padre SET CodigoControlParental=? WHERE UserID=?";
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

            preparedStatement.setInt(1, padre.getCodigoControlParental());
            preparedStatement.setInt(2, padre.getUserID());

            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deletePadre(Padre padre) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM Padre WHERE UserID=?";
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

            preparedStatement.setInt(1, padre.getUserID());

            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Padre getPadreByUserID(int userID) {
        Padre padre = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }

            preparedStatement = connection.prepareStatement("SELECT * FROM Padre WHERE UserID = ?");
            if (preparedStatement == null) {
                return null;
            }

            preparedStatement.setInt(1, userID);
            resultSet = preparedStatement.executeQuery();

            if (resultSet == null) {
                return null;
            }

            while (resultSet.next()) {
                padre = new Padre();
                padre.setUserID(resultSet.getInt("UserID"));
                padre.setCodigoControlParental(resultSet.getInt("CodigoControlParental"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return padre;
    }
}
