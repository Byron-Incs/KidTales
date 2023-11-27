
package kidtales.java.ws;

import java.io.IOException;
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
import kidtales.java.ws.model.MesaggeModel;

/**
 *
 * @author Evelyn
 */
@ServerEndpoint("/chat")
public class WebChatMain {

     private static Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());
     
    @OnMessage
    public String onMessage(Session session,MesaggeModel message) {
         System.out.println("Manejo de Masajes: " + message);
        for(Session s: sessions){
            try {
                s.getBasicRemote().sendObject(message);
            } catch (IOException ex) {
                Logger.getLogger(WebChatMain.class.getName()).log(Level.SEVERE, null, ex);
            } catch (EncodeException ex) {
                Logger.getLogger(WebChatMain.class.getName()).log(Level.SEVERE, null, ex);
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
