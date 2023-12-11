/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.KidTales.ws;

/**
 *
 * @author Evelyn
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.KidTales.dao.MesaggeModel;

public class MessageModelService extends Conexion<MesaggeModel> {
/*
    public List<MesaggeModel> getMensahModelsList() {
        List<MesaggeModel> mesaggeList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        MesaggeModel message = null;
        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM Mensaje");
            if (resultSet == null) {
                return null;
            }
            mesaggeList = new ArrayList<>();
            while (resultSet.next()) {
                message = new MesaggeModel();
                message.setMensajeID(resultSet.getInt("MensajeID"));
                message.setChatID(resultSet.getInt("ChatID"));
                message.setUserID(resultSet.getInt("UserID"));
                message.setConten(resultSet.getString("Contenido"));
                mesaggeList.add(message);
            }
            resultSet.close();
            closeConnection(connection);
            return mesaggeList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return mesaggeList;
    }

    public boolean agregaMensaje(int Padreid, int SoporteTecnicoID, String contenido) {
        int chatId = getIdChat(Padreid, SoporteTecnicoID);
        MesaggeModel messagemodel = new MesaggeModel();
        messagemodel.setChatID(chatId);
        messagemodel.setUserID(Padreid);
        messagemodel.setConten(contenido);
        boolean ok = addMensaje(messagemodel);
        return true;
    }

    
    public boolean addMensaje(MesaggeModel message) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO Mensaje (ChatID, UserID,Contenido) VALUES (?, ?, ?)";
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
            preparedStatement.setInt(1, message.getChatID());
            preparedStatement.setInt(2, message.getUserID());
            preparedStatement.setString(3, message.getConten());
            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return row < 0;
    }

    public int getIdChat(int PadreID, int SoporteTecnicoID) {
        int chatId = 0;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = getConnection();

            if (connection == null) {
                return 0;
            }
            preparedStatement = connection.prepareStatement("SELECT ChatID FROM Chat WHERE PadreID = ? and  SoporteTecnicoID = ?");
            if (preparedStatement == null) {
                return 0;
            }
            preparedStatement.setInt(1, PadreID);
            preparedStatement.setInt(2, SoporteTecnicoID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet == null) {
                return 0;
            } else {
                chatId = resultSet.getInt("ChatID");
            }
            resultSet.close();
            closeConnection(connection);

        } catch (SQLException ex) {
            ex.getMessage();
        }
        return chatId;
    }
*/
}
