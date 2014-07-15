package net.schastny.contactmanager.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CATEGORY")
public class Category {

	@Id
    @Column(name = "CATEG_ID")
	private Integer id_category;

    @Column(name = "CATHEG_NAME")
    private String descriptionOfCategory;

    @OneToMany 
    @JoinTable(name="RECOM")
    private List<Article> articleSource;
        
	public Integer getId_category() {
		return id_category;
	}

	public void setId_category(Integer id_category) {
		this.id_category = id_category;
	}

	public String getDescriptionOfCategory() {
		return descriptionOfCategory;
	}

	public void setDescriptionOfCategory(String descriptionOfCategory) {
		this.descriptionOfCategory = descriptionOfCategory;
	}

	public List<Article> getArticleSource() {
		return articleSource;
	}

	public void setArticleSource(List<Article> articleSource) {
		this.articleSource = articleSource;
	}

	
	
}
