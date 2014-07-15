package net.schastny.contactmanager.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "dev_stage")
public class DevelopmentStage {

	@Id
    @Column(name = "dev_stage_id")
	private Integer id_stage;

    @Column(name = "dev_stage_name")
    private String descriptionOfStage;

    @OneToMany 
    @JoinTable(name="RECOM")
    private List<Article> articleSource;

	public Integer getId_stage() {
		return id_stage;
	}

	public void setId_stage(Integer id_stage) {
		this.id_stage = id_stage;
	}

	public List<Article> getArticleSource() {
		return articleSource;
	}

	public void setArticleSource(List<Article> articleSource) {
		this.articleSource = articleSource;
	}

	public String getDescriptionOfStage() {
		return descriptionOfStage;
	}

	public void setDescriptionOfStage(String descriptionOfStage) {
		this.descriptionOfStage = descriptionOfStage;
	}
    
}
