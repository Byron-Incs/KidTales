/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.KidTales.ws;

import com.google.gson.Gson;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;
import org.KidTales.dao.MesaggeModel;

/**
 *
 * @author Evelyn
 */
public class MessageModelDecoder implements Decoder.Text<MesaggeModel>
{ 
    Gson gson = new Gson();
    @Override
    public MesaggeModel decode(String s) throws DecodeException {
         return gson.fromJson(s, MesaggeModel.class);
    }

    @Override
    public boolean willDecode(String s) {
         return s != null && s.length( ) > 0;
    }

    @Override
    public void init(EndpointConfig config) {
     
    }

    @Override
    public void destroy() {
        
    }
}
