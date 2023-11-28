package org.KidTales.helper;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.KidTales.dao.Chat;
import org.KidTales.dao.service.ChatService;

public class ChatHelper extends Helpers<Chat> implements Serializable{
    private ChatService chatService;

    public ChatHelper() {
    }

    @Override
    public boolean addT() {
        chatService = new ChatService();
        t = new Chat();
        int padreID = getUserIdFromSessionOrParameter(request, "padreID");
        int soporteTecnicoID = getUserIdFromSessionOrParameter(request, "soporteTecnicoID");
        t.setPadreID(padreID);
        t.setSoporteTecnicoID(soporteTecnicoID);
        return chatService.addChat(t);
    }

    @Override
    public List<Chat> getListT() {
        chatService = new ChatService();
        int userID = getUserIdFromSessionOrParameter(request, "userID");
        return chatService.getChatListByUserID(userID);
    }

    @Override
    public boolean updateT() {
        return false;
    }

    @Override
    public boolean deleteT() {
        return false;
    }

    @Override
    public Chat getTByKey() {
        int chatID = getParameterAsInt("chatID");
        chatService = new ChatService();
        return chatService.getChatByChatID(chatID);
    }
    
    public int getUserIDFromSessionOrParameter(HttpServletRequest request, String parameterName) {
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
                e.printStackTrace();
            }
        }

        return -1;
    }
}
