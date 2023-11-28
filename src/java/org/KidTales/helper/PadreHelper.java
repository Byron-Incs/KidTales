package org.KidTales.helper;

import java.io.Serializable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.KidTales.dao.Padre;
import org.KidTales.dao.service.PadreService;

public class PadreHelper extends Helpers<Padre> implements Serializable {

    private PadreService padreService;

    public PadreHelper() {
        padreService = new PadreService();
    }

    public boolean isValidaCamposOk() {
        return true;
    }

    @Override
    public boolean addT() {
        t = new Padre();
        t.setUserID(getUserIDFromSessionOrParameter(request, "userID"));
        t.setCodigoControlParental(0);

        if (isValidaCamposOk()) {
            return padreService.addPadre(t);
        }
        return false;
    }

    @Override
    public List<Padre> getListT() {
        return null;
    }

    @Override
    public boolean updateT() {
        t = new Padre();
        t.setUserID(getUserIDFromSessionOrParameter(request, "userID"));
        t.setCodigoControlParental(Integer.parseInt(getParameter("codigoControlParental")));

        if (t.getUserID() != -1 && isValidaCamposOk()) {
            return padreService.updatePadre(t);
        }
        return false;
    }

    @Override
    public boolean deleteT() {
        t = new Padre();
        t.setUserID(getUserIDFromSessionOrParameter(request, "userID"));

        if (t.getUserID() != -1) {
            return padreService.deletePadre(t);
        }
        return false;
    }

    @Override
    public Padre getTByKey() {
        int userID = getUserIDFromSessionOrParameter(request, "userID");
        if (userID != -1) {
            return padreService.getPadreByUserID(userID);
        }
        return null;
    }

    public int getUserIDFromSessionOrParameter(HttpServletRequest request, String parameterName) {
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
                e.printStackTrace();
            }
        }

        return -1;
    }
}
