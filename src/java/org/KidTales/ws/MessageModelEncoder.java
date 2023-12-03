/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.KidTales.ws;

import com.google.gson.Gson;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;
import org.KidTales.dao.MesaggeModel;

/**
 *
 * @author Evelyn
 */
public class MessageModelEncoder  implements Encoder.Text<MesaggeModel>
        
{
    Gson gson = new Gson();
    @Override
    public String encode(MesaggeModel message) throws EncodeException {
      
        if( message == null )
        {
            return "";
        }
        return gson.toJson(message);
    }

    @Override
    public void init(EndpointConfig config) {
      
    }

    @Override
    public void destroy() {
       
    }
    
}
