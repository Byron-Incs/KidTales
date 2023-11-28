package org.KidTales.helper;

import java.io.Serializable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.KidTales.dao.Usuario;
import org.KidTales.dao.service.UsuarioService;

public class UsuarioHelper extends Helpers<Usuario> implements Serializable {

    private UsuarioService usuarioService;

    public UsuarioHelper() {
    }

    public boolean isValidaCamposOk() {
        return isNotNullAndNotEmpity(t.getNombre())
                && isNotNullAndNotEmpity(t.getCorreo())
                && isNotNullAndNotEmpity(t.getContrasena());
    }

    public boolean addT(HttpServletRequest request) {
        usuarioService = new UsuarioService();
        t = new Usuario();

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        t.setNombre(nombre);
        t.setCorreo(correo);
        t.setContrasena(contrasena);

        if (isValidaCamposOk()) {
            return usuarioService.addUsuario(t);
        }

        return false;
    }

    @Override
    public List<Usuario> getListT() {
        usuarioService = new UsuarioService();
        return usuarioService.getUsuarioList();
    }

    @Override
    public boolean updateT() {
        t = new Usuario();
        t.setNombre(getParameter("nombre"));
        t.setCorreo(getParameter("correo"));
        t.setContrasena(getParameter("contrasena"));

        if (isValidaCamposOk()) {
            return usuarioService.updateUsuario(t);
        }
        return false;
    }

    @Override
    public boolean deleteT() {
        usuarioService = new UsuarioService();
        t = new Usuario();
        t.setUserID(Integer.parseInt(getParameter("userID")));

        return usuarioService.deleteUsuario(t);
    }

    @Override
    public Usuario getTByKey() {
        String correo = getParameter("correo");

        if (correo == null || correo.isEmpty()) {
            return null;
        }

        usuarioService = new UsuarioService();
        return usuarioService.getUsuarioByEmail(correo);
    }

    @Override
    public boolean addT() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
