package org.KidTales.helper;

import java.io.Serializable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.KidTales.dao.RolUsuario;
import org.KidTales.dao.Usuario;
import org.KidTales.dao.Rol;
import org.KidTales.dao.service.RolUsuarioService;

public class RolUsuarioHelper extends Helpers<RolUsuario> implements Serializable {

    private RolUsuarioService rolService;

    public RolUsuarioHelper() {
    }

    public boolean isValidaCamposOk() {
        return true;
    }

    @Override
    public boolean addT() {
        rolService = new RolUsuarioService();
        t = new RolUsuario();

        int userID = getUserIdFromSessionOrParameter(request, "userID");
        t.setUserID(userID);
        t.setRolID(2);

        return rolService.addRolUsuario(t);
    }

    @Override
    public List<RolUsuario> getListT() {
        rolService = new RolUsuarioService();
        return rolService.getRolUsuarioList();
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
    public RolUsuario getTByKey() {
        int userID = Integer.parseInt(getParameter("userID"));

        if (userID > 0) {
            rolService = new RolUsuarioService();
            return rolService.getRolUsuarioByUserID(userID);
        }

        return null;
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