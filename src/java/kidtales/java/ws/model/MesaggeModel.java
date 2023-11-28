/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kidtales.java.ws.model;

/**
 *
 * @author Evelyn
 */
public class MesaggeModel {
    private String conten;
     private String userName;

    public String getConten() {
        return conten;
    }

    public void setConten(String conten) {
        this.conten = conten;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    @Override
    public String toString()
    {
        return  "MessageModel{" + "content=" +conten + ", userName=" + userName +'}';
    }
}
