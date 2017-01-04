package com.index;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;


/**
 * Created by jaco1a on 22/12/16.
 */
@Entity
public class Structure implements Serializable{

    @Id
    @Column
    private String smile;

    @Column
    private String mol;

    public String getSmile() {
        return smile;
    }

    public void setSmile(String smile) {
        this.smile = smile;
    }

    public String getMol() {
        return mol;
    }

    public void setMol(String mol) {
        this.mol = mol;
    }

}
