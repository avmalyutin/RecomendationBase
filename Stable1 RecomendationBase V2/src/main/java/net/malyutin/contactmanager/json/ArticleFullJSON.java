package net.malyutin.contactmanager.json;

import java.text.SimpleDateFormat;
import java.util.Date;

import net.schastny.contactmanager.domain.Article;

public class ArticleFullJSON extends ArticlesFromListJSON {
	
	
	
	private String datOfCreation;
	private String category;
	private String type;
	private String stage;
	private String content;
	
	public ArticleFullJSON(Article article) {
		super(article);
		datOfCreation = this.getFormattedDate(article.getCreatedtimeOfArticle());
		category = article.getCategoryOfArticleNEW().getDescriptionOfCategory();
		type = article.getTypeOfArticleNEW().getDescriptionOfType();
		stage = article.getStageOfArticleNEW().getDescriptionOfStage();
		content = article.getContentOfArticle();
		
	}
	
	
	public String getFormattedDate(Date bufferTime){
  		SimpleDateFormat dateformatyyyyMMdd = new SimpleDateFormat("EEE, dd MMM yyyy 'в' HH:mm ");
  		if(dateformatyyyyMMdd != null && bufferTime != null){
  			String buffer = dateformatyyyyMMdd.format(bufferTime);
  			return buffer;
  		}
  		return "error";
  	}
	
	
	
	public String getDatOfCreation() {
		return datOfCreation;
	}
	public void setDatOfCreation(String datOfCreation) {
		this.datOfCreation = datOfCreation;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
	

}
