package net.schastny.contactmanager.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "SOFT_TYPE")
public class SoftwareType {

	@Id
    @Column(name = "SOFT_TYPE_ID")
	private Integer id_type;

    @Column(name = "SOFT_TYPE_NAME")
    private String descriptionOfType;

    @OneToMany 
    @JoinTable(name="RECOM")
    private List<Article> articleSource;

	public Integer getId_type() {
		return id_type;
	}

	public void setId_type(Integer id_type) {
		this.id_type = id_type;
	}

	public String getDescriptionOfType() {
		return descriptionOfType;
	}

	public void setDescriptionOfType(String descriptionOfType) {
		this.descriptionOfType = descriptionOfType;
	}

	public List<Article> getArticleSource() {
		return articleSource;
	}

	public void setArticleSource(List<Article> articleSource) {
		this.articleSource = articleSource;
	}

}