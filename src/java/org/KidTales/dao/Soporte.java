package org.KidTales.dao;
public class Soporte {
    private int id_sp;
    private String nombre;
    private String correo_sp;
    private String psw_sp;

    public int getId_sp() {
        return id_sp;
    }

    public void setId_sp(int id_sp) {
        this.id_sp = id_sp;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo_sp() {
        return correo_sp;
    }

    public void setCorreo_sp(String correo_sp) {
        this.correo_sp = correo_sp;
    }

    public String getPsw_sp() {
        return psw_sp;
    }

    public void setPsw_sp(String psw_sp) {
        this.psw_sp = psw_sp;
    }
}
