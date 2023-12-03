/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.KidTales.ws;

import java.io.IOException;
import java.io.Serializable;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import org.KidTales.dao.MesaggeModel;

/**
 *
 * @author Evelyn
 */
@ServerEndpoint(value="/chat",decoders = MessageModelDecoder.class,encoders = MessageModelEncoder.class)

public class WeebChatHome implements Serializable
{
   private static Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
   @OnMessage
   public String onMessage(Session session,MesaggeModel message) {
        //Solo para depurar o sea no solo para depurar pero ayuda a depurar
        System.out.println("Manejo de Masajes: " + message);
        for(Session s: sessions){
            try {
                s.getBasicRemote().sendObject(message);
            } catch (IOException ex) {
                Logger.getLogger(WeebChatHome.class.getName()).log(Level.SEVERE, null, ex);
            } catch (EncodeException ex) {
                Logger.getLogger(WeebChatHome.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
   
      //Abrir Conexion
    @OnOpen
    public void onOpen (Session session)
    {
        //Solo para depurar o sea no solo para depurar pero ayuda a depurar
        System.out.println("On open: "  + session.getId());
        sessions.add(session);
    }  
     //Cerrar Conexion
    @OnClose
   public void onClose(Session session){
    //Solo para depurar o sea no solo para depurar pero ayuda a depurar
    System.out.println("On close: "  + session.getId());
    sessions.remove(session);
}
}
