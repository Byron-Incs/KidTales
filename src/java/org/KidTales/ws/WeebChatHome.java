/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.KidTales.ws;



import java.io.IOException;
import java.io.Serializable;
import java.io.StringReader;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.json.Json;
import javax.json.JsonObject;
import org.KidTales.dao.MesaggeModel;

/**
 *
 * @author Evelyn
 */
@ServerEndpoint(value = "/chat", decoders = MessageModelDecoder.class, encoders = MessageModelEncoder.class)

public class WeebChatHome implements Serializable {

    private static Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());
    private static Map<Character, String> mapaDeSustitucionCifrado = new HashMap<>();
    private static Map<String, Character> mapaDeSustitucionDescifrado = new HashMap<>();

    public WeebChatHome() {
        crearMapas();
    }

    @OnMessage
    public void onMessage(Session session, MesaggeModel message) {
         

        System.out.println("Manejo de Masajes: " + message);
        String decryptedMessage = decryptMessage(message.getConten());
        message.setConten(decryptedMessage);
        for (Session s : sessions) {
            try {
                s.getBasicRemote().sendObject(message);
            } catch (IOException ex) {
                Logger.getLogger(WeebChatHome.class.getName()).log(Level.SEVERE, null, ex);
            } catch (EncodeException ex) {
                Logger.getLogger(WeebChatHome.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    
    }

    //Abrir Conexion
    @OnOpen
    public void onOpen(Session session) {
        //Solo para depurar o sea no solo para depurar pero ayuda a depurar
        System.out.println("On open: " + session.getId());
        sessions.add(session);
    }
    //Cerrar Conexion

    @OnClose
    public void onClose(Session session) {
        //Solo para depurar o sea no solo para depurar pero ayuda a depurar
        System.out.println("On close: " + session.getId());
        sessions.remove(session);
    }

    
    
    private String decryptMessage(String encryptedMessage) {
        StringBuilder decryptedMessage = new StringBuilder();

        for (int i = 0; i < encryptedMessage.length(); i += 2) {
            String substring = encryptedMessage.substring(i, Math.min(i + 2, encryptedMessage.length()));
            char decryptedChar = decryptSubstring(substring);
            decryptedMessage.append(decryptedChar);
        }

        return decryptedMessage.toString();
    }

    private char decryptSubstring(String substring) {

        return mapaDeSustitucionDescifrado.getOrDefault(substring, '?');
    }

    private static void crearMapas() {
        mapaDeSustitucionCifrado.put('a', "O2");
        mapaDeSustitucionCifrado.put('A', "2T");
        mapaDeSustitucionCifrado.put('b', "G1");
        mapaDeSustitucionCifrado.put('B', "2G");
        mapaDeSustitucionCifrado.put('c', "J1");
        mapaDeSustitucionCifrado.put('d', "I1");
        mapaDeSustitucionCifrado.put('e', "C1");
        mapaDeSustitucionCifrado.put('f', "A1");
        mapaDeSustitucionCifrado.put('g', "S1");
        mapaDeSustitucionCifrado.put('h', "Z1");
        mapaDeSustitucionCifrado.put('i', "N1");
        mapaDeSustitucionCifrado.put('j', "F1");
        mapaDeSustitucionCifrado.put('k', "T1");
        mapaDeSustitucionCifrado.put('l', "E0");
        mapaDeSustitucionCifrado.put('m', "W0");
        mapaDeSustitucionCifrado.put('n', "M0");
        mapaDeSustitucionCifrado.put('ñ', "V0");
        mapaDeSustitucionCifrado.put('o', "X0");
        mapaDeSustitucionCifrado.put('p', "H0");
        mapaDeSustitucionCifrado.put('q', "D0");
        mapaDeSustitucionCifrado.put('r', "P0");
        mapaDeSustitucionCifrado.put('s', "L0");
        mapaDeSustitucionCifrado.put('t', "K2");
        mapaDeSustitucionCifrado.put('u', "R2");
        mapaDeSustitucionCifrado.put('v', "Y2");
        mapaDeSustitucionCifrado.put('w', "U2");
        mapaDeSustitucionCifrado.put('x', "Q2");
        mapaDeSustitucionCifrado.put('y', "B2");
        mapaDeSustitucionCifrado.put('z', "J2");
        mapaDeSustitucionCifrado.put('C', "2S");
        mapaDeSustitucionCifrado.put('D', "2Y");
        mapaDeSustitucionCifrado.put('E', "2B");
        mapaDeSustitucionCifrado.put('F', "2R");
        mapaDeSustitucionCifrado.put('G', "2I");
        mapaDeSustitucionCifrado.put('H', "2Q");
        mapaDeSustitucionCifrado.put('I', "1q");
        mapaDeSustitucionCifrado.put('J', "1X");
        mapaDeSustitucionCifrado.put('K', "1Z");
        mapaDeSustitucionCifrado.put('L', "1G");
        mapaDeSustitucionCifrado.put('M', "1O");
        mapaDeSustitucionCifrado.put('N', "1Y");
        mapaDeSustitucionCifrado.put('Ñ', "1S");
        mapaDeSustitucionCifrado.put('O', "1J");
        mapaDeSustitucionCifrado.put('P', "1I");
        mapaDeSustitucionCifrado.put('Q', "1Q");
        mapaDeSustitucionCifrado.put('R', "0q");
        mapaDeSustitucionCifrado.put('S', "0W");
        mapaDeSustitucionCifrado.put('T', "0P");
        mapaDeSustitucionCifrado.put('U', "0G");
        mapaDeSustitucionCifrado.put('V', "0S");
        mapaDeSustitucionCifrado.put('W', "0E");
        mapaDeSustitucionCifrado.put('X', "0B");
        mapaDeSustitucionCifrado.put('Y', "0C");
        mapaDeSustitucionCifrado.put('Z', "0I");
        mapaDeSustitucionCifrado.put('1', "Sz");
        mapaDeSustitucionCifrado.put('2', "Ay");
        mapaDeSustitucionCifrado.put('3', "Fx");
        mapaDeSustitucionCifrado.put('4', "Ew");
        mapaDeSustitucionCifrado.put('5', "iF");
        mapaDeSustitucionCifrado.put('6', "Te");
        mapaDeSustitucionCifrado.put('7', "Od");
        mapaDeSustitucionCifrado.put('8', "Lc");
        mapaDeSustitucionCifrado.put('9', "Ub");
        mapaDeSustitucionCifrado.put('0', "Da");
        mapaDeSustitucionCifrado.put(' ', "00");
        mapaDeSustitucionCifrado.put(':', "01");
        mapaDeSustitucionCifrado.put('!', "02");
        mapaDeSustitucionCifrado.put('$', "03");
        mapaDeSustitucionCifrado.put('#', "04");
        mapaDeSustitucionCifrado.put('*', "05");
        mapaDeSustitucionCifrado.put('%', "06");
        mapaDeSustitucionCifrado.put('&', "07");
        mapaDeSustitucionCifrado.put('/', "08");
        mapaDeSustitucionCifrado.put('(', "09");
        mapaDeSustitucionCifrado.put(')', "10");
        mapaDeSustitucionCifrado.put('=', "11");
        mapaDeSustitucionCifrado.put('¿', "12");
        mapaDeSustitucionCifrado.put('¡', "13");
        mapaDeSustitucionCifrado.put('?', "14");
        mapaDeSustitucionCifrado.put(';', "15");
        mapaDeSustitucionCifrado.put('<', "16");
        mapaDeSustitucionCifrado.put('>', "17");
        mapaDeSustitucionCifrado.put('-', "18");
        mapaDeSustitucionCifrado.put('_', "19");
        mapaDeSustitucionCifrado.put('+', "20");
        mapaDeSustitucionCifrado.put('~', "21");
        mapaDeSustitucionCifrado.put('^', "22");
        mapaDeSustitucionCifrado.put('á', "aA");
        mapaDeSustitucionCifrado.put('é', "eE");
        mapaDeSustitucionCifrado.put('í', "iI");
        mapaDeSustitucionCifrado.put('ó', "oO");
        mapaDeSustitucionCifrado.put('ú', "uU");
        mapaDeSustitucionCifrado.put('Á', "Aa");
        mapaDeSustitucionCifrado.put('É', "Ee");
        mapaDeSustitucionCifrado.put('Í', "Ii");
        mapaDeSustitucionCifrado.put('Ó', "Oo");
        mapaDeSustitucionCifrado.put('Ú', "Uu");
        mapaDeSustitucionCifrado.put('ä', "aa");
        mapaDeSustitucionCifrado.put('ë', "ee");
        mapaDeSustitucionCifrado.put('ï', "ii");
        mapaDeSustitucionCifrado.put('ö', "oo");
        mapaDeSustitucionCifrado.put('ü', "uu");
        mapaDeSustitucionCifrado.put('Ä', "AA");
        mapaDeSustitucionCifrado.put('Ë', "EE");
        mapaDeSustitucionCifrado.put('Ï', "II");
        mapaDeSustitucionCifrado.put('Ö', "OO");
        mapaDeSustitucionCifrado.put('Ü', "UU");
        mapaDeSustitucionCifrado.put('\'', "24");
        mapaDeSustitucionCifrado.put('{', "25");
        mapaDeSustitucionCifrado.put('}', "26");
        mapaDeSustitucionCifrado.put('[', "27");
        mapaDeSustitucionCifrado.put(']', "28");
        mapaDeSustitucionCifrado.put('\"', "29");
        mapaDeSustitucionCifrado.put('\\', "30");
        mapaDeSustitucionCifrado.put('.', "31");
        mapaDeSustitucionCifrado.put(',', "32");

        for (Map.Entry<Character, String> entry : mapaDeSustitucionCifrado.entrySet()) {
            mapaDeSustitucionDescifrado.put(entry.getValue(), entry.getKey());
        }
    }

}
