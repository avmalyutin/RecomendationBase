package net.schastny.contactmanager.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;



@Entity
@Table(name = "author")
public class Author {

	
	 @Id
	 @Column(name = "auth_id")
	 @GeneratedValue(strategy = GenerationType.AUTO, generator = "authSequence")
	 @SequenceGenerator(name = "authSequence", sequenceName = "auth_seq")
	 private Integer AuthorId;

	 @Column(name = "auth_login")
	 private String authorLogin;

	 @Column(name = "auth_pass")
	 private String authorPassword;

	 @Column(name = "auth_name")
	 private String authorName;

	 @Column(name = "auth_status")
	 private String authorStatus;

	 @Column(name = "auth_e_mail")
	 private String authorMail;

	 @Column(name = "auth_sex")
	 private String authorSex;
	 
	 @Column(name = "auth_enabled")
	 private int authorEnabled;

	public Integer getAuthorId() {
		return AuthorId;
	}

	public void setAuthorId(Integer authorId) {
		AuthorId = authorId;
	}

	public String getAuthorLogin() {
		return authorLogin;
	}

	public void setAuthorLogin(String authorLogin) {
		this.authorLogin = authorLogin;
	}

	public String getAuthorPassword() {
		return authorPassword;
	}

	public void setAuthorPassword(String authorPassword) {
		this.authorPassword = authorPassword;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getAuthorStatus() {
		return authorStatus;
	}

	public void setAuthorStatus(String authorStatus) {
		this.authorStatus = authorStatus;
	}

	public String getAuthorMail() {
		return authorMail;
	}

	public void setAuthorMail(String authorMail) {
		this.authorMail = authorMail;
	}

	public String getAuthorSex() {
		return authorSex;
	}

	public void setAuthorSex(String authorSex) {
		this.authorSex = authorSex;
	}

	public int getAuthorEnabled() {
		return authorEnabled;
	}

	public void setAuthorEnabled(int authorEnabled) {
		this.authorEnabled = authorEnabled;
	}


	
}
