package net.schastny.contactmanager.domain;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "recom")
public class Article {

    @Id
    @Column(name = "recom_id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "recomSequence")
    @SequenceGenerator(name = "recomSequence", sequenceName = "recom_seq")
    private Integer id;

    @Column(name = "RECOM_TITLE")
    private String titleOfArticle;

    @Column(name = "RECOM_TEXT")
    private String contentOfArticle;

    @Column(name = "RECOM_NATIVE_AUTH")
    private String authorOfArticle;

    @Column(name = "RECOM_CONSEQ")
    private String tagsOfArticle;

    @Column(name = "RECOM_SIDE_EFF")
    private String categoryOfArticle;

    @Column(name = "RECOM_INIT_CONDIT")
    private String softwareTypeOfArticle;

    @Column(name = "RECOM_USE_COND")
    private String developTageOfArticle;

    @Column(name = "RECOM_CREATE_TIME")
    private Date createdtimeOfArticle;
      
    
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn (name="CATEG_ID")
    private Category categoryOfArticleNEW;
    

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn (name="SOFT_TYPE_ID")
    private SoftwareType typeOfArticleNEW;
    

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn (name="DEV_STAGE_ID")
    private DevelopmentStage stageOfArticleNEW;
    
    
    
    
    
  //support functions
	
  	public String getFormattedDate(){
  		SimpleDateFormat dateformatyyyyMMdd = new SimpleDateFormat("EEE, dd MMM yyyy 'в' HH:mm ");
  		if(dateformatyyyyMMdd != null && this.createdtimeOfArticle != null){
  			String buffer = dateformatyyyyMMdd.format(this.createdtimeOfArticle);
  			return buffer;
  		}
  		return "error";
  	}
  	
  	// end of support functions
    
    
    
    // Getters and setters
    
	public void setId(Integer value){
    	this.id = value;
    }
    
    public Integer getId(){
    	return this.id;
    }
    
    public void setTitleOfArticle(String value){
    	this.titleOfArticle = value;
    }
    
    public String getTitleOfArticle(){
    	return this.titleOfArticle;
    }
    
    public void setContentOfArticle(String value){
    	this.contentOfArticle = value;
    }
    
    public String getContentOfArticle(){
    	return this.contentOfArticle;
    }
    
    public void setAuthorOfArticle(String value){
    	this.authorOfArticle = value;
    }
    
    public String getAuthorOfArticle(){
    	return this.authorOfArticle;
    }
    
    public void setTagsOfArticle(String value){
    	this.tagsOfArticle = value;
    }
    
    public String getTagsOfArticle(){
    	return this.tagsOfArticle;
    }
    
    public String getCategoryOfArticle() {
		return categoryOfArticle;
	}

	public void setCategoryOfArticle(String categoryOfArticle) {
		this.categoryOfArticle = categoryOfArticle;
	}

	public String getSoftwareTypeOfArticle() {
		return softwareTypeOfArticle;
	}

	public void setSoftwareTypeOfArticle(String softwareTypeOfArticle) {
		this.softwareTypeOfArticle = softwareTypeOfArticle;
	}

	public String getDevelopTageOfArticle() {
		return developTageOfArticle;
	}

	public void setDevelopTageOfArticle(String developTageOfArticle) {
		this.developTageOfArticle = developTageOfArticle;
	}

	public Date getCreatedtimeOfArticle() {
		return createdtimeOfArticle;
	}

	public void setCreatedtimeOfArticle(Date createdtimeOfArticle) {
		this.createdtimeOfArticle = createdtimeOfArticle;
	}

	public Category getCategoryOfArticleNEW() {
		return categoryOfArticleNEW;
	}

	public void setCategoryOfArticleNEW(Category categoryOfArticleNEW) {
		this.categoryOfArticleNEW = categoryOfArticleNEW;
	}

	public SoftwareType getTypeOfArticleNEW() {
		return typeOfArticleNEW;
	}

	public void setTypeOfArticleNEW(SoftwareType typeOfArticleNEW) {
		this.typeOfArticleNEW = typeOfArticleNEW;
	}

	public DevelopmentStage getStageOfArticleNEW() {
		return stageOfArticleNEW;
	}

	public void setStageOfArticleNEW(DevelopmentStage stageOfArticleNEW) {
		this.stageOfArticleNEW = stageOfArticleNEW;
	}

}