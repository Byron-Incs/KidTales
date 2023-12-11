/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.KidTales.dao;
/**
 *
 * @author Jorge
 */
public class MesaggeModel {
     private String conten;
     private String userName;
     private int MensajeID;
     private int UserID;
     private int ChatID;
     private String destinatarioId;

    public String getConten() {
        return conten;
    }

    public void setConten(String conten) {
        this.conten = conten;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getMensajeID() {
        return MensajeID;
    }

    public void setMensajeID(int MensajeID) {
        this.MensajeID = MensajeID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getChatID() {
        return ChatID;
    }

    public void setChatID(int ChatID) {
        this.ChatID = ChatID;
    }
    
      public String getRecipientId() {
        // Lógica para obtener el ID del destinatario
        return destinatarioId;
    }

    // Setter para la propiedad destinatarioId
    public void setDestinatarioId(String destinatarioId) {
        this.destinatarioId = destinatarioId;
    }

   
}
