package org.KidTales.dao.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.KidTales.dao.Chat;

public class ChatService extends Conexion<Chat> {

    public List<Chat> getChatListByUserID(int userID) {
        List<Chat> chatList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }

            preparedStatement = connection.prepareStatement("SELECT * FROM Chat WHERE PadreID = ? OR SoporteTecnicoID = ?");
            preparedStatement.setInt(1, userID);
            preparedStatement.setInt(2, userID);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Chat chat = new Chat();
                chat.setChatID(resultSet.getInt("ChatID"));
                chat.setPadreID(resultSet.getInt("PadreID"));
                chat.setSoporteTecnicoID(resultSet.getInt("SoporteTecnicoID"));
                chatList.add(chat);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return chatList;
    }

    public boolean addChat(Chat chat) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO Chat(PadreID, SoporteTecnicoID) VALUES(?, ?)";
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

            preparedStatement.setInt(1, chat.getPadreID());
            preparedStatement.setInt(2, chat.getSoporteTecnicoID());

            row = preparedStatement.executeUpdate();
            closeConnection(connection);

            return row == 1;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public Chat getChatByChatID(int chatID) {
        Chat chat = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }

            preparedStatement = connection.prepareStatement("SELECT * FROM Chat WHERE ChatID = ?");
            preparedStatement.setInt(1, chatID);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                chat = new Chat();
                chat.setChatID(resultSet.getInt("ChatID"));
                chat.setPadreID(resultSet.getInt("PadreID"));
                chat.setSoporteTecnicoID(resultSet.getInt("SoporteTecnicoID"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return chat;
    }
}