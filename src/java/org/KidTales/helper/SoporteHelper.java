package org.KidTales.helper;
import java.io.Serializable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.KidTales.dao.Soporte;
import org.KidTales.dao.service.SoporteService;

public class SoporteHelper extends Helpers<Soporte> implements Serializable {

    private SoporteService soporteService;

    public SoporteHelper() {
    }

    @Override
    public List<Soporte> getListT() {
        soporteService = new SoporteService();
        return soporteService.getSoporteTecnicoList();
    }

    @Override
    public boolean addT() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean updateT() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean deleteT() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Soporte getTByKey() {
        int userID = getUserIdFromSessionOrParameter(request, "userID");
        soporteService = new SoporteService();
        return soporteService.getSoporteTecnicoByUserID(userID);
    }
    
    public int getUserIdFromSessionOrParameter(HttpServletRequest request, String parameterName) {
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
                // Manejo de error si el parámetro no es un entero válido
                e.printStackTrace();
            }
        }

        return -1;
    }
}