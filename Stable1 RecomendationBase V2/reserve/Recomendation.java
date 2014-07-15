package net.schastny.contactmanager.domain;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "recom")
public class Recomendation {

    @Id
    @Column(name = "recom_id")
   // @GeneratedValue(strategy = GenerationType.AUTO, generator = "articleSequence")
   // @SequenceGenerator(name = "articleSequence", sequenceName = "ARTICLE_SEQ")
    private Integer recom_id;

    
    
    
    
    //обычные текстовый поля, не FK и PK
    
    @Column(name = "recom_text")
    private String recom_text;

    @Column(name = "recom_create_time")
    private Date recom_create_time;

    @Column(name = "recom_native_author")
    private Integer recom_native_author;

    @Column(name = "recom_likes_num")
    private Integer recom_likes_num;

    @Column(name = "recom_dislikes_num")
    private Integer recom_dislikes_num;
    
    @Column(name = "recom_init_condit")
    private String recom_init_condit;
    
    @Column(name = "recom_conseq")
    private String recom_conseq;
    
    @Column(name = "recom_side_eff")
    private Integer recom_side_eff;
    
    @Column(name = "recom_req_res")
    private Integer recom_req_res;
    
    @Column(name = "recom_use_cond")
    private Integer recom_use_cond;


	public Integer getRecom_id() {
		return recom_id;
	}

	public void setRecom_id(Integer recom_id) {
		this.recom_id = recom_id;
	}

	public String getRecom_text() {
		return recom_text;
	}

	public void setRecom_text(String recom_text) {
		this.recom_text = recom_text;
	}

	public Date getRecom_create_time() {
		return recom_create_time;
	}

	public void setRecom_create_time(Date recom_create_time) {
		this.recom_create_time = recom_create_time;
	}

	public Integer getRecom_native_author() {
		return recom_native_author;
	}

	public void setRecom_native_author(Integer recom_native_author) {
		this.recom_native_author = recom_native_author;
	}

	public Integer getRecom_likes_num() {
		return recom_likes_num;
	}

	public void setRecom_likes_num(Integer recom_likes_num) {
		this.recom_likes_num = recom_likes_num;
	}

	public Integer getRecom_dislikes_num() {
		return recom_dislikes_num;
	}

	public void setRecom_dislikes_num(Integer recom_dislikes_num) {
		this.recom_dislikes_num = recom_dislikes_num;
	}

	public String getRecom_init_condit() {
		return recom_init_condit;
	}

	public void setRecom_init_condit(String recom_init_condit) {
		this.recom_init_condit = recom_init_condit;
	}

	public String getRecom_conseq() {
		return recom_conseq;
	}

	public void setRecom_conseq(String recom_conseq) {
		this.recom_conseq = recom_conseq;
	}

	public Integer getRecom_side_eff() {
		return recom_side_eff;
	}

	public void setRecom_side_eff(Integer recom_side_eff) {
		this.recom_side_eff = recom_side_eff;
	}

	public Integer getRecom_req_res() {
		return recom_req_res;
	}

	public void setRecom_req_res(Integer recom_req_res) {
		this.recom_req_res = recom_req_res;
	}

	public Integer getRecom_use_cond() {
		return recom_use_cond;
	}

	public void setRecom_use_cond(Integer recom_use_cond) {
		this.recom_use_cond = recom_use_cond;
	}
    
}