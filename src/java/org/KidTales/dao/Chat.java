package org.KidTales.dao;
import java.io.Serializable;

public class Chat implements Serializable {
    private int chatID;
    private int padreID;
    private int soporteTecnicoID;

    public int getChatID() {
        return chatID;
    }

    public void setChatID(int chatID) {
        this.chatID = chatID;
    }

    public int getPadreID() {
        return padreID;
    }

    public void setPadreID(int padreID) {
        this.padreID = padreID;
    }

    public int getSoporteTecnicoID() {
        return soporteTecnicoID;
    }

    public void setSoporteTecnicoID(int soporteTecnicoID) {
        this.soporteTecnicoID = soporteTecnicoID;
    }
}