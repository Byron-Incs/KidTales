package org.KidTales.helper;

import java.io.Serializable;
import java.util.List;
import org.KidTales.dao.Rol;
import org.KidTales.dao.service.RolService;

public class RolHelper extends Helpers<Rol> implements Serializable {

    private RolService rolService;

    public RolHelper() {
    }

    public boolean isValidaCamposOk() {
        return true;
    }

    @Override
    public boolean addT() {
        return false;
    }

    @Override
    public List<Rol> getListT() {
        rolService = new RolService();
        return rolService.getRolList();
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
    public Rol getTByKey() {
        int rolID = Integer.parseInt(getParameter("rolID"));
        if (rolID > 0) {
            rolService = new RolService();
            return rolService.getRolById(rolID);
        }
        return null;
    }
}