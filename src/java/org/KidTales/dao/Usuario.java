package org.KidTales.dao;
public class Usuario {
    private int id_up;
    private String username;
    private String pasword;
    private String correo;

    public int getId_up() {
        return id_up;
    }

    public void setId_up(int id_up) {
        this.id_up = id_up;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasword() {
        return pasword;
    }

    public void setPasword(String pasword) {
        this.pasword = pasword;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}