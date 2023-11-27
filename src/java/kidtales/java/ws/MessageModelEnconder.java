/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kidtales.java.ws;

import com.google.gson.Gson;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;
import kidtales.java.ws.model.MesaggeModel;

/**
 *
 * @author Evelyn
 */
public class MessageModelEnconder implements Encoder.Text<MesaggeModel>{
    Gson gson = new Gson();
        
    @Override
    public String encode(MesaggeModel message) throws EncodeException {
      return gson.toJson(message);
    }

    @Override
    public void init(EndpointConfig config) {
       
    }

    @Override
    public void destroy() {
    
    }
}