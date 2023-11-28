package org.KidTales.dao;

public class Rol {

    private int rolID;
    private String nombre;

    public Rol() {
    }

    public Rol(int rolID, String nombre) {
        this.rolID = rolID;
        this.nombre = nombre;
    }

    public int getRolID() {
        return rolID;
    }

    public void setRolID(int rolID) {
        this.rolID = rolID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
