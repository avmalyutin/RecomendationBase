package net.schastny.contactmanager.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "CONTACTS")
public class Contact {

    @Id
    @Column(name = "ID_1")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "contactSequence")
    @SequenceGenerator(name = "contactSequence", sequenceName = "CONTACTS_SEQ")
    private Integer id;

    @Column(name = "FIRSTNAME")
    private String firstname;

    @Column(name = "LASTNAME")
    private String lastname;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "TELEPHONE")
    private String telephone;

    // Getters and setters
    
    public void setId(Integer value){
    	this.id = value;
    }
    
    public Integer getId(){
    	return this.id;
    }
    
    public void setFirstname(String value){
    	this.firstname = value;
    }
    
    public String getFirstname(){
    	return this.firstname;
    }
    
    public void setLastname(String value){
    	this.lastname = value;
    }
    
    public String getLastname(){
    	return this.lastname;
    }
    
    public void setEmail(String value){
    	this.email = value;
    }
    
    public String getEmail(){
    	return this.email;
    }
    
    public void setTelephone(String value){
    	this.telephone = value;
    }
    
    public String getTelephone(){
    	return this.telephone;
    }
    
    
    
    
    
    
    
}