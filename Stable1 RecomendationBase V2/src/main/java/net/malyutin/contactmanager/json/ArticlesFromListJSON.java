package net.malyutin.contactmanager.json;

import net.schastny.contactmanager.domain.Article;

public class ArticlesFromListJSON {

	private int ident;
	private String title;
	private String author;
	
	
	public ArticlesFromListJSON(Article article) {
		// TODO Auto-generated constructor stub
		ident = article.getId();
		title = article.getTitleOfArticle();
		author = article.getAuthorOfArticle();	
		
	}
	
	
	public int getIdent() {
		return ident;
	}
	public void setIdent(int ident) {
		this.ident = ident;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	
	
}
